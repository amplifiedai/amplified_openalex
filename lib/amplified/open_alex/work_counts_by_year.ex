defmodule Amplified.OpenAlex.WorkCountsByYear do
  @moduledoc """
  Provides struct and type for a WorkCountsByYear
  """

  @type t :: %__MODULE__{cited_by_count: integer | nil, year: integer | nil}

  defstruct [:cited_by_count, :year]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cited_by_count: :integer, year: :integer]
  end
end
