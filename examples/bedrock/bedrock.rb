#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../../lib/anthropic"

# gets API credentials from environment variable `AWS_REGION` and `AWS_SECRET_ACCESS_KEY`
anthropic = Anthropic::BedrockClient.new

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "us.anthropic.claude-sonnet-4-5-20250929-v1:0"
)

pp(message.content)
