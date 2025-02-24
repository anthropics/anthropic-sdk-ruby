# frozen_string_literal: true

require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Bedrock::Client.new

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "us.anthropic.claude-3-5-haiku-20241022-v1:0"
)

puts(message.content)
