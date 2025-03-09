# Anthropic Ruby API library

The Anthropic Ruby library provides convenient access to the Anthropic REST API from any Ruby 3.0.0+ application.

## Documentation

Documentation for the most recent release of this gem can be found [on RubyDoc](https://gemdocs.org/gems/anthropic/latest).

The underlying REST API documentation can be found on [docs.anthropic.com](https://docs.anthropic.com/claude/reference/).

## Installation

To use this gem during the beta, install directly from GitHub with Bundler by adding the following to your application's `Gemfile`:

```ruby
gem "anthropic", git: "https://github.com/stainless-sdks/anthropic-ruby", branch: "main"
```

To fetch an initial copy of the gem:

```sh
bundle install
```

To update the version used by your application when updates are pushed to GitHub:

```sh
bundle update anthropic
```

## Usage

```ruby
require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Client.new(
  api_key: "my-anthropic-api-key" # defaults to ENV["ANTHROPIC_API_KEY"]
)

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [{
    role: "user",
    content: "Hello, Claude"
  }],
  model: "claude-3-5-sonnet-latest"
)

puts(message.content)
```

## Pagination

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

We provide support for streaming responses using Server Side Events (SSE).

```ruby
stream = anthropic.messages_create_streaming(
  max_tokens: 1024,
  messages: [{
    role: "user",
    content: "Hello, Claude"
  }],
  model: "claude-3-5-sonnet-latest"
)

stream.for_each do |message|
  puts(message.type)
end
```

### Errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `Anthropic::Error` will be thrown:

```ruby
begin
  message = anthropic.messages.create(
    max_tokens: 1024,
    messages: [{
      role: "user",
      content: "Hello, Claude"
    }],
    model: "claude-3-5-sonnet-latest"
  )
rescue Anthropic::Error => e
  puts(e.status) # 400
end
```

Error codes are as followed:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >=500       | `InternalServerError`      |
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
  messages: [{
    role: "user",
    content: "Hello, Claude"
  }],
  model: "claude-3-5-sonnet-latest",
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
  messages: [{
    role: "user",
    content: "Hello, Claude"
  }],
  model: "claude-3-5-sonnet-latest",
  request_options: {timeout: 5}
)
```

## Sorbet Support

This library is written with [Sorbet type definitions](https://sorbet.org/docs/rbi). However, there is no runtime dependency on the `sorbet-runtime`.

What this means is that while you can use Sorbet to type check your code statically, and benefit from the [Sorbet Language Server](https://sorbet.org/docs/lsp) in your editor, there is no runtime type checking and execution overhead from Sorbet itself.

Due to limitations with the Sorbet type system, where a method otherwise can take an instance of `Anthropic::BaseModel` class, you will need to use the `**` splat operator to pass the arguments:

```ruby
model = MessageCreateParams.new(
  max_tokens: 1024,
  messages: [{
    role: "user",
    content: "Hello, Claude"
  }],
  model: "claude-3-5-sonnet-latest"
)

anthropic.messages.create(**model)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.0.0 or higher.
