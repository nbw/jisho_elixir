defmodule JishoElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app: :jisho_elixir,
      version: "0.0.1",
      description: "Jisho.org API client for Elixir.",
      elixir: "~> 1.5",
      deps: deps(),
      package: package(),
      source_url: "https://github.com/nbw/jisho_elixir"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.11", only: :dev},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [maintainers: ["Nathan Willson"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/nbw/jisho_elixir"}]
  end
end
