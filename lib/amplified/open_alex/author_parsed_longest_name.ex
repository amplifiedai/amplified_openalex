defmodule Amplified.OpenAlex.AuthorParsedLongestName do
  @moduledoc """
  Provides struct and type for a AuthorParsedLongestName
  """

  @type t :: %__MODULE__{
          first: String.t() | nil,
          last: String.t() | nil,
          middle: String.t() | nil,
          nickname: String.t() | nil,
          suffix: String.t() | nil
        }

  defstruct [:first, :last, :middle, :nickname, :suffix]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [first: :string, last: :string, middle: :string, nickname: :string, suffix: :string]
  end
end
