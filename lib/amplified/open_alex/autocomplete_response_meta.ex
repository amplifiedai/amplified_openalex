defmodule Amplified.OpenAlex.AutocompleteResponseMeta do
  @moduledoc """
  Provides struct and type for a AutocompleteResponseMeta
  """

  @type t :: %__MODULE__{count: integer | nil, db_response_time_ms: integer | nil}

  defstruct [:count, :db_response_time_ms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, db_response_time_ms: :integer]
  end
end
