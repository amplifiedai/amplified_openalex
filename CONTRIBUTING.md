# Contributing to Amplified.OpenAlex

Thanks for your interest in contributing to this project! Please
read through this guide and our [Code of Conduct](CODE_OF_CONDUCT.md)
before getting started.

## Generated Code

Most of the code in `lib/amplified/open_alex/` is generated from the
[OpenAlex OpenAPI specification](https://developers.openalex.org/api-reference/openapi.json)
using [oapi_generator](https://hex.pm/packages/oapi_generator).

To regenerate the client after a spec update:

```sh
mix api.gen openalex priv/openapi.json
```

## Hand-Written Code

The following modules are hand-written and should be modified directly:

- `lib/amplified/open_alex.ex` — top-level module with documentation
- `lib/amplified/open_alex/client.ex` — HTTP client implementation

## Reporting Bugs

Before opening a bug report, search existing issues to avoid duplicates.
A good report includes:

- Your Elixir and Erlang/OTP versions
- Steps to reproduce the problem
- What you expected vs what actually happened

## Submitting Pull Requests

1. Fork the repo and create a topic branch from `main`
2. Write your changes along with any relevant tests
3. Run `mix test` and `mix format` before committing
4. Keep commits focused — one logical change per commit
5. Open a PR with a clear description of what changed and why

By submitting a PR, you agree that your contribution will be licensed under
the project's [MIT Licence](LICENCE.md).
