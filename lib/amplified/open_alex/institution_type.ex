defmodule Amplified.OpenAlex.InstitutionType do
  @moduledoc """
  Provides struct and type for a InstitutionType
  """

  @type t :: %__MODULE__{
          cited_by_count: integer | nil,
          created_date: Date.t() | nil,
          display_name: String.t() | nil,
          id: String.t() | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :cited_by_count,
    :created_date,
    :display_name,
    :id,
    :updated_date,
    :works_api_url,
    :works_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cited_by_count: :integer,
      created_date: {:string, "date"},
      display_name: :string,
      id: :string,
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
