defmodule Amplified.OpenAlex.OpenAccess do
  @moduledoc """
  Provides struct and type for a OpenAccess
  """

  @type t :: %__MODULE__{
          any_repository_has_fulltext: boolean | nil,
          is_oa: boolean | nil,
          oa_status: String.t() | nil,
          oa_url: String.t() | nil
        }

  defstruct [:any_repository_has_fulltext, :is_oa, :oa_status, :oa_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      any_repository_has_fulltext: :boolean,
      is_oa: :boolean,
      oa_status: {:enum, ["diamond", "gold", "hybrid", "bronze", "green", "closed"]},
      oa_url: :string
    ]
  end
end
