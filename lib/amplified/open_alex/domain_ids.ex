defmodule Amplified.OpenAlex.DomainIds do
  @moduledoc """
  Provides struct and type for a DomainIds
  """

  @type t :: %__MODULE__{
          openalex: String.t() | nil,
          wikidata: String.t() | nil,
          wikipedia: String.t() | nil
        }

  defstruct [:openalex, :wikidata, :wikipedia]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [openalex: :string, wikidata: :string, wikipedia: :string]
  end
end
