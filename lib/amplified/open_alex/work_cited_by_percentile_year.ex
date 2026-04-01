defmodule Amplified.OpenAlex.WorkCitedByPercentileYear do
  @moduledoc """
  Provides struct and type for a WorkCitedByPercentileYear
  """

  @type t :: %__MODULE__{max: integer | nil, min: integer | nil}

  defstruct [:max, :min]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max: :integer, min: :integer]
  end
end
