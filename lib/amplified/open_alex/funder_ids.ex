defmodule Amplified.OpenAlex.FunderIds do
  @moduledoc """
  Provides struct and type for a FunderIds
  """

  @type t :: %__MODULE__{
          crossref: String.t() | nil,
          doi: String.t() | nil,
          openalex: String.t() | nil,
          ror: String.t() | nil,
          wikidata: String.t() | nil
        }

  defstruct [:crossref, :doi, :openalex, :ror, :wikidata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [crossref: :string, doi: :string, openalex: :string, ror: :string, wikidata: :string]
  end
end
