defmodule Amplified.OpenAlex.AwardFullFunder do
  @moduledoc """
  Provides struct and type for a AwardFullFunder
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          doi: String.t() | nil,
          id: String.t() | nil
        }

  defstruct [:display_name, :doi, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [display_name: :string, doi: :string, id: :string]
  end
end
