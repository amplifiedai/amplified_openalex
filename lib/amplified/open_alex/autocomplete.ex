defmodule Amplified.OpenAlex.Autocomplete do
  @moduledoc """
  Provides API endpoint related to autocomplete
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Autocomplete search

  Fast typeahead search returning up to 10 results. Use for search-as-you-type interfaces.

  ## Options

    * `q`: Search query string
    * `filter`: Filter results using field:value syntax. Multiple filters can be combined with commas (AND) or pipes (OR). Available fields vary by entity type.
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec autocomplete(entity_type :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.AutocompleteResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def autocomplete(entity_type, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :filter, :q])

    client.request(%{
      args: [entity_type: entity_type],
      call: {Amplified.OpenAlex.Autocomplete, :autocomplete},
      url: "/autocomplete/#{entity_type}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.AutocompleteResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
