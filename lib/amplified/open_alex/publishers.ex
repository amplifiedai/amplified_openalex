defmodule Amplified.OpenAlex.Publishers do
  @moduledoc """
  Provides API endpoints related to publishers
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single publisher

  Retrieve a single publisher by OpenAlex ID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_publisher(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Publisher.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_publisher(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Publishers, :get_publisher},
      url: "/publishers/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Publisher, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List publishers

  Get a list of publishers with optional filtering, searching, sorting, and pagination.

  ## Options

    * `filter`: Filter publishers. Examples: `country_codes:US`, `hierarchy_level:0`, `lineage:P4310319965` See [all Publisher fields](/api-reference/publishers#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`, `summary_stats.h_index`. Prefix with `-` for descending. See [all Publisher fields](/api-reference/publishers#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `country_codes`, `hierarchy_level` See [all Publisher fields](/api-reference/publishers#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_publishers(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.PublishersListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_publishers(opts \\ []) do
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
      call: {Amplified.OpenAlex.Publishers, :list_publishers},
      url: "/publishers",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.PublishersListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
