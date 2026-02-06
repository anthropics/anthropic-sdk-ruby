# Anthropic Ruby API Library

[![Gem Version](https://img.shields.io/gem/v/anthropic.svg)](https://rubygems.org/gems/anthropic)

The Anthropic Ruby library provides access to the [Anthropic API](https://docs.anthropic.com/en/api/) from Ruby applications.

## Documentation

Full documentation is available at **[docs.anthropic.com/en/api/sdks/ruby](https://docs.anthropic.com/en/api/sdks/ruby)**.

## Installation

Add to your application's Gemfile:

```ruby
gem "anthropic"
```

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
  model: :"claude-opus-4-6"
)

puts(message.content)
```

## Requirements

Ruby 3.2.0+

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

Thank you [@alexrudall](https://github.com/alexrudall) for giving feedback, donating the anthropic Ruby Gem name, and paving the way by building the first Anthropic Ruby SDK.
