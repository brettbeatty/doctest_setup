defmodule DoctestSetup.Examples.ContextOpt do
  @moduledoc """

    iex> Process.get(:value)
    :bravo

  """

  @doc """

    iex> Process.get(:value)
    :charlie

    iex> Process.get(:value)
    :delta

    iex> alpha()
    "value: echo"

  """
  def alpha, do: "value: #{Process.get(:value)}"
end
