defmodule Amplified.OpenAlex.Authorship do
  @moduledoc """
  Provides struct and type for a Authorship
  """

  @type t :: %__MODULE__{
          author: Amplified.OpenAlex.DehydratedAuthor.t() | nil,
          author_position: String.t() | nil,
          countries: [String.t()] | nil,
          institutions: [Amplified.OpenAlex.DehydratedInstitution.t()] | nil,
          is_corresponding: boolean | nil,
          raw_affiliation_strings: [String.t()] | nil,
          raw_author_name: String.t() | nil
        }

  defstruct [
    :author,
    :author_position,
    :countries,
    :institutions,
    :is_corresponding,
    :raw_affiliation_strings,
    :raw_author_name
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {Amplified.OpenAlex.DehydratedAuthor, :t},
      author_position: {:enum, ["first", "middle", "last"]},
      countries: [:string],
      institutions: [{Amplified.OpenAlex.DehydratedInstitution, :t}],
      is_corresponding: :boolean,
      raw_affiliation_strings: [:string],
      raw_author_name: :string
    ]
  end
end
