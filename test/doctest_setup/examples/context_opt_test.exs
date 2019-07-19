defmodule DoctestSetup.Examples.ContextOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  alias DoctestSetup.Examples.ContextOpt
  doctest ContextOpt, import: true

  setup_doctest name: nil do
    [value: :bravo]
  end

  setup_doctest name: :alpha, ordinal: 0 do
    [value: :charlie]
  end

  setup_doctest name: :alpha, ordinal: 1 do
    [value: :delta]
  end

  setup_doctest name: :alpha, ordinal: 2 do
    [value: nil]
  end

  setup_doctest context: %{value: nil} do
    [value: :echo]
  end

  setup_doctest context: context do
    Process.put(:value, context.value)
    :ok
  end
end
