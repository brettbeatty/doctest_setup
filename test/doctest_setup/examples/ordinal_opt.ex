defmodule DoctestSetup.Examples.OrdinalOpt do
  @moduledoc """

    iex> Process.get(:ordinal)
    0
    iex> Process.get(:value)
    :zero

    iex> Process.get(:ordinal)
    1
    iex> Process.get(:value)
    :one

  """

  @doc """

    iex> Process.get(:ordinal)
    0
    iex> Process.get(:value)
    :zero
    iex> alpha()
    0

    iex> Process.get(:ordinal)
    1
    iex> Process.get(:value)
    :one
    iex> alpha()
    5

  """
  def alpha, do: Process.get(:ordinal) * 5
end
