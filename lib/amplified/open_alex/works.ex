defmodule Amplified.OpenAlex.Works do
  @moduledoc """
  Provides API endpoints related to works
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single work

  Retrieve a single work by its OpenAlex ID or external ID (DOI, PMID, PMCID, MAG ID). External IDs can be passed as full URLs or URN format (e.g., `doi:10.1234/example` or `pmid:12345678`).

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_work(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Work.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_work(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Works, :get_work},
      url: "/works/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Work, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List works

  Get a list of scholarly works with optional filtering, searching, sorting, and pagination. Works include journal articles, books, datasets, theses, and more.

  ## Options

    * `filter`: Filter works. Examples: `publication_year:2023`, `type:article`, `open_access.is_oa:true`, `author.id:A5023888391`, `institutions.id:I27837315`, `cited_by_count:>100` See [all Work fields](/api-reference/works#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `cited_by_count`, `publication_date`, `relevance_score` (with search). Prefix with `-` for descending. See [all Work fields](/api-reference/works#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `publication_year`, `type`, `open_access.is_oa`, `authorships.institutions.country_code` See [all Work fields](/api-reference/works#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `semantic_search`: Semantic search using GTE-Large embeddings. Finds conceptually related works even when terminology differs. Max 50 results per page. Example: `semantic_search=flexible temperature sensor for wearable devices`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_works(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.WorksListResponse.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def list_works(opts \\ []) do
    client = opts[:client] || @default_client

    {semantic_search, opts} = Keyword.pop(opts, :semantic_search)

    query =
      opts
      |> Keyword.take([
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
      |> maybe_add_semantic_search(semantic_search)

    client.request(%{
      args: [],
      call: {Amplified.OpenAlex.Works, :list_works},
      url: "/works",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.WorksListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {403, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  defp maybe_add_semantic_search(query, nil), do: query
  defp maybe_add_semantic_search(query, text), do: [{"search.semantic", text} | query]
end
