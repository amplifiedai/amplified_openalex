defmodule Amplified.OpenAlex.Changefiles do
  @moduledoc """
  Provides API endpoints related to changefiles
  """

  @default_client Amplified.OpenAlex.Client

  @type get_changefile_200_json_resp :: %{
          meta: Amplified.OpenAlex.Changefiles.get_changefile_200_json_resp_meta() | nil,
          results: [Amplified.OpenAlex.Changefiles.get_changefile_200_json_resp_results()] | nil
        }

  @type get_changefile_200_json_resp_meta :: %{count: integer | nil, date: Date.t() | nil}

  @type get_changefile_200_json_resp_results :: %{
          entity: String.t() | nil,
          formats:
            Amplified.OpenAlex.Changefiles.get_changefile_200_json_resp_results_formats() | nil,
          records: integer | nil
        }

  @type get_changefile_200_json_resp_results_formats :: %{
          jsonl:
            Amplified.OpenAlex.Changefiles.get_changefile_200_json_resp_results_formats_jsonl()
            | nil,
          parquet:
            Amplified.OpenAlex.Changefiles.get_changefile_200_json_resp_results_formats_parquet()
            | nil
        }

  @type get_changefile_200_json_resp_results_formats_jsonl :: %{
          size_bytes: integer | nil,
          size_display: String.t() | nil,
          url: String.t() | nil
        }

  @type get_changefile_200_json_resp_results_formats_parquet :: %{
          size_bytes: integer | nil,
          size_display: String.t() | nil,
          url: String.t() | nil
        }

  @doc """
  Get changefile for a date

  Get details for a specific date's changefile, including which entity types changed, how many records, and download links in JSONL and Parquet formats. For a full guide on using changefiles to keep your local data current, see [Download Changefiles](/download/changefiles).

  ## Options

    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_changefile(date :: Date.t(), opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Changefiles.get_changefile_200_json_resp()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def get_changefile(date, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key])

    client.request(%{
      args: [date: date],
      call: {Amplified.OpenAlex.Changefiles, :get_changefile},
      url: "/changefiles/#{date}",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Changefiles, :get_changefile_200_json_resp}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @type list_changefiles_200_json_resp :: %{
          meta: Amplified.OpenAlex.Changefiles.list_changefiles_200_json_resp_meta() | nil,
          results: [Amplified.OpenAlex.Changefiles.list_changefiles_200_json_resp_results()] | nil
        }

  @type list_changefiles_200_json_resp_meta :: %{count: integer | nil}

  @type list_changefiles_200_json_resp_results :: %{date: Date.t() | nil, url: String.t() | nil}

  @doc """
  List changefile dates

  List all available changefile dates. Each date has downloadable files containing every entity record that was created or modified on that day. For a full guide on using changefiles to keep your local data current, see [Download Changefiles](/download/changefiles).

  ## Options

    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec list_changefiles(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.Changefiles.list_changefiles_200_json_resp()}
          | {:error, Amplified.OpenAlex.Error.t()}
  def list_changefiles(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key])

    client.request(%{
      args: [],
      call: {Amplified.OpenAlex.Changefiles, :list_changefiles},
      url: "/changefiles",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.Changefiles, :list_changefiles_200_json_resp}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_changefile_200_json_resp) do
    [
      meta: {Amplified.OpenAlex.Changefiles, :get_changefile_200_json_resp_meta},
      results: [{Amplified.OpenAlex.Changefiles, :get_changefile_200_json_resp_results}]
    ]
  end

  def __fields__(:get_changefile_200_json_resp_meta) do
    [count: :integer, date: {:string, "date"}]
  end

  def __fields__(:get_changefile_200_json_resp_results) do
    [
      entity: :string,
      formats: {Amplified.OpenAlex.Changefiles, :get_changefile_200_json_resp_results_formats},
      records: :integer
    ]
  end

  def __fields__(:get_changefile_200_json_resp_results_formats) do
    [
      jsonl:
        {Amplified.OpenAlex.Changefiles, :get_changefile_200_json_resp_results_formats_jsonl},
      parquet:
        {Amplified.OpenAlex.Changefiles, :get_changefile_200_json_resp_results_formats_parquet}
    ]
  end

  def __fields__(:get_changefile_200_json_resp_results_formats_jsonl) do
    [size_bytes: :integer, size_display: :string, url: {:string, "uri"}]
  end

  def __fields__(:get_changefile_200_json_resp_results_formats_parquet) do
    [size_bytes: :integer, size_display: :string, url: {:string, "uri"}]
  end

  def __fields__(:list_changefiles_200_json_resp) do
    [
      meta: {Amplified.OpenAlex.Changefiles, :list_changefiles_200_json_resp_meta},
      results: [{Amplified.OpenAlex.Changefiles, :list_changefiles_200_json_resp_results}]
    ]
  end

  def __fields__(:list_changefiles_200_json_resp_meta) do
    [count: :integer]
  end

  def __fields__(:list_changefiles_200_json_resp_results) do
    [date: {:string, "date"}, url: {:string, "uri"}]
  end
end
