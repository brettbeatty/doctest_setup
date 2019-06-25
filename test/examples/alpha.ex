defmodule Alpha do
  @moduledoc """
  A module that does something.

      iex> accumulator()
      [:aardvark, :abyss, :activate]

      iex> accumulator()
      [:adamant, :aerosol, :aft]

  """

  @doc """
  Current accumulator.

      iex> accumulator()
      []

      iex> accumulator()
      [:agriculture, :ahem]

      iex> accumulator()
      [:aim]

  """
  def accumulator do
    Process.get(__MODULE__, [])
  end

  @doc """
  Add to accumulator.

      iex> add(:ajar)
      [:ajar]
      iex> add(:akin)
      [:akin, :ajar]

      iex> add(:alarm)
      [:alarm, :ammonia]

  """
  def add(item) do
    value = [item | Process.get(__MODULE__, [])]
    Process.put(__MODULE__, value)
    value
  end
end
