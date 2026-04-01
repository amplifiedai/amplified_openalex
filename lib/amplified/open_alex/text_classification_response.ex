defmodule Amplified.OpenAlex.TextClassificationResponse do
  @moduledoc """
  Provides struct and type for a TextClassificationResponse
  """

  @type t :: %__MODULE__{
          meta: Amplified.OpenAlex.TextClassificationResponseMeta.t() | nil,
          results: [Amplified.OpenAlex.WorkTopic.t()] | nil
        }

  defstruct [:meta, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {Amplified.OpenAlex.TextClassificationResponseMeta, :t},
      results: [{Amplified.OpenAlex.WorkTopic, :t}]
    ]
  end
end
