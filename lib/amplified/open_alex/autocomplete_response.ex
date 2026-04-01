defmodule Amplified.OpenAlex.AutocompleteResponse do
  @moduledoc """
  Provides struct and type for a AutocompleteResponse
  """

  @type t :: %__MODULE__{
          meta: Amplified.OpenAlex.AutocompleteResponseMeta.t() | nil,
          results: [Amplified.OpenAlex.AutocompleteResponseResults.t()] | nil
        }

  defstruct [:meta, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {Amplified.OpenAlex.AutocompleteResponseMeta, :t},
      results: [{Amplified.OpenAlex.AutocompleteResponseResults, :t}]
    ]
  end
end
