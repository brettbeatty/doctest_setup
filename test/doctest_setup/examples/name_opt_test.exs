defmodule DoctestSetup.Examples.NameOptTest do
  use ExUnit.Case, async: true
  use DoctestSetup
  doctest DoctestSetup.Examples.NameOpt, import: true

  setup_doctest name: name do
    Process.put(:name, name)
    :ok
  end

  setup_doctest name: nil do
    Process.put(:value, 3)
    :ok
  end

  setup_doctest name: :alpha do
    Process.put(:value, 4)
    :ok
  end

  setup_doctest name: :bravo do
    Process.put(:value, 5)
    :ok
  end
end
