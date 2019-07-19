defmodule DoctestSetup.Examples.ArityOpt do
  @moduledoc """

    iex> Process.get(:arity)
    nil

    iex> Process.get(:value)
    :moduledoc

  """

  @doc """

    iex> Process.get(:arity)
    0

    iex> Process.get(:value)
    :zero

    iex> alpha()
    "arity zero"

  """
  def alpha do
    "arity #{Process.get(:value)}"
  end

  @doc """

    iex> Process.get(:arity)
    1

    iex> Process.get(:value)
    :one

    iex> alpha(:bravo)
    "bravo one"

  """
  def alpha(key) do
    "#{key} #{Process.get(:value)}"
  end
end
