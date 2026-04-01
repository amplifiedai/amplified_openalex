defmodule Amplified.OpenAlex.RateLimitResponse do
  @moduledoc """
  Provides struct and type for a RateLimitResponse
  """

  @type t :: %__MODULE__{
          api_key: String.t() | nil,
          rate_limit: Amplified.OpenAlex.RateLimitResponseRateLimit.t() | nil
        }

  defstruct [:api_key, :rate_limit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [api_key: :string, rate_limit: {Amplified.OpenAlex.RateLimitResponseRateLimit, :t}]
  end
end
