defmodule Amplified.OpenAlex.Domain do
  @moduledoc """
  Provides struct and type for a Domain
  """

  @type t :: %__MODULE__{
          cited_by_count: integer | nil,
          created_date: Date.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          display_name_alternatives: [String.t()] | nil,
          fields: [Amplified.OpenAlex.DomainFields.t()] | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.DomainIds.t() | nil,
          siblings: [Amplified.OpenAlex.DomainSiblings.t()] | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :cited_by_count,
    :created_date,
    :description,
    :display_name,
    :display_name_alternatives,
    :fields,
    :id,
    :ids,
    :siblings,
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
      description: :string,
      display_name: :string,
      display_name_alternatives: [:string],
      fields: [{Amplified.OpenAlex.DomainFields, :t}],
      id: :string,
      ids: {Amplified.OpenAlex.DomainIds, :t},
      siblings: [{Amplified.OpenAlex.DomainSiblings, :t}],
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
