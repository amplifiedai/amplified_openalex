defmodule Amplified.OpenAlex.WorkHasContent do
  @moduledoc """
  Provides struct and type for a WorkHasContent
  """

  @type t :: %__MODULE__{grobid_xml: boolean | nil, pdf: boolean | nil}

  defstruct [:grobid_xml, :pdf]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [grobid_xml: :boolean, pdf: :boolean]
  end
end
