defmodule Amplified.OpenAlex.SourceIds do
  @moduledoc """
  Provides struct and type for a SourceIds
  """

  @type t :: %__MODULE__{
          fatcat: String.t() | nil,
          issn: [String.t()] | nil,
          issn_l: String.t() | nil,
          mag: integer | nil,
          openalex: String.t() | nil,
          wikidata: String.t() | nil
        }

  defstruct [:fatcat, :issn, :issn_l, :mag, :openalex, :wikidata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fatcat: :string,
      issn: [:string],
      issn_l: :string,
      mag: :integer,
      openalex: :string,
      wikidata: :string
    ]
  end
end
