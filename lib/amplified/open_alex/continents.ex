defmodule Amplified.OpenAlex.Continents do
  @moduledoc """
  Provides API endpoints related to continents
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single continent

  Retrieve a single continent by its Wikidata Q-ID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_continent(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Continent.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_continent(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Continents, :get_continent},
      url: "/continents/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Continent, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List continents

  Get a list of continents (7 total).

  ## Options

    * `filter`: Filter continents. Examples: `id:Q46` (Europe), `works_count:>10000000` See [all Continent fields](/api-reference/continents#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`. Prefix with `-` for descending. See [all Continent fields](/api-reference/continents#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `group_by`: Group results by a field and return counts. Available fields vary by entity type. See [all Continent fields](/api-reference/continents#available-filter-sort-and-group_by-fields).
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_continents(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.ContinentsListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_continents(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_key,
        :cursor,
        :filter,
        :group_by,
        :page,
        :per_page,
        :sample,
        :search,
        :select,
        :sort
      ])

    client.request(%{
      args: [],
      call: {Amplified.OpenAlex.Continents, :list_continents},
      url: "/continents",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.ContinentsListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
