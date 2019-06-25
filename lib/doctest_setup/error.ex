defmodule DoctestSetup.Error do
  @moduledoc false

  defexception []

  @impl true
  def exception(_value), do: %__MODULE__{}

  @impl true
  def message(_exception) do
    "DoctestSetup can only be used in modules using ExUnit"
  end
end
