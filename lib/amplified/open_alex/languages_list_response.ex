defmodule Amplified.OpenAlex.LanguagesListResponse do
  @moduledoc """
  Provides struct and type for a LanguagesListResponse
  """

  @type t :: %__MODULE__{
          meta: Amplified.OpenAlex.Meta.t() | nil,
          results: [Amplified.OpenAlex.Language.t()] | nil
        }

  defstruct [:meta, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Amplified.OpenAlex.Meta, :t}, results: [{Amplified.OpenAlex.Language, :t}]]
  end
end
