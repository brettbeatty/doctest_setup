defmodule DoctestSetup.Examples.ArityOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  alias DoctestSetup.Examples.ArityOpt
  doctest ArityOpt, import: true

  doctest_setup arity: arity do
    Process.put(:arity, arity)
    :ok
  end

  doctest_setup arity: nil do
    Process.put(:value, :moduledoc)
    :ok
  end

  doctest_setup arity: 0 do
    Process.put(:value, :zero)
    :ok
  end

  doctest_setup arity: 1 do
    Process.put(:value, :one)
    :ok
  end
end
