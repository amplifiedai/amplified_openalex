defmodule Amplified.OpenAlex.Subfield do
  @moduledoc """
  Provides struct and type for a Subfield
  """

  @type t :: %__MODULE__{
          cited_by_count: integer | nil,
          created_date: Date.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          display_name_alternatives: [String.t()] | nil,
          domain: Amplified.OpenAlex.SubfieldDomain.t() | nil,
          field: Amplified.OpenAlex.SubfieldField.t() | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.SubfieldIds.t() | nil,
          siblings: [Amplified.OpenAlex.SubfieldSiblings.t()] | nil,
          topics: [Amplified.OpenAlex.SubfieldTopics.t()] | nil,
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
    :domain,
    :field,
    :id,
    :ids,
    :siblings,
    :topics,
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
      domain: {Amplified.OpenAlex.SubfieldDomain, :t},
      field: {Amplified.OpenAlex.SubfieldField, :t},
      id: :string,
      ids: {Amplified.OpenAlex.SubfieldIds, :t},
      siblings: [{Amplified.OpenAlex.SubfieldSiblings, :t}],
      topics: [{Amplified.OpenAlex.SubfieldTopics, :t}],
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
