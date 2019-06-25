defmodule DoctestSetup.Macro do
  @moduledoc false
  alias DoctestSetup.Error

  defmacro setup_doctest(opts \\ [], do: block) do
    check_for_ex_unit!(__CALLER__)

    quote do
      setup context do
        case __doctest_setup_meta__(context) do
          %{unquote_splicing(opts)} ->
            unquote(block)

          _ ->
            :ok
        end
      end
    end
  end

  defp check_for_ex_unit!(env) do
    unless {:setup, 2} in Keyword.get(env.macros, ExUnit.Callbacks, []) do
      raise Error
    end
  end
end
