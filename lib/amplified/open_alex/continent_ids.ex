defmodule Amplified.OpenAlex.ContinentIds do
  @moduledoc """
  Provides struct and type for a ContinentIds
  """

  @type t :: %__MODULE__{openalex: String.t() | nil, wikidata: String.t() | nil}

  defstruct [:openalex, :wikidata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [openalex: :string, wikidata: :string]
  end
end
