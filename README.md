# Anthropic Ruby API library

The Anthropic Ruby library provides convenient access to the Anthropic REST API from any Ruby 3.2.0+ application.

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/anthropic-sdk-beta).

The REST API documentation can be found on [docs.anthropic.com](https://docs.anthropic.com/claude/reference/).

## Installation

ℹ️ The `anthropic-sdk-beta` gem name is temporary. [@alexrudall](https://github.com/alexrudall) will be transitioning the [anthropic gem name](https://github.com/alexrudall/anthropic) to this repository. Here's the timeline:

- Early April, 2025: This library is released under the `anthropic-sdk-beta` gem name. We'll be gathering feedback from the community.

- Late April/early May: Bump the version `1.0`, and transition the `anthropic` gem name to this repository.

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "anthropic-sdk-beta", "~> 0.1.0.pre.beta.6"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Client.new(
  api_key: ENV["ANTHROPIC_API_KEY"] # This is the default and can be omitted
)

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [{role: "user", content: "Hello, Claude"}],
  model: :"claude-3-7-sonnet-latest"
)

puts(message.content)
```

### Feedback

We're looking for as much feedback as possible while the SDK is in Beta. If you have recommendations, notice bugs, find things confusing, or anything else, create a github issue. Don't be shy -- we're very open to hearing any thoughts and musings you have!

Feel free to make an issue for more substantial issues. For smaller issues or stream-of-thought, you can use the [pinned issue here](https://github.com/anthropics/anthropic-sdk-ruby/issues/85).

## Sorbet

This library is written with [Sorbet type definitions](https://sorbet.org/docs/rbi). However, there is no runtime dependency on the `sorbet-runtime`.

When using sorbet, it is recommended to use model classes as below. This provides stronger type checking and tooling integration.

```ruby
anthropic.messages.create(
  max_tokens: 1024,
  messages: [Anthropic::Models::MessageParam.new(role: "user", content: "Hello, Claude")],
  model: :"claude-3-7-sonnet-latest"
)
```

### Pagination

List methods in the Anthropic API are paginated.

This library provides auto-paginating iterators with each list response, so you do not have to request successive pages manually:

```ruby
page = anthropic.beta.messages.batches.list(limit: 20)

# Fetch single item from page.
batch = page.data[0]
puts(batch.id)

# Automatically fetches more pages as needed.
page.auto_paging_each do |batch|
  puts(batch.id)
end
```

### Streaming

We provide support for streaming responses using Server-Sent Events (SSE).

**coming soon**: `anthropic.messages.stream` will have [Python SDK](https://github.com/anthropics/anthropic-sdk-python?tab=readme-ov-file#streaming-helpers) style streaming response helpers.

```ruby
stream = anthropic.messages.stream_raw(
  max_tokens: 1024,
  messages: [{role: "user", content: "Hello, Claude"}],
  model: :"claude-3-7-sonnet-latest"
)

stream.each do |message|
  puts(message.type)
end
```

### Errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `Anthropic::Errors::APIError` will be thrown:

```ruby
begin
  message = anthropic.messages.create(
    max_tokens: 1024,
    messages: [{role: "user", content: "Hello, Claude"}],
    model: :"claude-3-7-sonnet-latest"
  )
rescue Anthropic::Errors::APIError => e
  puts(e.status) # 400
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
anthropic = Anthropic::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
anthropic.messages.create(
  max_tokens: 1024,
  messages: [{role: "user", content: "Hello, Claude"}],
  model: :"claude-3-7-sonnet-latest",
  request_options: {max_retries: 5}
)
```

### Timeouts

By default, requests will time out after 600 seconds.

Timeouts are applied separately to the initial connection and the overall request time, so in some cases a request could wait 2\*timeout seconds before it fails.

You can use the `timeout` option to configure or disable this:

```ruby
# Configure the default for all requests:
anthropic = Anthropic::Client.new(
  timeout: nil # default is 600
)

# Or, configure per-request:
anthropic.messages.create(
  max_tokens: 1024,
  messages: [{role: "user", content: "Hello, Claude"}],
  model: :"claude-3-7-sonnet-latest",
  request_options: {timeout: 5}
)
```

## Model DSL

This library uses a simple DSL to represent request parameters and response shapes in `lib/anthropic/models`.

With the right [editor plugins](https://shopify.github.io/ruby-lsp), you can ctrl-click on elements of the DSL to navigate around and explore the library.

In all places where a `BaseModel` type is specified, vanilla Ruby `Hash` can also be used. For example, the following are interchangeable as arguments:

```ruby
# This has tooling readability, for auto-completion, static analysis, and goto definition with supported language services
params = Anthropic::Models::MessageCreateParams.new(
  max_tokens: 1024,
  messages: [Anthropic::Models::MessageParam.new(role: "user", content: "Hello, Claude")],
  model: :"claude-3-7-sonnet-latest"
)

# This also works
params = {
  max_tokens: 1024,
  messages: [{role: "user", content: "Hello, Claude"}],
  model: :"claude-3-7-sonnet-latest"
}
```

## Editor support

A combination of [Shopify LSP](https://shopify.github.io/ruby-lsp) and [Solargraph](https://solargraph.org/) is recommended for non-[Sorbet](https://sorbet.org) users. The former is especially good at go to definition, while the latter has much better auto-completion support.

## AWS Bedrock

This library also provides support for the [Anthropic Bedrock API](https://aws.amazon.com/bedrock/claude/) if you install this library with the `aws-sdk-bedrockruntime` gem.

You can then instantiate a separate `Anthropic::BedrockClient` class, and use AWS's standard guide for configuring credentials (see [the aws-sdk-ruby gem README](https://github.com/aws/aws-sdk-ruby?tab=readme-ov-file#configuration) or [AWS Documentation](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html#credchain)). It has the same API as the base `Anthropic::Client` class.

Note that the model ID required is different for Bedrock models, and, depending on the model you want to use, you will need to use either the AWS's model ID for Anthropic models -- which can be found in [AWS's Bedrock model catalog](https://docs.aws.amazon.com/bedrock/latest/userguide/models-supported.html) -- or an inference profile id (e.g. `us.anthropic.claude-3-5-haiku-20241022-v1:0` for Claude 3.5 Haiku).

```ruby
require "bundler/setup"
require "anthropic"

anthropic = Anthropic::BedrockClient.new

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "anthropic.claude-3-5-sonnet-20241022-v2:0"
)

