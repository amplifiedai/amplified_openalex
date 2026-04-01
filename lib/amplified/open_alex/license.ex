defmodule Amplified.OpenAlex.License do
  @moduledoc """
  Provides struct and type for a License
  """

  @type t :: %__MODULE__{
          cited_by_count: integer | nil,
          created_date: Date.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          id: String.t() | nil,
          updated_date: DateTime.t() | nil,
          url: String.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :cited_by_count,
    :created_date,
    :description,
    :display_name,
    :id,
    :updated_date,
    :url,
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
      description: :string,
      display_name: :string,
      id: :string,
      updated_date: {:string, "date-time"},
      url: :string,
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
