defmodule Amplified.OpenAlex.Subfields do
  @moduledoc """
  Provides API endpoints related to subfields
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single subfield

  Retrieve a single subfield by its ID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_subfield(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Subfield.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_subfield(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Subfields, :get_subfield},
      url: "/subfields/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Subfield, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List subfields

  Get a list of subfields (third-level topic categories). There are 254 subfields spread across 26 fields.

  ## Options

    * `filter`: Filter subfields. Examples: `field.id:17`, `domain.id:3`, `works_count:>100000` See [all Subfield fields](/api-reference/subfields#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`. Prefix with `-` for descending. See [all Subfield fields](/api-reference/subfields#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `field.id`, `domain.id` See [all Subfield fields](/api-reference/subfields#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_subfields(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.SubfieldsListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_subfields(opts \\ []) do
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
      call: {Amplified.OpenAlex.Subfields, :list_subfields},
      url: "/subfields",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.SubfieldsListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
