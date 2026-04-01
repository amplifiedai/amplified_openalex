defmodule Amplified.OpenAlex.Concept do
  @moduledoc """
  Provides struct and type for a Concept
  """

  @type t :: %__MODULE__{
          ancestors: [any] | nil,
          cited_by_count: integer | nil,
          counts_by_year: [any] | nil,
          created_date: Date.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.ConceptIds.t() | nil,
          image_thumbnail_url: String.t() | nil,
          image_url: String.t() | nil,
          level: integer | nil,
          related_concepts: [any] | nil,
          updated_date: DateTime.t() | nil,
          wikidata: String.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :ancestors,
    :cited_by_count,
    :counts_by_year,
    :created_date,
    :description,
    :display_name,
    :id,
    :ids,
    :image_thumbnail_url,
    :image_url,
    :level,
    :related_concepts,
    :updated_date,
    :wikidata,
    :works_api_url,
    :works_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ancestors: [:unknown],
      cited_by_count: :integer,
      counts_by_year: [:unknown],
      created_date: {:string, "date"},
      description: :string,
      display_name: :string,
      id: :string,
      ids: {Amplified.OpenAlex.ConceptIds, :t},
      image_thumbnail_url: :string,
      image_url: :string,
      level: :integer,
      related_concepts: [:unknown],
      updated_date: {:string, "date-time"},
      wikidata: :string,
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
