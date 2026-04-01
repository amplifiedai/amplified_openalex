defmodule Amplified.OpenAlex.Country do
  @moduledoc """
  Provides struct and type for a Country
  """

  @type t :: %__MODULE__{
          authors_api_url: String.t() | nil,
          cited_by_count: integer | nil,
          continent: Amplified.OpenAlex.CountryContinent.t() | nil,
          country_code: String.t() | nil,
          created_date: Date.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          display_name_alternatives: [String.t()] | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.CountryIds.t() | nil,
          institutions_api_url: String.t() | nil,
          is_global_south: boolean | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :authors_api_url,
    :cited_by_count,
    :continent,
    :country_code,
    :created_date,
    :description,
    :display_name,
    :display_name_alternatives,
    :id,
    :ids,
    :institutions_api_url,
    :is_global_south,
    :updated_date,
    :works_api_url,
    :works_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      authors_api_url: :string,
      cited_by_count: :integer,
      continent: {Amplified.OpenAlex.CountryContinent, :t},
      country_code: :string,
      created_date: {:string, "date"},
      description: :string,
      display_name: :string,
      display_name_alternatives: [:string],
      id: :string,
      ids: {Amplified.OpenAlex.CountryIds, :t},
      institutions_api_url: :string,
      is_global_south: :boolean,
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
