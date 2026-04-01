defmodule Amplified.OpenAlex.RateLimits do
  @moduledoc """
  Provides API endpoint related to rate limits
  """

  @default_client Amplified.OpenAlex.Client

  @doc """
  Check rate limit status

  Check your current rate limit status including usage and remaining allowance.

  ## Options

    * `api_key`: Your OpenAlex API key (required). Get a free key at https://openalex.org/settings/api

  """
  @spec get_rate_limit(opts :: keyword) ::
          {:ok, Amplified.OpenAlex.RateLimitResponse.t()} | {:error, Amplified.OpenAlex.Error.t()}
  def get_rate_limit(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:api_key])

    client.request(%{
      args: [],
      call: {Amplified.OpenAlex.RateLimits, :get_rate_limit},
      url: "/rate-limit",
      method: :get,
      query: query,
      response: [
        {200, {Amplified.OpenAlex.RateLimitResponse, :t}},
        {429, {Amplified.OpenAlex.Error, :t}}
      ],
      opts: opts
    })
  end
end
