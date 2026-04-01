defmodule Amplified.OpenAlex.Topics do
  @moduledoc """
  Provides API endpoints related to topics
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Classify text (Aboutness)

  **DEPRECATED:** This endpoint is deprecated and not recommended for new projects. It will not receive updates or support.

  Classify arbitrary text to find relevant OpenAlex topics. Costs $0.01 per request.

  ## Options

    * `title`: Title text to classify
    * `abstract`: Abstract text to classify
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec classify_text(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.TextClassificationResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def classify_text(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:abstract, :api_key, :title])

    client.request(%{
      args: [],
      call: {Amplified.OpenAlex.Topics, :classify_text},
      url: "/text/topics",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.TextClassificationResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a single topic

  Retrieve a single topic by OpenAlex ID.

  ## Options

    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_topic(id :: String.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Topic.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_topic(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key, :select])

    client.request(%{
      args: [id: id],
      call: {Amplified.OpenAlex.Topics, :get_topic},
      url: "/topics/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Topic, :t}},
        {404, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List topics

  Get a list of topics with optional filtering, searching, sorting, and pagination. Topics are research areas automatically assigned to works.

  ## Options

    * `filter`: Filter topics. Examples: `domain.id:1`, `field.id:17`, `subfield.id:1702`, `works_count:>1000` See [all Topic fields](/api-reference/topics#available-filter-sort-and-group_by-fields).
    * `sort`: Sort by: `works_count`, `cited_by_count`. Prefix with `-` for descending. See [all Topic fields](/api-reference/topics#available-filter-sort-and-group_by-fields).
    * `group_by`: Group by: `domain.id`, `field.id`, `subfield.id` See [all Topic fields](/api-reference/topics#available-filter-sort-and-group_by-fields).
    * `search`: Full-text search across titles, abstracts, and other text fields. Example: `search=machine learning`
    * `per_page`: Number of results per page (1-100, default 25)
    * `page`: Page number for pagination. Use cursor for deep pagination beyond 10,000 results.
    * `cursor`: Cursor for deep pagination. Use `cursor=*` to start, then use the `next_cursor` from the response.
    * `sample`: Return a random sample of N results (max 10,000). Cannot be used with sort or page.
    * `select`: Comma-separated list of fields to return. Reduces response size. Example: `select=id,display_name,cited_by_count`
    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_topics(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.TopicsListResponse.t()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_topics(opts \\ []) do
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
      call: {Amplified.OpenAlex.Topics, :list_topics},
      url: "/topics",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.TopicsListResponse, :t}},
        {400, {Amplified.OpenAlex.Error, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
