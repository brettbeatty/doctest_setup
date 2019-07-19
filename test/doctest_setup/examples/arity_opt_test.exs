defmodule DoctestSetup.Examples.ArityOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  alias DoctestSetup.Examples.ArityOpt
  doctest ArityOpt, import: true

  setup_doctest arity: arity do
    Process.put(:arity, arity)
    :ok
  end

  setup_doctest arity: nil do
    Process.put(:value, :moduledoc)
    :ok
  end

  setup_doctest arity: 0 do
    Process.put(:value, :zero)
    :ok
  end

  setup_doctest arity: 1 do
    Process.put(:value, :one)
    :ok
  end
end
