defmodule Amplified.OpenAlex.Meta do
  @moduledoc """
  Provides struct and type for a Meta
  """

  @type t :: %__MODULE__{
          cost_usd: number | nil,
          count: integer | nil,
          db_response_time_ms: integer | nil,
          groups_count: integer | nil,
          next_cursor: String.t() | nil,
          page: integer | nil,
          per_page: integer | nil
        }

  defstruct [
    :cost_usd,
    :count,
    :db_response_time_ms,
    :groups_count,
    :next_cursor,
    :page,
    :per_page
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cost_usd: :number,
      count: :integer,
      db_response_time_ms: :integer,
      groups_count: :integer,
      next_cursor: :string,
      page: :integer,
      per_page: :integer
    ]
  end
end
