defmodule DoctestSetupTest do
  use ExUnit.Case
  doctest DoctestSetup

  test "greets the world" do
    assert DoctestSetup.hello() == :world
  end
end
