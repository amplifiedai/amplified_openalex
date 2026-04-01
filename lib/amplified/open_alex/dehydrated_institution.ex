defmodule Amplified.OpenAlex.DehydratedInstitution do
  @moduledoc """
  Provides struct and type for a DehydratedInstitution
  """

  @type t :: %__MODULE__{
          country_code: String.t() | nil,
          display_name: String.t() | nil,
          id: String.t() | nil,
          lineage: [String.t()] | nil,
          ror: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:country_code, :display_name, :id, :lineage, :ror, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      country_code: :string,
      display_name: :string,
      id: :string,
      lineage: [:string],
      ror: :string,
      type: :string
    ]
  end
end
