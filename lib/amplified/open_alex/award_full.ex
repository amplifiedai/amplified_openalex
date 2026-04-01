defmodule Amplified.OpenAlex.AwardFull do
  @moduledoc """
  Provides struct and type for a AwardFull
  """

  @type t :: %__MODULE__{
          amount: number | nil,
          co_lead_investigator: map | nil,
          created_date: Date.t() | nil,
          currency: String.t() | nil,
          description: String.t() | nil,
          display_name: String.t() | nil,
          doi: String.t() | nil,
          end_date: Date.t() | nil,
          end_year: integer | nil,
          funded_outputs: [String.t()] | nil,
          funded_outputs_count: integer | nil,
          funder: Amplified.OpenAlex.AwardFullFunder.t() | nil,
          funder_award_id: String.t() | nil,
          funder_scheme: String.t() | nil,
          funding_type: String.t() | nil,
          id: String.t() | nil,
          investigators: [any] | nil,
          landing_page_url: String.t() | nil,
          lead_investigator: map | nil,
          provenance: String.t() | nil,
          start_date: Date.t() | nil,
          start_year: integer | nil,
          updated_date: DateTime.t() | nil,
          works_api_url: String.t() | nil
        }

  defstruct [
    :amount,
    :co_lead_investigator,
    :created_date,
    :currency,
    :description,
    :display_name,
    :doi,
    :end_date,
    :end_year,
    :funded_outputs,
    :funded_outputs_count,
    :funder,
    :funder_award_id,
    :funder_scheme,
    :funding_type,
    :id,
    :investigators,
    :landing_page_url,
    :lead_investigator,
    :provenance,
    :start_date,
    :start_year,
    :updated_date,
    :works_api_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: :number,
      co_lead_investigator: :map,
      created_date: {:string, "date"},
      currency: :string,
      description: :string,
      display_name: :string,
      doi: :string,
      end_date: {:string, "date"},
      end_year: :integer,
      funded_outputs: [:string],
      funded_outputs_count: :integer,
      funder: {Amplified.OpenAlex.AwardFullFunder, :t},
      funder_award_id: :string,
      funder_scheme: :string,
      funding_type: :string,
      id: :string,
      investigators: [:unknown],
      landing_page_url: :string,
      lead_investigator: :map,
      provenance: :string,
      start_date: {:string, "date"},
      start_year: :integer,
      updated_date: {:string, "date-time"},
      works_api_url: :string
    ]
  end
end
