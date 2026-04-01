defmodule Amplified.OpenAlex.AuthorIds do
  @moduledoc """
  Provides struct and type for a AuthorIds
  """

  @type t :: %__MODULE__{
          openalex: String.t() | nil,
          orcid: String.t() | nil,
          scopus: String.t() | nil
        }

  defstruct [:openalex, :orcid, :scopus]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [openalex: :string, orcid: :string, scopus: :string]
  end
end
