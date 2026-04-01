defmodule Amplified.OpenAlex.Awards do
  @moduledoc """
  Provides API endpoints related to awards
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single award

  Retrieve a single award by its OpenAlex ID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_award(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.AwardFull.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_award(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Awards, :get_award},
      url: "/awards/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.AwardFull, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List awards

  Get a list of research grants and funding awards.

  ## Options

    * `filter`: Filter awards. Examples: `funder.id:F4320306076`, `start_year:2023`, `funded_outputs_count:>10` See [all Award fields](/api-reference/awards#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `funded_outputs_count`, `amount`, `start_year`. Prefix with `-` for descending. See [all Award fields](/api-reference/awards#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `funder.id`, `start_year`, `currency` See [all Award fields](/api-reference/awards#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_awards(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.AwardsListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_awards(opts \\ []) do
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
      call: {Amplified.OpenAlex.Awards, :list_awards},
      url: "/awards",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.AwardsListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
