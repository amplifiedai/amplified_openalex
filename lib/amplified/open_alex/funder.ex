defmodule Amplified.OpenAlex.Funder do
  @moduledoc """
  Provides struct and type for a Funder
  """

  @type t :: %__MODULE__{
          alternate_titles: [String.t()] | nil,
          cited_by_count: integer | nil,
          country_code: String.t() | nil,
          counts_by_year: [Amplified.OpenAlex.FunderCountsByYear.t()] | nil,
          created_date: Date.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          grants_count: integer | nil,
          homepage_url: String.t() | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.FunderIds.t() | nil,
          image_thumbnail_url: String.t() | nil,
          image_url: String.t() | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :alternate_titles,
    :cited_by_count,
    :country_code,
    :counts_by_year,
    :created_date,
    :description,
    :display_name,
    :grants_count,
    :homepage_url,
    :id,
    :ids,
    :image_thumbnail_url,
    :image_url,
    :updated_date,
    :works_api_url,
    :works_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      alternate_titles: [:string],
      cited_by_count: :integer,
      country_code: :string,
      counts_by_year: [{Amplified.OpenAlex.FunderCountsByYear, :t}],
      created_date: {:string, "date"},
      description: :string,
      display_name: :string,
      grants_count: :integer,
      homepage_url: :string,
      id: :string,
      ids: {Amplified.OpenAlex.FunderIds, :t},
      image_thumbnail_url: :string,
      image_url: :string,
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
