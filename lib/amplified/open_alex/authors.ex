defmodule Amplified.OpenAlex.Authors do
  @moduledoc """
  Provides API endpoints related to authors
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single author

  Retrieve a single author by OpenAlex ID or ORCID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_author(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Author.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_author(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Authors, :get_author},
      url: "/authors/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Author, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List authors

  Get a list of authors with optional filtering, searching, sorting, and pagination.

  ## Options

    * `filter`: Filter authors. Examples: `has_orcid:true`, `last_known_institutions.id:I27837315`, `works_count:>100`, `affiliations.institution.country_code:US` See [all Author fields](/api-reference/authors#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`, `summary_stats.h_index`, `summary_stats.i10_index`. Prefix with `-` for descending. See [all Author fields](/api-reference/authors#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `last_known_institutions.country_code`, `last_known_institutions.type`, `has_orcid` See [all Author fields](/api-reference/authors#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_authors(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.AuthorsListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_authors(opts \\ []) do
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
      call: {Amplified.OpenAlex.Authors, :list_authors},
      url: "/authors",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.AuthorsListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
