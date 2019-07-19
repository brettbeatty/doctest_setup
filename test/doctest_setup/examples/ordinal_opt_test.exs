defmodule DoctestSetup.Examples.OrdinalOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  alias DoctestSetup.Examples.OrdinalOpt
  doctest OrdinalOpt, import: true

  setup_doctest ordinal: ordinal do
    Process.put(:ordinal, ordinal)
    :ok
  end

  setup_doctest ordinal: 0 do
    Process.put(:value, :zero)
    :ok
  end

  setup_doctest ordinal: 1 do
    Process.put(:value, :one)
    :ok
  end
end
