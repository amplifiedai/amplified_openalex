defmodule Amplified.OpenAlex.SdgIds do
  @moduledoc """
  Provides struct and type for a SdgIds
  """

  @type t :: %__MODULE__{
          openalex: String.t() | nil,
          un: String.t() | nil,
          wikidata: String.t() | nil
        }

  defstruct [:openalex, :un, :wikidata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [openalex: :string, un: :string, wikidata: :string]
  end
end
