defmodule Amplified.OpenAlex.Fields do
  @moduledoc """
  Provides API endpoints related to fields
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single field

  Retrieve a single field by its ID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_field(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Field.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_field(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Fields, :get_field},
      url: "/fields/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Field, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List fields

  Get a list of fields (second-level topic categories). There are 26 fields spread across 4 domains.

  ## Options

    * `filter`: Filter fields. Examples: `domain.id:1`, `works_count:>1000000` See [all Field fields](/api-reference/fields#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`. Prefix with `-` for descending. See [all Field fields](/api-reference/fields#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `domain.id` See [all Field fields](/api-reference/fields#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_fields(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.FieldsListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_fields(opts \\ []) do
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
      call: {Amplified.OpenAlex.Fields, :list_fields},
      url: "/fields",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.FieldsListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
