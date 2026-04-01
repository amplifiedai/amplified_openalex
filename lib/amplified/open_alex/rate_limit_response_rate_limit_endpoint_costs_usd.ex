defmodule Amplified.OpenAlex.RateLimitResponseRateLimitEndpointCostsUsd do
  @moduledoc """
  Provides struct and type for a RateLimitResponseRateLimitEndpointCostsUsd
  """

  @type t :: %__MODULE__{
          content: number | nil,
          list: number | nil,
          search: number | nil,
          semantic: number | nil,
          singleton: number | nil,
          text: number | nil
        }

  defstruct [:content, :list, :search, :semantic, :singleton, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: :number,
      list: :number,
      search: :number,
      semantic: :number,
      singleton: :number,
      text: :number
    ]
  end
end
