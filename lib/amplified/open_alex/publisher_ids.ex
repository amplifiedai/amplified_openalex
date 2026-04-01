defmodule Amplified.OpenAlex.PublisherIds do
  @moduledoc """
  Provides struct and type for a PublisherIds
  """

  @type t :: %__MODULE__{
          openalex: String.t() | nil,
          ror: String.t() | nil,
          wikidata: String.t() | nil
        }

  defstruct [:openalex, :ror, :wikidata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [openalex: :string, ror: :string, wikidata: :string]
  end
end
