defmodule Amplified.OpenAlex.Location do
  @moduledoc """
  Provides struct and type for a Location
  """

  @type t :: %__MODULE__{
          is_accepted: boolean | nil,
          is_oa: boolean | nil,
          is_published: boolean | nil,
          landing_page_url: String.t() | nil,
          license: String.t() | nil,
          license_id: String.t() | nil,
          pdf_url: String.t() | nil,
          source: Amplified.OpenAlex.DehydratedSource.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :is_accepted,
    :is_oa,
    :is_published,
    :landing_page_url,
    :license,
    :license_id,
    :pdf_url,
    :source,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      is_accepted: :boolean,
      is_oa: :boolean,
      is_published: :boolean,
      landing_page_url: :string,
      license: :string,
      license_id: :string,
      pdf_url: :string,
      source: {Amplified.OpenAlex.DehydratedSource, :t},
      version: {:enum, ["publishedVersion", "acceptedVersion", "submittedVersion"]}
    ]
  end
end
