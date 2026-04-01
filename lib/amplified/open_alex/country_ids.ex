defmodule Amplified.OpenAlex.CountryIds do
  @moduledoc """
  Provides struct and type for a CountryIds
  """

  @type t :: %__MODULE__{
          iso: String.t() | nil,
          openalex: String.t() | nil,
          wikidata: String.t() | nil,
          wikipedia: String.t() | nil
        }

  defstruct [:iso, :openalex, :wikidata, :wikipedia]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [iso: :string, openalex: :string, wikidata: :string, wikipedia: :string]
  end
end
