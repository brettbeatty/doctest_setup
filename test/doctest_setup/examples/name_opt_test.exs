defmodule DoctestSetup.Examples.NameOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  doctest DoctestSetup.Examples.NameOpt, import: true

  doctest_setup name: name do
    Process.put(:name, name)
    :ok
  end

  doctest_setup name: nil do
    Process.put(:value, 3)
    :ok
  end

  doctest_setup name: :alpha do
    Process.put(:value, 4)
    :ok
  end

  doctest_setup name: :bravo do
    Process.put(:value, 5)
    :ok
  end
end
