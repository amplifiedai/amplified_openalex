defmodule Amplified.OpenAlex.Topic do
  @moduledoc """
  Provides struct and type for a Topic
  """

  @type t :: %__MODULE__{
          cited_by_count: integer | nil,
          created_date: Date.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          domain: Amplified.OpenAlex.TopicDomain.t() | nil,
          field: Amplified.OpenAlex.TopicField.t() | nil,
          id: String.t() | nil,
          ids: Amplified.OpenAlex.TopicIds.t() | nil,
          keywords: [String.t()] | nil,
          subfield: Amplified.OpenAlex.TopicSubfield.t() | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil,
          works_count: integer | nil
        }

  defstruct [
    :cited_by_count,
    :created_date,
    :description,
    :display_name,
    :domain,
    :field,
    :id,
    :ids,
    :keywords,
    :subfield,
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
      domain: {Amplified.OpenAlex.TopicDomain, :t},
      field: {Amplified.OpenAlex.TopicField, :t},
      id: :string,
      ids: {Amplified.OpenAlex.TopicIds, :t},
      keywords: [:string],
      subfield: {Amplified.OpenAlex.TopicSubfield, :t},
      updated_date: {:string, "date-time"},
      works_api_url: :string,
      works_count: :integer
    ]
  end
end
