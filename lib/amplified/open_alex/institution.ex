defmodule Amplified.OpenAlex.Institution do
  @moduledoc """
  Provides struct and type for a Institution
  """

  @type t :: %__MODULE__{
          cited_by_count: integer | nil,
          country_code: String.t() | nil,
          counts_by_year: [Amplified.OpenAlex.InstitutionCountsByYear.t()] | nil,
          created_date: Date.t() | nil,
          display_name: String.t() | nil,
          display_name_acronyms: [String.t()] | nil,
          display_name_alternatives: [String.t()] | nil,
          geo: Amplified.OpenAlex.InstitutionGeo.t() | nil,
          homepage_url: String.t() | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.InstitutionIds.t() | nil,
          image_thumbnail_url: String.t() | nil,
          image_url: String.t() | nil,
          lineage: [String.t()] | nil,
          ror: String.t() | nil,
          summary_stats: Amplified.OpenAlex.InstitutionSummaryStats.t() | nil,
          type: String.t() | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :cited_by_count,
    :country_code,
    :counts_by_year,
    :created_date,
    :display_name,
    :display_name_acronyms,
    :display_name_alternatives,
    :geo,
    :homepage_url,
    :id,
    :ids,
    :image_thumbnail_url,
    :image_url,
    :lineage,
    :ror,
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
      cited_by_count: :integer,
      country_code: :string,
      counts_by_year: [{Amplified.OpenAlex.InstitutionCountsByYear, :t}],
      created_date: {:string, "date"},
      display_name: :string,
      display_name_acronyms: [:string],
      display_name_alternatives: [:string],
      geo: {Amplified.OpenAlex.InstitutionGeo, :t},
      homepage_url: :string,
      id: :string,
      ids: {Amplified.OpenAlex.InstitutionIds, :t},
      image_thumbnail_url: :string,
      image_url: :string,
      lineage: [:string],
      ror: :string,
      summary_stats: {Amplified.OpenAlex.InstitutionSummaryStats, :t},
      type:
        {:enum,
         [
           "education",
           "healthcare",
           "company",
           "archive",
           "nonprofit",
           "government",
           "facility",
           "other"
         ]},
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
