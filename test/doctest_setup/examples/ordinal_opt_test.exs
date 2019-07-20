defmodule DoctestSetup.Examples.OrdinalOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  alias DoctestSetup.Examples.OrdinalOpt
  doctest OrdinalOpt, import: true

  doctest_setup ordinal: ordinal do
    Process.put(:ordinal, ordinal)
    :ok
  end

  doctest_setup ordinal: 0 do
    Process.put(:value, :zero)
    :ok
  end

  doctest_setup ordinal: 1 do
    Process.put(:value, :one)
    :ok
  end
end
