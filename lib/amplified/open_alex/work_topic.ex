defmodule Amplified.OpenAlex.WorkTopic do
  @moduledoc """
  Provides struct and type for a WorkTopic
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          domain: Amplified.OpenAlex.WorkTopicDomain.t() | nil,
          field: Amplified.OpenAlex.WorkTopicField.t() | nil,
          id: String.t() | nil,
          score: number | nil,
          subfield: Amplified.OpenAlex.WorkTopicSubfield.t() | nil
        }

  defstruct [:display_name, :domain, :field, :id, :score, :subfield]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_name: :string,
      domain: {Amplified.OpenAlex.WorkTopicDomain, :t},
      field: {Amplified.OpenAlex.WorkTopicField, :t},
      id: :string,
      score: :number,
      subfield: {Amplified.OpenAlex.WorkTopicSubfield, :t}
    ]
  end
end
