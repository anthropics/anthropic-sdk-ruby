#!/usr/bin/env -S -- ruby
# frozen_string_literal: true
# typed: strong

require_relative "../../lib/anthropic"

# gets API credentials from environment variable `CLOUD_ML_REGION` and `ANTHROPIC_VERTEX_PROJECT_ID`
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
