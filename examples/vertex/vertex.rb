# frozen_string_literal: true

require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Vertex::Client.new

message = anthropic.messages.create(
  max_tokens: 100,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "claude-3-7-sonnet@20250219"
)

puts message
