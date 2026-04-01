defmodule Amplified.OpenAlex.Award do
  @moduledoc """
  Provides struct and type for a Award
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          doi: String.t() | nil,
          funder_award_id: String.t() | nil,
          funder_display_name: String.t() | nil,
          funder_id: String.t() | nil,
          id: String.t() | nil
        }

  defstruct [:display_name, :doi, :funder_award_id, :funder_display_name, :funder_id, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_name: :string,
      doi: :string,
      funder_award_id: :string,
      funder_display_name: :string,
      funder_id: :string,
      id: :string
    ]
  end
end
