defmodule Amplified.OpenAlex.SourceCountsByYear do
  @moduledoc """
  Provides struct and type for a SourceCountsByYear
  """

  @type t :: %__MODULE__{
          cited_by_count: integer | nil,
          works_count: integer | nil,
          year: integer | nil
        }

  defstruct [:cited_by_count, :works_count, :year]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cited_by_count: :integer, works_count: :integer, year: :integer]
  end
end
