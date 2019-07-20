defmodule DoctestSetup.Examples.ContextOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  alias DoctestSetup.Examples.ContextOpt
  doctest ContextOpt, import: true

  doctest_setup name: nil do
    [value: :bravo]
  end

  doctest_setup name: :alpha, ordinal: 0 do
    [value: :charlie]
  end

  doctest_setup name: :alpha, ordinal: 1 do
    [value: :delta]
  end

  doctest_setup name: :alpha, ordinal: 2 do
    [value: nil]
  end

  doctest_setup context: %{value: nil} do
    [value: :echo]
  end

  doctest_setup context: context do
    Process.put(:value, context.value)
    :ok
  end
end
