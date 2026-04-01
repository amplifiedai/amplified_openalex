defmodule Amplified.OpenAlex.Continent do
  @moduledoc """
  Provides struct and type for a Continent
  """

  @type t :: %__MODULE__{
          countries: [Amplified.OpenAlex.ContinentCountries.t()] | nil,
          created_date: Date.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          display_name_alternatives: [String.t()] | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.ContinentIds.t() | nil,
          updated_date: DateTime.t() | nil
        }

  defstruct [
    :countries,
    :created_date,
    :description,
    :display_name,
    :display_name_alternatives,
    :id,
    :ids,
    :updated_date
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      countries: [{Amplified.OpenAlex.ContinentCountries, :t}],
      created_date: {:string, "date"},
      description: :string,
      display_name: :string,
      display_name_alternatives: [:string],
      id: :string,
      ids: {Amplified.OpenAlex.ContinentIds, :t},
      updated_date: {:string, "date-time"}
    ]
  end
end
