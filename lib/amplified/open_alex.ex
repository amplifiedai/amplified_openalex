defmodule Amplified.OpenAlex do
  @moduledoc """
  OpenAlex API client for Elixir.

  Generated from the [OpenAlex OpenAPI specification](https://developers.openalex.org/api-reference/openapi.json)
  using [oapi_generator](https://hex.pm/packages/oapi_generator).

  ## Configuration

      config :amplified_openalex,
        api_key: System.get_env("OPENALEX_API_KEY"),
        base_url: "https://api.openalex.org"

  ## Usage

  All API operations are available through typed operation modules:

      # Search for works
      Amplified.OpenAlex.Works.list_works(search: "deep body thermometer", per_page: 100)

      # Get a single work by ID
      Amplified.OpenAlex.Works.get_work("W2741809807")

      # Look up by DOI
      Amplified.OpenAlex.Works.get_work("doi:10.1016/j.sna.2020.112098")

      # Search authors
      Amplified.OpenAlex.Authors.list_authors(search: "Ishida")

  Responses are decoded into typed structs (e.g. `%Amplified.OpenAlex.Work{}`).

  ## Abstract Reconstruction

  OpenAlex returns abstracts as inverted indexes. Use `Amplified.InvertedIndex`
  to reconstruct the plain text:

      {:ok, work} = Amplified.OpenAlex.Works.get_work("W2741809807")
      abstract = Amplified.InvertedIndex.to_text(work.abstract_inverted_index)

  """
end
