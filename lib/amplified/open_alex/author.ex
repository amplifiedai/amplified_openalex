defmodule Amplified.OpenAlex.Author do
  @moduledoc """
  Provides struct and type for a Author
  """

  @type t :: %__MODULE__{
          affiliations: [Amplified.OpenAlex.AuthorAffiliations.t()] | nil,
          cited_by_count: integer | nil,
          counts_by_year: [Amplified.OpenAlex.AuthorCountsByYear.t()] | nil,
          created_date: Date.t() | nil,
          display_name: String.t() | nil,
          display_name_alternatives: [String.t()] | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.AuthorIds.t() | nil,
          last_known_institutions: [Amplified.OpenAlex.DehydratedInstitution.t()] | nil,
          longest_name: String.t() | nil,
          orcid: String.t() | nil,
          parsed_longest_name: Amplified.OpenAlex.AuthorParsedLongestName.t() | nil,
          summary_stats: Amplified.OpenAlex.AuthorSummaryStats.t() | nil,
          topics: [Amplified.OpenAlex.AuthorTopics.t()] | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :affiliations,
    :cited_by_count,
    :counts_by_year,
    :created_date,
    :display_name,
    :display_name_alternatives,
    :id,
    :ids,
    :last_known_institutions,
    :longest_name,
    :orcid,
    :parsed_longest_name,
    :summary_stats,
    :topics,
    :updated_date,
    :works_api_url,
    :works_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      affiliations: [{Amplified.OpenAlex.AuthorAffiliations, :t}],
      cited_by_count: :integer,
      counts_by_year: [{Amplified.OpenAlex.AuthorCountsByYear, :t}],
      created_date: {:string, "date"},
      display_name: :string,
      display_name_alternatives: [:string],
      id: :string,
      ids: {Amplified.OpenAlex.AuthorIds, :t},
      last_known_institutions: [{Amplified.OpenAlex.DehydratedInstitution, :t}],
      longest_name: :string,
      orcid: :string,
      parsed_longest_name: {Amplified.OpenAlex.AuthorParsedLongestName, :t},
      summary_stats: {Amplified.OpenAlex.AuthorSummaryStats, :t},
      topics: [{Amplified.OpenAlex.AuthorTopics, :t}],
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
