defmodule Amplified.OpenAlex.WorkBiblio do
  @moduledoc """
  Provides struct and type for a WorkBiblio
  """

  @type t :: %__MODULE__{
          first_page: String.t() | nil,
          issue: String.t() | nil,
          last_page: String.t() | nil,
          volume: String.t() | nil
        }

  defstruct [:first_page, :issue, :last_page, :volume]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [first_page: :string, issue: :string, last_page: :string, volume: :string]
  end
end
