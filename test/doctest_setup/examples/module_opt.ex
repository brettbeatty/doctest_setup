defmodule DoctestSetup.Examples.ModuleOpt do
  @moduledoc false

  defmodule Alpha do
    @moduledoc """

      iex> Process.get(:module)
      #{__MODULE__}

      iex> Process.get(:value)
      :alpha

    """
  end

  defmodule Bravo do
    @moduledoc """

      iex> Process.get(:module)
      #{__MODULE__}

      iex> Process.get(:value)
      :bravo

    """
  end
end
