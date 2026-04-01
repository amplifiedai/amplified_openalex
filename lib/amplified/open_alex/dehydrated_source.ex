defmodule Amplified.OpenAlex.DehydratedSource do
  @moduledoc """
  Provides struct and type for a DehydratedSource
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          host_organization: String.t() | nil,
          host_organization_lineage: [String.t()] | nil,
          host_organization_name: String.t() | nil,
          id: String.t() | nil,
          is_core: boolean | nil,
          is_in_doaj: boolean | nil,
          is_oa: boolean | nil,
          issn: [String.t()] | nil,
          issn_l: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :display_name,
    :host_organization,
    :host_organization_lineage,
    :host_organization_name,
    :id,
    :is_core,
    :is_in_doaj,
    :is_oa,
    :issn,
    :issn_l,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_name: :string,
      host_organization: :string,
      host_organization_lineage: [:string],
      host_organization_name: :string,
      id: :string,
      is_core: :boolean,
      is_in_doaj: :boolean,
      is_oa: :boolean,
      issn: [:string],
      issn_l: :string,
      type: :string
    ]
  end
end
