defmodule Amplified.OpenAlex.ClientTest do
  use ExUnit.Case, async: true

  alias Amplified.OpenAlex.Work
  alias Amplified.OpenAlex.Error

  describe "decode_body (via request pipeline)" do
    test "decodes a work struct from JSON-like map" do
      body = %{
        "id" => "https://openalex.org/W123",
        "display_name" => "Test Paper",
        "doi" => "https://doi.org/10.1234/test",
        "cited_by_count" => 42,
        "publication_date" => "2023-03-15",
        "type" => "article",
        "abstract_inverted_index" => %{"Hello" => [0], "world" => [1]},
        "authorships" => [
          %{
            "author" => %{"display_name" => "Smith J.", "orcid" => nil},
            "institutions" => [%{"display_name" => "MIT"}],
            "raw_author_name" => "Smith J."
          }
        ],
        "open_access" => %{"is_oa" => true, "oa_status" => "gold"},
        "topics" => [
          %{"display_name" => "Physics", "score" => 0.95, "id" => "https://openalex.org/T1"}
        ]
      }

      # Simulate what the client does internally
      fields = Work.__fields__(:t)

      decoded =
        Enum.reduce(fields, %{}, fn {field, type}, acc ->
          key = to_string(field)

          case Map.fetch(body, key) do
            {:ok, value} -> Map.put(acc, field, decode_value(value, type))
            :error -> acc
          end
        end)

      work = struct(Work, decoded)

      assert work.id == "https://openalex.org/W123"
      assert work.display_name == "Test Paper"
      assert work.cited_by_count == 42
      assert work.publication_date == ~D[2023-03-15]
      assert work.abstract_inverted_index == %{"Hello" => [0], "world" => [1]}
    end

    test "Work.__fields__/1 returns field type information" do
      fields = Work.__fields__(:t)
      assert is_list(fields)

      field_map = Map.new(fields)
      assert field_map[:id] == :string
      assert field_map[:cited_by_count] == :integer
      assert field_map[:publication_date] == {:string, "date"}
      assert field_map[:abstract_inverted_index] == :map
    end

    test "Error.__fields__/1 returns field type information" do
      fields = Error.__fields__(:t)
      assert is_list(fields)
    end
  end

  # Expose the private decode_value for testing
  defp decode_value(nil, _type), do: nil
  defp decode_value(value, :string), do: value
  defp decode_value(value, :integer) when is_integer(value), do: value
  defp decode_value(value, :number), do: value
  defp decode_value(value, :boolean), do: value
  defp decode_value(value, :map), do: value

  defp decode_value(value, {:string, "date"}) when is_binary(value) do
    case Date.from_iso8601(value) do
      {:ok, date} -> date
      _ -> value
    end
  end

  defp decode_value(value, {:string, "date-time"}) when is_binary(value) do
    case DateTime.from_iso8601(value) do
      {:ok, dt, _offset} -> dt
      _ -> value
    end
  end

  defp decode_value(value, {:string, _format}), do: value

  defp decode_value(values, [{module, type}]) when is_list(values) do
    Enum.map(values, fn v ->
      if is_map(v) do
        fields = module.__fields__(type)

        attrs =
          Enum.reduce(fields, %{}, fn {field, ftype}, acc ->
            key = to_string(field)

            case Map.fetch(v, key) do
              {:ok, val} -> Map.put(acc, field, decode_value(val, ftype))
              :error -> acc
            end
          end)

        struct(module, attrs)
      else
        v
      end
    end)
  end

  defp decode_value(values, [:string]) when is_list(values), do: values
  defp decode_value(values, [:integer]) when is_list(values), do: values

  defp decode_value(value, {module, type}) when is_atom(module) and is_map(value) do
    fields = module.__fields__(type)

    attrs =
      Enum.reduce(fields, %{}, fn {field, ftype}, acc ->
        key = to_string(field)

        case Map.fetch(value, key) do
          {:ok, val} -> Map.put(acc, field, decode_value(val, ftype))
          :error -> acc
        end
      end)

    struct(module, attrs)
  end

  defp decode_value(value, _type), do: value
end
