defmodule Amplified.OpenAlex.GroupByResult do
  @moduledoc """
  Provides struct and type for a GroupByResult
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          key: String.t() | nil,
          key_display_name: String.t() | nil
        }

  defstruct [:count, :key, :key_display_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, key: :string, key_display_name: :string]
  end
end
