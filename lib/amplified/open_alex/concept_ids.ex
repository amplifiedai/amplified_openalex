defmodule Amplified.OpenAlex.ConceptIds do
  @moduledoc """
  Provides struct and type for a ConceptIds
  """

  @type t :: %__MODULE__{
          mag: integer | nil,
          openalex: String.t() | nil,
          wikidata: String.t() | nil,
          wikipedia: String.t() | nil
        }

  defstruct [:mag, :openalex, :wikidata, :wikipedia]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mag: :integer, openalex: :string, wikidata: :string, wikipedia: :string]
  end
end
