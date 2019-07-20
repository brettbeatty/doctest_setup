defmodule DoctestSetup do
  @moduledoc """
  Allows setting up doctests.
  """
  alias __MODULE__.{Macro, Meta}

  defmacro __using__(_opts) do
    quote do
      import unquote(Macro), only: [doctest_setup: 1, doctest_setup: 2]
      @before_compile unquote(Meta)
    end
  end
end