puts(message)
```

For more examples see [`examples/bedrock`](examples/bedrock).

## Google Vertex

This library also provides support for the [Anthropic Vertex API](https://cloud.google.com/vertex-ai?hl=en) if you install this library with the `googleauth` gem.

You can then import and instantiate a separate `Anthropic::VertexClient` class, and use Google's guide for configuring [Application Default Credentials](https://cloud.google.com/docs/authentication/provide-credentials-adc). It has the same API as the base `Anthropic::Client` class.

```ruby
require "bundler/setup"
require "anthropic"

anthropic = Anthropic::VertexClient.new(region: "us-east5", project_id: "my-project-id")

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "claude-3-7-sonnet@20250219"
)

puts(message)
```

For more examples see [`examples/vertex`](examples/vertex).

## Advanced concepts

### Making custom/undocumented requests

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a requests as seen in examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints, you can make requests using `client.request`. Options on the client will be respected (such as retries) when making this request.

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"he": "llo"},
)
```

### Concurrency & connection pooling

The `Anthropic::Client` instances are thread-safe, and should be re-used across multiple threads. By default, each `Client` have their own HTTP connection pool, with a maximum number of connections equal to thread count.

When the maximum number of connections has been checked out from the connection pool, the `Client` will wait for an in use connection to become available. The queue time for this mechanism is accounted for by the per-request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

Currently, `Anthropic::Client` instances are only fork-safe if there are no in-flight HTTP requests.

### Sorbet

#### Enums

Sorbet's typed enums require sub-classing of the [`T::Enum` class](https://sorbet.org/docs/tenum) from the `sorbet-runtime` gem.

Since this library does not depend on `sorbet-runtime`, it uses a [`T.all` intersection type](https://sorbet.org/docs/intersection-types) with a ruby primitive type to construct a "tagged alias" instead.

```ruby
module Anthropic::Models::StopReason
  # This alias aids language service driven navigation.
  TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::StopReason) }
end
```

#### Argument passing trick

It is possible to pass a compatible model / parameter class to a method that expects keyword arguments by using the `**` splat operator.

```ruby
params = Anthropic::Models::MessageCreateParams.new(
  max_tokens: 1024,
  messages: [Anthropic::Models::MessageParam.new(role: "user", content: "Hello, Claude")],
  model: :"claude-3-7-sonnet-latest"
)
anthropic.messages.create(**params)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/anthropics/anthropic-sdk-ruby/tree/main/CONTRIBUTING.md).

## Acknowledgements

Thank you [@alexrudall](https://github.com/alexrudall) for giving feedback, donating the `anthropic` Ruby Gem name, and paving the way by building the first Anthropic Ruby SDK.
