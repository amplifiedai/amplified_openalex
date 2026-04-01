defmodule Amplified.OpenAlex.Error do
  @moduledoc """
  Provides struct and type for a Error
  """

  @type t :: %__MODULE__{error: String.t() | nil, message: String.t() | nil}

  defstruct [:error, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error: :string, message: :string]
  end
end
