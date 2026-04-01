defmodule Amplified.OpenAlex.Funders do
  @moduledoc """
  Provides API endpoints related to funders
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single funder

  Retrieve a single funder by OpenAlex ID or Crossref Funder ID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_funder(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Funder.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_funder(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Funders, :get_funder},
      url: "/funders/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Funder, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List funders

  Get a list of funders with optional filtering, searching, sorting, and pagination.

  ## Options

    * `filter`: Filter funders. Examples: `country_code:US`, `is_global_south:true`, `continent:Q46` See [all Funder fields](/api-reference/funders#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`, `awards_count`. Prefix with `-` for descending. See [all Funder fields](/api-reference/funders#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `country_code`, `continent`, `is_global_south` See [all Funder fields](/api-reference/funders#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_funders(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.FundersListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_funders(opts \\ []) do
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
      call: {Amplified.OpenAlex.Funders, :list_funders},
      url: "/funders",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.FundersListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
