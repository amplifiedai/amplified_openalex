defmodule Amplified.OpenAlex.TopicField do
  @moduledoc """
  Provides struct and type for a TopicField
  """

  @type t :: %__MODULE__{display_name: String.t() | nil, id: String.t() | nil}

  defstruct [:display_name, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [display_name: :string, id: :string]
  end
end
