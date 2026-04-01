defmodule Amplified.OpenAlex.TopicsListResponse do
  @moduledoc """
  Provides struct and type for a TopicsListResponse
  """

  @type t :: %__MODULE__{
          group_by: [Amplified.OpenAlex.GroupByResult.t()] | nil,
          meta: Amplified.OpenAlex.Meta.t() | nil,
          results: [Amplified.OpenAlex.Topic.t()] | nil
        }

  defstruct [:group_by, :meta, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      group_by: [{Amplified.OpenAlex.GroupByResult, :t}],
      meta: {Amplified.OpenAlex.Meta, :t},
      results: [{Amplified.OpenAlex.Topic, :t}]
    ]
  end
end
