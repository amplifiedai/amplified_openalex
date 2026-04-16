defmodule Amplified.OpenAlex.MixProject do
  use Mix.Project

  @version "0.2.1"
  @source_url "https://github.com/amplifiedai/amplified_openalex"

  def project do
    [
      app: :amplified_openalex,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      name: "Amplified.OpenAlex",
      description: "OpenAlex API client for Elixir, generated from the OpenAPI specification",
      source_url: @source_url
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:amplified_inverted_index, "~> 0.1"},
      {:jason, "~> 1.0"},
      {:oapi_generator, "~> 0.4.0", only: :dev, runtime: false},
      {:plug, "~> 1.0"},
      {:req, "~> 0.3"},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "Amplified.OpenAlex",
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end
end
