defmodule Amplified.OpenAlex.Source do
  @moduledoc """
  Provides struct and type for a Source
  """

  @type t :: %__MODULE__{
          apc_usd: integer | nil,
          cited_by_count: integer | nil,
          counts_by_year: [Amplified.OpenAlex.SourceCountsByYear.t()] | nil,
          created_date: Date.t() | nil,
          display_name: String.t() | nil,
          homepage_url: String.t() | nil,
          host_organization: String.t() | nil,
          host_organization_lineage: [String.t()] | nil,
          host_organization_name: String.t() | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.SourceIds.t() | nil,
          is_in_doaj: boolean | nil,
          is_oa: boolean | nil,
          issn: [String.t()] | nil,
          issn_l: String.t() | nil,
          summary_stats: Amplified.OpenAlex.SourceSummaryStats.t() | nil,
          type: String.t() | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :apc_usd,
    :cited_by_count,
    :counts_by_year,
    :created_date,
    :display_name,
    :homepage_url,
    :host_organization,
    :host_organization_lineage,
    :host_organization_name,
    :id,
    :ids,
    :is_in_doaj,
    :is_oa,
    :issn,
    :issn_l,
    :summary_stats,
    :type,
    :updated_date,
    :works_api_url,
    :works_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apc_usd: :integer,
      cited_by_count: :integer,
      counts_by_year: [{Amplified.OpenAlex.SourceCountsByYear, :t}],
      created_date: {:string, "date"},
      display_name: :string,
      homepage_url: :string,
      host_organization: :string,
      host_organization_lineage: [:string],
      host_organization_name: :string,
      id: :string,
      ids: {Amplified.OpenAlex.SourceIds, :t},
      is_in_doaj: :boolean,
      is_oa: :boolean,
      issn: [:string],
      issn_l: :string,
      summary_stats: {Amplified.OpenAlex.SourceSummaryStats, :t},
      type: {:enum, ["journal", "repository", "conference", "ebook platform", "book series"]},
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
