defmodule Amplified.OpenAlex.WorksTest do
  use ExUnit.Case, async: true

  alias Amplified.OpenAlex.Works

  defmodule SpyClient do
    def request(info) do
      send(self(), {:request, info})
      {:ok, %Req.Response{status: 200, body: %{"results" => [], "meta" => %{}}}}
    end
  end

  describe "list_works/1 semantic_search option" do
    test "maps semantic_search to search.semantic query param" do
      Works.list_works(semantic_search: "flexible temperature sensor", client: SpyClient)

      assert_received {:request, info}
      assert {"search.semantic", "flexible temperature sensor"} in info.query
    end

    test "does not include semantic_search as a raw query param" do
      Works.list_works(semantic_search: "test query", client: SpyClient)

      assert_received {:request, info}
      refute Keyword.has_key?(info.query, :semantic_search)
    end

    test "passes keyword search as :search atom key" do
      Works.list_works(search: "machine learning", client: SpyClient)

      assert_received {:request, info}
      assert {:search, "machine learning"} in info.query
    end

    test "supports both search and semantic_search simultaneously" do
      Works.list_works(
        search: "machine learning",
        semantic_search: "neural networks for vision",
        client: SpyClient
      )

      assert_received {:request, info}
      assert {:search, "machine learning"} in info.query
      assert {"search.semantic", "neural networks for vision"} in info.query
    end
  end
end
