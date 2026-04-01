defmodule Amplified.OpenAlex.DehydratedFunder do
  @moduledoc """
  Provides struct and type for a DehydratedFunder
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          id: String.t() | nil,
          ror: String.t() | nil
        }

  defstruct [:display_name, :id, :ror]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [display_name: :string, id: :string, ror: :string]
  end
end
