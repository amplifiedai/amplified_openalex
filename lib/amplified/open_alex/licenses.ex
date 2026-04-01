defmodule Amplified.OpenAlex.Licenses do
  @moduledoc """
  Provides API endpoint related to licenses
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  List licenses

  Get a list of open access licenses (CC BY, CC BY-SA, etc.).

  ## Options

    * `filter`: Filter licenses. Examples: `id:cc-by`, `works_count:>100000`
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
  @spec list_licenses(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.LicensesListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_licenses(opts \\ []) do
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
      call: {Amplified.OpenAlex.Licenses, :list_licenses},
      url: "/licenses",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.LicensesListResponse, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
