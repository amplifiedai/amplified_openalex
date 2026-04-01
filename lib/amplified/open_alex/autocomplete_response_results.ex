defmodule Amplified.OpenAlex.AutocompleteResponseResults do
  @moduledoc """
  Provides struct and type for a AutocompleteResponseResults
  """

  @type t :: %__MODULE__{
          cited_by_count: integer | nil,
          display_name: String.t() | nil,
          entity_type: String.t() | nil,
          external_id: String.t() | nil,
          hint: String.t() | nil,
          id: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [:cited_by_count, :display_name, :entity_type, :external_id, :hint, :id, :works_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cited_by_count: :integer,
      display_name: :string,
      entity_type: :string,
      external_id: :string,
      hint: :string,
      id: :string,
      works_count: :integer
    ]
  end
end
