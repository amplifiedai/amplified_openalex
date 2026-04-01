defmodule Amplified.OpenAlex.InstitutionIds do
  @moduledoc """
  Provides struct and type for a InstitutionIds
  """

  @type t :: %__MODULE__{
          grid: String.t() | nil,
          mag: integer | nil,
          openalex: String.t() | nil,
          ror: String.t() | nil,
          wikidata: String.t() | nil,
          wikipedia: String.t() | nil
        }

  defstruct [:grid, :mag, :openalex, :ror, :wikidata, :wikipedia]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      grid: :string,
      mag: :integer,
      openalex: :string,
      ror: :string,
      wikidata: :string,
      wikipedia: :string
    ]
  end
end
