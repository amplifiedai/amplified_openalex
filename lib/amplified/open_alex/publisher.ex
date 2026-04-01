defmodule Amplified.OpenAlex.Publisher do
  @moduledoc """
  Provides struct and type for a Publisher
  """

  @type t :: %__MODULE__{
          alternate_titles: [String.t()] | nil,
          cited_by_count: integer | nil,
          country_codes: [String.t()] | nil,
          counts_by_year: [Amplified.OpenAlex.PublisherCountsByYear.t()] | nil,
          created_date: Date.t() | nil,
          display_name: String.t() | nil,
          hierarchy_level: integer | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.PublisherIds.t() | nil,
          lineage: [String.t()] | nil,
          parent_publisher: Amplified.OpenAlex.PublisherParentPublisher.t() | nil,
          sources_api_url: String.t() | nil,
          updated_date: DateTime.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :alternate_titles,
    :cited_by_count,
    :country_codes,
    :counts_by_year,
    :created_date,
    :display_name,
    :hierarchy_level,
    :id,
    :ids,
    :lineage,
    :parent_publisher,
    :sources_api_url,
    :updated_date,
    :works_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      alternate_titles: [:string],
      cited_by_count: :integer,
      country_codes: [:string],
      counts_by_year: [{Amplified.OpenAlex.PublisherCountsByYear, :t}],
      created_date: {:string, "date"},
      display_name: :string,
      hierarchy_level: :integer,
      id: :string,
      ids: {Amplified.OpenAlex.PublisherIds, :t},
      lineage: [:string],
      parent_publisher: {Amplified.OpenAlex.PublisherParentPublisher, :t},
      sources_api_url: :string,
      updated_date: {:string, "date-time"},
      works_count: :integer
    ]
  end
end
