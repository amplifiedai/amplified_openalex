defmodule Amplified.OpenAlex.Concepts do
  @moduledoc """
  Provides API endpoints related to concepts
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single concept (deprecated)

  **DEPRECATED:** Use Topics instead. Retrieve a single concept by OpenAlex ID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_concept(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Concept.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_concept(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Concepts, :get_concept},
      url: "/concepts/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Concept, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List concepts (deprecated)

  **DEPRECATED:** Use Topics instead. Get a list of concepts from the legacy taxonomy.

  ## Options

    * `filter`: Filter concepts. Examples: `level:0` (top-level), `ancestors.id:C41008148`, `wikidata_id:Q21198` See [all Concept fields](/api-reference/concepts#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`, `level`. Prefix with `-` for descending. See [all Concept fields](/api-reference/concepts#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `level` See [all Concept fields](/api-reference/concepts#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_concepts(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.ConceptsListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_concepts(opts \\ []) do
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
      call: {Amplified.OpenAlex.Concepts, :list_concepts},
      url: "/concepts",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.ConceptsListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
