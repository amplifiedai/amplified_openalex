defmodule Amplified.OpenAlex.Client do
  @moduledoc """
  HTTP client for the OpenAlex API.

  Implements the `request/1` callback expected by the generated operation
  modules. Uses `Req` for HTTP requests and decodes JSON responses into
  typed structs using the `__fields__/1` metadata on each schema.

  ## Configuration

      config :amplified_openalex,
        api_key: System.get_env("OPENALEX_API_KEY"),
        base_url: "https://api.openalex.org"

  """

  alias Plug.Conn.Status
  alias Req.Response
  require Logger

  @doc """
  Perform an API request.

  Called by generated operation modules with a map containing:

    * `:url` — the request path
    * `:method` — HTTP method
    * `:query` — query parameters
    * `:response` — list of `{status, type}` tuples for decoding
    * `:opts` — caller options

  """
  @spec request(map()) :: {:ok, struct()} | {:error, struct() | term()}
  def request(info) do
    config =
      :amplified_openalex
      |> Application.fetch_env!(:client)
      |> Keyword.validate!([:api_key, :base_url, finch_options: []])

    query =
      info
      |> Map.get(:query, [])
      |> Keyword.put_new(:api_key, config[:api_key])

    config[:finch_options]
    |> Keyword.merge(
      base_url: config[:base_url],
      method: info.method,
      params: query,
      url: info.url
    )
    |> Req.new()
    |> Req.request()
    |> decode(info.response)
  end

  defp decode({:ok, %Response{status: status, body: body}}, response_types) do
    case List.keyfind(response_types, status, 0) do
      {_, type} ->
        decoded = decode_body(body, type)
        if status in 200..299, do: {:ok, decoded}, else: {:error, decoded}

      nil ->
        Logger.warning("OpenAlex API returned unexpected status #{status}: #{inspect(body)}")
        {:error, Status.reason_atom(status)}
    end
  end

  defp decode({:error, error}, _response_types) do
    Logger.error("OpenAlex API request failed: #{inspect(error)}")
    {:error, error}
  end

  defp decode_body(body, {module, type}) when is_atom(module) and is_atom(type),
    do: type |> module.__fields__() |> decode_struct(module, body)

  defp decode_body(body, :map), do: body
  defp decode_body(body, _type), do: body

  defp decode_struct(_fields, module, data) when not is_map(data),
    do: struct(module, message: to_string(data))

  defp decode_struct(fields, module, data) when is_map(data) do
    fields
    |> Enum.reduce(%{}, fn {field, type}, acc ->
      key = to_string(field)

      case Map.fetch(data, key) do
        {:ok, value} -> value |> decode_value(type) |> then(&Map.put(acc, field, &1))
        :error -> acc
      end
    end)
    |> then(&struct(module, &1))
  end

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

  defp decode_value(values, [{module, type}]) when is_list(values),
    do: Enum.map(values, &decode_value(&1, {module, type}))

  defp decode_value(values, [:string]) when is_list(values), do: values
  defp decode_value(values, [:integer]) when is_list(values), do: values
  defp decode_value(values, [:map]) when is_list(values), do: values

  defp decode_value(value, {module, type}) when is_atom(module) and is_map(value),
    do: type |> module.__fields__() |> decode_struct(module, value)

  defp decode_value(value, _type), do: value
end
