defmodule Amplified.OpenAlex.AuthorAffiliations do
  @moduledoc """
  Provides struct and type for a AuthorAffiliations
  """

  @type t :: %__MODULE__{
          institution: Amplified.OpenAlex.DehydratedInstitution.t() | nil,
          years: [integer] | nil
        }

  defstruct [:institution, :years]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [institution: {Amplified.OpenAlex.DehydratedInstitution, :t}, years: [:integer]]
  end
end
