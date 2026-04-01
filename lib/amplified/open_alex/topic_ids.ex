defmodule Amplified.OpenAlex.TopicIds do
  @moduledoc """
  Provides struct and type for a TopicIds
  """

  @type t :: %__MODULE__{openalex: String.t() | nil, wikipedia: String.t() | nil}

  defstruct [:openalex, :wikipedia]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [openalex: :string, wikipedia: :string]
  end
end
