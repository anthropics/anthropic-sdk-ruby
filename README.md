# Claude SDK for Ruby

[![Gem Version](https://img.shields.io/gem/v/anthropic.svg)](https://rubygems.org/gems/anthropic)

The Claude SDK for Ruby provides access to the [Claude API](https://docs.anthropic.com/en/api/) from Ruby applications.

## Documentation

Full documentation is available at **[platform.claude.com/docs/en/api/sdks/ruby](https://platform.claude.com/docs/en/api/sdks/ruby)**.

## Installation

Add to your application's Gemfile:

<!-- x-release-please-start-version -->

```ruby
gem "anthropic", "~> 1.82.0"
```

<!-- x-release-please-end -->

## Getting started

```ruby
require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Client.new(
  api_key: ENV["ANTHROPIC_API_KEY"] # This is the default and can be omitted
)

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [{role: "user", content: "Hello, Claude"}],
  model: "claude-opus-5-5"
)

puts(message.content)
```


## Requirements

Ruby 3.2.0+

## OpenTelemetry

Spans are on by default.
Register a tracer provider with OpenTelemetry, for example with `OpenTelemetry::SDK.configure`, and every client reports each API call as a span.
No client option is needed.
Each request also carries the trace context in the headers that the registered propagator writes, such as `traceparent`, with or without a tracer provider.

The `open_telemetry` client option changes the default:

- `open_telemetry: {tracer_provider: provider}` uses `provider` instead of the registered tracer provider.
- `open_telemetry: {propagation: false}` sends no trace context headers, such as `traceparent` and `baggage`, with the client's requests.
  It is for an application whose HTTP client instrumentation already sends them, so that a request does not carry them twice. The spans are unaffected.
- `open_telemetry: false` turns the spans and the trace context headers off. It is short for `{traces: false}`, which is short for `{traces: {enabled: false}}`.
- `open_telemetry: {traces: {content_mode: :content}}` adds the messages, stop sequences, and tool calls to the spans.
  It also adds `url.query` and `url.full` to the span of a request whose query has an `email`, `path_prefix` or `expected_content_sha256` parameter, which has neither otherwise.
- `open_telemetry: {traces: {max_content_bytes: 65_536}}` sets the most bytes of content that one span holds, in place of 0.75 MB.
  A span whose content is cut to fit has `anthropic.content.truncated`.

`open_telemetry: true` is short for `{traces: true}`, and `traces: true` is short for `traces: {enabled: true}`.
With `enabled: false`, the other keys of `traces` are unused.
What the option leaves unset has its default.

A client that is given no `open_telemetry` option reads the environment when it is made: `ANTHROPIC_OPEN_TELEMETRY=false` turns its spans and the trace context headers off, `ANTHROPIC_OPEN_TELEMETRY_PROPAGATION=false` turns only the headers off, `ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE=content` adds the content, and `ANTHROPIC_OPEN_TELEMETRY_TRACES_MAX_CONTENT_BYTES=65536` sets the most bytes.
A client that is given the option, even `true` or `{}`, reads none of these variables: `open_telemetry: true` turns the spans on whatever `ANTHROPIC_OPEN_TELEMETRY` says.

The keys of the option, and of its `traces`, can be Symbols or Strings, and a key that the option does not have raises `ArgumentError`.
So does a `propagation` other than `true` or `false`, a `content_mode` other than `:metadata_only` or `:content`, and a `max_content_bytes` that is not an Integer of 1 or more.
An environment variable with such a value is ignored.

One request option sets `gen_ai.conversation.id` on the span of a call:

```ruby
anthropic.messages.create(**params, request_options: {open_telemetry: {conversation_id: id}})
```

`conversation_id` is the only key of the request option, and any other key raises `ArgumentError`: the tracer provider, `propagation` and the `traces` settings belong to the client.
Without it, the span of a request to a Session thread, such as `beta.sessions.threads.retrieve`, has the thread's ID as its `gen_ai.conversation.id`.

In the content mode, the content of a streamed response comes from the message that `messages.stream` accumulates.
The span of a `messages.stream_raw` call has the request's content only.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

This project is licensed under the Apache License, Version 2.0. See the [LICENSE](LICENSE) file for details. Versions released before the change from the MIT License, and third-party contributions merged before it, remain under the MIT License. See [LICENSE-MIT](LICENSE-MIT).

## Acknowledgements

Thank you [@alexrudall](https://github.com/alexrudall) for giving feedback, donating the anthropic Ruby Gem name, and paving the way by building the first Anthropic Ruby SDK.
