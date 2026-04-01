defmodule Amplified.OpenAlex.Sources do
  @moduledoc """
  Provides API endpoints related to sources
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single source

  Retrieve a single source by OpenAlex ID or ISSN.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_source(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Source.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_source(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Sources, :get_source},
      url: "/sources/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Source, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List sources

  Get a list of sources (journals, repositories, conferences) with optional filtering, searching, sorting, and pagination.

  ## Options

    * `filter`: Filter sources. Examples: `is_oa:true`, `is_in_doaj:true`, `type:journal`, `country_code:US`, `host_organization:P4310320595` See [all Source fields](/api-reference/sources#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`, `summary_stats.h_index`. Prefix with `-` for descending. See [all Source fields](/api-reference/sources#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `type`, `country_code`, `is_oa`, `is_in_doaj` See [all Source fields](/api-reference/sources#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_sources(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.SourcesListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_sources(opts \\ []) do
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
      call: {Amplified.OpenAlex.Sources, :list_sources},
      url: "/sources",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.SourcesListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
