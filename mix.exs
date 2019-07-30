defmodule DoctestSetup.MixProject do
  use Mix.Project

  def project do
    [
      app: :doctest_setup,
      name: "DoctestSetup",
      version: "0.1.0",
      description: "Set up stateful doctests",
      source_url: "https://github.com/brettbeatty/doctest_setup",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(),
      package: [
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/brettbeatty/doctest_setup"}
      ],
      docs: [
        api_reference: false,
        main: "DoctestSetup"
      ],
      start_permanent: Mix.env() == :prod,
      deps: [
        {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
        {:ex_doc, "~> 0.21", only: [:dev, :test]}
      ]
    ]
  end

  defp elixirc_paths do
    case Mix.env() do
      :test ->
        ["lib", "test/doctest_setup/examples"]

      _ ->
        ["lib"]
    end
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end
end
