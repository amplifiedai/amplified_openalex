defmodule Amplified.OpenAlex.AuthorSummaryStats do
  @moduledoc """
  Provides struct and type for a AuthorSummaryStats
  """

  @type t :: %__MODULE__{
          "2yr_mean_citedness": number | nil,
          h_index: integer | nil,
          i10_index: integer | nil
        }

  defstruct [:"2yr_mean_citedness", :h_index, :i10_index]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["2yr_mean_citedness": :number, h_index: :integer, i10_index: :integer]
  end
end
