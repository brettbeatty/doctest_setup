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
      elixirc_paths: if(Mix.env() == :test, do: ["lib", "test/examples"], else: ["lib"]),
      package: [
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/brettbeatty/doctest_setup"}
      ],
      start_permanent: Mix.env() == :prod,
      deps: [
        {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
        {:dialyxir, "~> 0.5", only: [:dev, :test]},
        {:ex_doc, "~> 0.20", only: [:dev, :test]}
      ],
      dialyzer: [
        plt_core_path: "_core_plt"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end
end
