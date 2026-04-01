defmodule Amplified.OpenAlex.RateLimitResponseRateLimit do
  @moduledoc """
  Provides struct and type for a RateLimitResponseRateLimit
  """

  @type t :: %__MODULE__{
          credit_costs: map | nil,
          credits_limit: integer | nil,
          credits_remaining: integer | nil,
          credits_used: integer | nil,
          daily_budget_usd: number | nil,
          daily_remaining_usd: number | nil,
          daily_used_usd: number | nil,
          endpoint_costs_usd:
            Amplified.OpenAlex.RateLimitResponseRateLimitEndpointCostsUsd.t() | nil,
          prepaid_balance_usd: number | nil,
          prepaid_expires_at: DateTime.t() | nil,
          prepaid_remaining_usd: number | nil,
          resets_at: DateTime.t() | nil,
          resets_in_seconds: integer | nil
        }

  defstruct [
    :credit_costs,
    :credits_limit,
    :credits_remaining,
    :credits_used,
    :daily_budget_usd,
    :daily_remaining_usd,
    :daily_used_usd,
    :endpoint_costs_usd,
    :prepaid_balance_usd,
    :prepaid_expires_at,
    :prepaid_remaining_usd,
    :resets_at,
    :resets_in_seconds
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      credit_costs: :map,
      credits_limit: :integer,
      credits_remaining: :integer,
      credits_used: :integer,
      daily_budget_usd: :number,
      daily_remaining_usd: :number,
      daily_used_usd: :number,
      endpoint_costs_usd: {Amplified.OpenAlex.RateLimitResponseRateLimitEndpointCostsUsd, :t},
      prepaid_balance_usd: :number,
      prepaid_expires_at: {:string, "date-time"},
      prepaid_remaining_usd: :number,
      resets_at: {:string, "date-time"},
      resets_in_seconds: :integer
    ]
  end
end
