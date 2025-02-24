# frozen_string_literal: true

require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Bedrock::Client.new

completion =  anthropic.completions.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "anthropic.claude-v2:1"
)

puts completion
