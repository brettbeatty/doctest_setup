defmodule DoctestSetup do
  @moduledoc """
  Defines doctest setup callbacks.

  Typically doctests work best for stateless functions. Including setup in the doctetst itself can
  sacrifice readability. DoctestSetup lets us move that setup out of our doctests and into our test
  cases.
  """

  defmacro __using__(_opts) do
    quote do
      import unquote(__MODULE__), only: [doctest_setup: 1, doctest_setup: 2]
      @before_compile unquote(__MODULE__.Meta)
    end
  end

  @doc """
  Defines a callback to be run before doctests, matching on the provided options.

  This macro builds on `ExUnit.Callbacks.setup/2` callbacks, so blocks should return the values
  described in the [Context](https://hexdocs.pm/ex_unit/ExUnit.Callbacks.html#module-context)
  section of the `ExUnit.Callbacks` docs.

  The same doctest can be setup by multiple `doctest_setup` blocks.

  ## Options

  The options listed are matched upon, so we can either pass in concrete values or match values out.
  Any doctests not matching on the provided options are skipped by the setup block.

    - `:arity` - The arity of the target function. For moduledoc doctests, this will be `nil`.
    - `:context` - The context of the doctest. See
      [Context](https://hexdocs.pm/ex_unit/ExUnit.Callbacks.html#module-context).
    - `:module` - The module of the target function.
    - `:name` - The name of the target function. For moduledoc doctests, this will be `nil`.
    - `:ordinal` - Which doctest in the doctstring to setup. The first doctest in each docstring is
      `0`, and each subsequent doctest's ordinal is 1 greater than the previous.

  ## Example

      defmodule MyAppTest do
        use ExUnit.Case, async: true
        use DoctestSetup
        doctest MyApp

        doctest_setup name: :hello do
          # do something stateful
          :ok
        end

        doctest_setup name: name, arity: arity do
          # do something with name and arity
          [value: value]
        end
      end

  """
  defmacro doctest_setup(opts \\ [], block)

  defmacro doctest_setup(opts, do: block) do
    check_for_ex_unit!(__CALLER__)

    quote do
      setup context do
        with %{test_type: :doctest} <- context,
             %{unquote_splicing(opts)} <- __doctest_setup_meta__(context) do
          unquote(block)
        else
          _ ->
            :ok
        end
      end
    end
  end

  defp check_for_ex_unit!(env) do
    unless {:setup, 2} in Keyword.get(env.macros, ExUnit.Callbacks, []) do
      raise __MODULE__.Error
    end
  end
end
