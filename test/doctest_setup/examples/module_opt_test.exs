defmodule DoctestSetup.Examples.ModuleOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  alias DoctestSetup.Examples.ModuleOpt.{Alpha, Bravo}
  doctest Alpha
  doctest Bravo

  setup_doctest module: module do
    Process.put(:module, module)
    :ok
  end

  setup_doctest module: Alpha do
    Process.put(:value, :alpha)
    :ok
  end

  setup_doctest module: Bravo do
    Process.put(:value, :bravo)
    :ok
  end
end
