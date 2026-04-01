defmodule Amplified.OpenAlex.InstitutionTypes do
  @moduledoc """
  Provides API endpoint related to institution types
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  List institution types

  Get a list of institution types (education, healthcare, company, etc.).

  ## Options

    * `filter`: Filter institution types. Examples: `id:education`, `works_count:>1000000`
    * `sort`: Sort by: `works_count`, `cited_by_count`. Prefix with `-` for descending.
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `group_by`: Group results by a field and return counts. Available fields vary by entity type.
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_institution_types(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.InstitutionTypesListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_institution_types(opts \\ []) do
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
      call: {Amplified.OpenAlex.InstitutionTypes, :list_institution_types},
      url: "/institution-types",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.InstitutionTypesListResponse, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
