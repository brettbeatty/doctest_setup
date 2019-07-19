defmodule DoctestSetup.Examples.NameOpt do
  @moduledoc """

    iex> Process.get(:name)
    nil

    iex> Process.get(:value)
    3

  """

  @doc """

    iex> Process.get(:name)
    :alpha

    iex> Process.get(:value)
    4

    iex> alpha()
    8

  """
  def alpha, do: Process.get(:value) * 2

  @doc """

    iex> Process.get(:name)
    :bravo

    iex> Process.get(:value)
    5

    iex> bravo()
    6

  """
  def bravo, do: Process.get(:value) + 1
end
