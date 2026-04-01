defmodule Amplified.OpenAlex.WorkCitationNormalizedPercentile do
  @moduledoc """
  Provides struct and type for a WorkCitationNormalizedPercentile
  """

  @type t :: %__MODULE__{
          is_in_top_10_percent: boolean | nil,
          is_in_top_1_percent: boolean | nil,
          value: number | nil
        }

  defstruct [:is_in_top_10_percent, :is_in_top_1_percent, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [is_in_top_10_percent: :boolean, is_in_top_1_percent: :boolean, value: :number]
  end
end
