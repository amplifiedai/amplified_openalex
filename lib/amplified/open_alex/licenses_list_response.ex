defmodule Amplified.OpenAlex.LicensesListResponse do
  @moduledoc """
  Provides struct and type for a LicensesListResponse
  """

  @type t :: %__MODULE__{
          meta: Amplified.OpenAlex.Meta.t() | nil,
          results: [Amplified.OpenAlex.License.t()] | nil
        }

  defstruct [:meta, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {Amplified.OpenAlex.Meta, :t}, results: [{Amplified.OpenAlex.License, :t}]]
  end
end
