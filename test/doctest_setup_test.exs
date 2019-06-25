defmodule DoctestSetupTest do
  use DoctestSetup
  use ExUnit.Case, async: true
  alias Delta.Charlie.Bravo
  doctest Alpha, import: true
  doctest Bravo, import: true

  setup_doctest module: Alpha, name: nil, ordinal: 0 do
    Process.put(Alpha, [:aardvark, :abyss, :activate])
    :ok
  end

  setup_doctest module: Alpha, name: nil, ordinal: 1 do
    Process.put(Alpha, [:adamant, :aerosol, :aft])
    :ok
  end

  setup_doctest name: :accumulator, ordinal: 1 do
    Process.put(Alpha, [:agriculture, :ahem])
    :ok
  end

  setup_doctest name: :accumulator, ordinal: 2 do
    Process.put(Alpha, [:aim])
    :ok
  end

  setup_doctest name: :add, ordinal: 1 do
    Process.put(Alpha, [:ammonia])
    :ok
  end

  setup_doctest module: Bravo, name: nil do
    Process.put(Bravo, [:baa])
    :ok
  end

  setup_doctest name: :bop do
    Process.put(Bravo, [:bad])
    :ok
  end

  describe "Alpha" do
    doctest Alpha, import: true
  end

  describe "Bravo" do
    doctest Bravo, import: true
  end
end
