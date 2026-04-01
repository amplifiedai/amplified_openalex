defmodule Amplified.OpenAlex.WorkMesh do
  @moduledoc """
  Provides struct and type for a WorkMesh
  """

  @type t :: %__MODULE__{
          descriptor_name: String.t() | nil,
          descriptor_ui: String.t() | nil,
          is_major_topic: boolean | nil,
          qualifier_name: String.t() | nil,
          qualifier_ui: String.t() | nil
        }

  defstruct [:descriptor_name, :descriptor_ui, :is_major_topic, :qualifier_name, :qualifier_ui]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      descriptor_name: :string,
      descriptor_ui: :string,
      is_major_topic: :boolean,
      qualifier_name: :string,
      qualifier_ui: :string
    ]
  end
end
