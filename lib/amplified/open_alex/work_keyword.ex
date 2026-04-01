defmodule Amplified.OpenAlex.WorkKeyword do
  @moduledoc """
  Provides struct and type for a WorkKeyword
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          id: String.t() | nil,
          score: number | nil
        }

  defstruct [:display_name, :id, :score]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [display_name: :string, id: :string, score: :number]
  end
end
