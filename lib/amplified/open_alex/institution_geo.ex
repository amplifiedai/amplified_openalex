defmodule Amplified.OpenAlex.InstitutionGeo do
  @moduledoc """
  Provides struct and type for a InstitutionGeo
  """

  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t() | nil,
          country_code: String.t() | nil,
          geonames_city_id: String.t() | nil,
          latitude: number | nil,
          longitude: number | nil,
          region: String.t() | nil
        }

  defstruct [:city, :country, :country_code, :geonames_city_id, :latitude, :longitude, :region]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      city: :string,
      country: :string,
      country_code: :string,
      geonames_city_id: :string,
      latitude: :number,
      longitude: :number,
      region: :string
    ]
  end
end
