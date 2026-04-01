# Amplified.OpenAlex

OpenAlex API client for Elixir, generated from the
[OpenAPI specification](https://developers.openalex.org/api-reference/openapi.json).

Covers the full [OpenAlex API](https://docs.openalex.org) with typed structs
and operation modules for all 43 endpoints.

## Installation

Add `amplified_openalex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:amplified_openalex, "~> 0.1.0"}
  ]
end
```

## Configuration

```elixir
config :amplified_openalex, :client,
  api_key: System.get_env("OPENALEX_API_KEY"),
  base_url: "https://api.openalex.org"
```

## Usage

### Search for scholarly works

```elixir
{:ok, response} = Amplified.OpenAlex.Works.list_works(
  search: "deep body thermometer",
  per_page: 100
)

for work <- response.results do
  IO.puts("#{work.display_name} (#{work.cited_by_count} citations)")
end
```

### Get a single work

```elixir
{:ok, work} = Amplified.OpenAlex.Works.get_work("W2741809807")
# or by DOI:
{:ok, work} = Amplified.OpenAlex.Works.get_work("doi:10.1016/j.sna.2020.112098")
```

### Reconstruct abstract text

OpenAlex returns abstracts as inverted indexes. Use
[amplified_inverted_index](https://hex.pm/packages/amplified_inverted_index)
to reconstruct the plain text:

```elixir
abstract = Amplified.InvertedIndex.to_text(work.abstract_inverted_index)
```

### Other entity types

```elixir
# Authors
{:ok, authors} = Amplified.OpenAlex.Authors.list_authors(search: "Ishida")

# Institutions
{:ok, institutions} = Amplified.OpenAlex.Institutions.list_institutions(
  filter: "country_code:JP"
)

# Topics
{:ok, topics} = Amplified.OpenAlex.Topics.list_topics(search: "thermometry")
```

## Regenerating the client

The typed modules are generated from the OpenAPI spec using
[oapi_generator](https://hex.pm/packages/oapi_generator):

```sh
mix api.gen openalex priv/openapi.json
```

## Licence

MIT — see [LICENCE.md](LICENCE.md).
