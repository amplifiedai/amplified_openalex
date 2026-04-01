defmodule Amplified.OpenAlex.AuthorTopics do
  @moduledoc """
  Provides struct and type for a AuthorTopics
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          display_name: String.t() | nil,
          id: String.t() | nil
        }

  defstruct [:count, :display_name, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, display_name: :string, id: :string]
  end
end
