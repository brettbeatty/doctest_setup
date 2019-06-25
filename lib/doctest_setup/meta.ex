defmodule DoctestSetup.Meta do
  @moduledoc false
  require Logger

  defstruct ~W[module name arity ordinal test context]a

  @function_doctest ~R|^doctest.* (?<mod>\w+(\.\w+)*)\.(?<name>\w+)/(?<arity>\d+) \((?<ord>\d+)\)$|
  @module_doctest ~R|^doctest.* module (?<mod>\w+(\.\w+)*) \((?<ord>\d+)\)$|

  defmacro __before_compile__(env) do
    quote do
      unquote(meta_map(env))
      def __doctest_setup_meta__(context), do: unquote(__MODULE__).handle_unparsed(context)
    end
  end

  defp meta_map(env) do
    env.module
    |> Module.definitions_in()
    |> Stream.flat_map(&parse/1)
    |> Enum.group_by(&{&1.module, &1.name, &1.arity})
    |> Stream.flat_map(&normalize_ordinals/1)
    |> Enum.map(&to_definitions/1)
  end

  defp parse({test, 1}) do
    test_name = Atom.to_string(test)

    with nil <- Regex.named_captures(@function_doctest, test_name),
         nil <- Regex.named_captures(@module_doctest, test_name) do
      []
    else
      %{"mod" => module, "name" => name, "arity" => arity, "ord" => ordinal} ->
        [
          %__MODULE__{
            module: String.to_existing_atom("Elixir." <> module),
            name: String.to_existing_atom(name),
            arity: String.to_integer(arity),
            ordinal: String.to_integer(ordinal),
            test: test
          }
        ]

      %{"mod" => module, "ord" => ordinal} ->
        [
          %__MODULE__{
            module: String.to_existing_atom("Elixir." <> module),
            ordinal: String.to_integer(ordinal),
            test: test
          }
        ]
    end
  end

  defp parse(_) do
    []
  end

  defp normalize_ordinals({_, meta}) do
    meta
    |> Enum.sort_by(& &1.ordinal)
    |> Stream.transform({nil, -1}, &with_new_ordinals/2)
  end

  defp with_new_ordinals(meta, {old_ordinal, new_ordinal}) do
    if meta.ordinal == old_ordinal do
      {[%{meta | ordinal: new_ordinal}], {meta.ordinal, new_ordinal}}
    else
      {[%{meta | ordinal: new_ordinal + 1}], {meta.ordinal, new_ordinal + 1}}
    end
  end

  defp to_definitions(meta) do
    quote do
      def __doctest_setup_meta__(context = %{test: unquote(meta.test)}) do
        %{unquote(Macro.escape(meta)) | context: context}
      end
    end
  end

  def handle_unparsed(context = %{test: test}) do
    """
    Could not parse doctest #{inspect(test)}. This doctest will get setup as if its module,
    function name, arity, and ordinal are all nil.
    """
    |> String.replace("\n", "")
    |> Logger.debug()

    %__MODULE__{context: context, test: test}
  end
end
