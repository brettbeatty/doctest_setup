defmodule DoctestSetup.Examples.ModuleOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  alias DoctestSetup.Examples.ModuleOpt.{Alpha, Bravo}
  doctest Alpha
  doctest Bravo

  doctest_setup module: module do
    Process.put(:module, module)
    :ok
  end

  doctest_setup module: Alpha do
    Process.put(:value, :alpha)
    :ok
  end

  doctest_setup module: Bravo do
    Process.put(:value, :bravo)
    :ok
  end
end
