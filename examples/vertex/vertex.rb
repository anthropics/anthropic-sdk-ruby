#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../../lib/anthropic"

# gets API credentials from environment variable `CLOUD_ML_REGION` and `ANTHROPIC_VERTEX_PROJECT_ID`
anthropic = Anthropic::VertexClient.new

message = anthropic.messages.create(
  max_tokens: 100,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "claude-sonnet-4@20250514"
)

puts message
