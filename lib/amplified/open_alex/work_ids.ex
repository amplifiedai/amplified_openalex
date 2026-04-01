defmodule Amplified.OpenAlex.WorkIds do
  @moduledoc """
  Provides struct and type for a WorkIds
  """

  @type t :: %__MODULE__{
          doi: String.t() | nil,
          mag: integer | nil,
          openalex: String.t() | nil,
          pmcid: String.t() | nil,
          pmid: String.t() | nil
        }

  defstruct [:doi, :mag, :openalex, :pmcid, :pmid]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [doi: :string, mag: :integer, openalex: :string, pmcid: :string, pmid: :string]
  end
end
