defmodule DoctestSetup do
  alias __MODULE__.{Macro, Meta}

  defmacro __using__(_opts) do
    quote do
      import unquote(Macro), only: [setup_doctest: 1, setup_doctest: 2]
      @before_compile unquote(Meta)
    end
  end
end
