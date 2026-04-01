defmodule Amplified.OpenAlex.Languages do
  @moduledoc """
  Provides API endpoints related to languages
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Get a single language

  Retrieve a single language by its ISO 639-1 code.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_language(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Language.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_language(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Languages, :get_language},
      url: "/languages/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Language, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List languages

  Get a list of languages used in scholarly works.

  ## Options

    * `filter`: Filter languages. Examples: `id:en` (English), `works_count:>100000` See [all Language fields](/api-reference/languages#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`. Prefix with `-` for descending. See [all Language fields](/api-reference/languages#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `group_by`: Group results by a field and return counts. Available fields vary by entity type. See [all Language fields](/api-reference/languages#available-filter-sort-and-group_by-fields).
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_languages(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.LanguagesListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_languages(opts \\ []) do
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
      call: {Amplified.OpenAlex.Languages, :list_languages},
      url: "/languages",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.LanguagesListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
