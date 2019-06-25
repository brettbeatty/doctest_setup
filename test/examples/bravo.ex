defmodule Delta.Charlie.Bravo do
  @moduledoc """
  Bretends to be a stack.

      iex> bop()
      :baa
      iex> bush(:baby)
      :baby
      iex> bop()
      :baby

  """

  @doc """
  Pushes to stack.

      iex> bush(:bacon)
      :bacon

  """
  def bush(item) do
    Process.put(__MODULE__, [item | Process.get(__MODULE__, [])])
    item
  end

  @doc """
  Pops from stack.

      iex> bop()
      :bad

  """
  def bop do
    case Process.get(__MODULE__) do
      [head | tail] ->
        Process.put(__MODULE__, tail)
        head

      _ ->
        nil
    end
  end
end
