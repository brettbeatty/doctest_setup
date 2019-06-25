defmodule DoctestSetup.MixProject do
  use Mix.Project

  def project do
    [
      app: :doctest_setup,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(),
      start_permanent: Mix.env() == :prod
    ]
  end

  defp elixirc_paths do
    if Mix.env() == :test do
      ["lib", "test/examples"]
    else
      ["lib"]
    end
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end
end
