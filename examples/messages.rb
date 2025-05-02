#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

response = anthropic.messages.create(
  max_tokens: 1024,
  messages: [{role: :user, content: "hello"}],
  model: :"claude-3-7-sonnet-latest"
)

pp(response)

response = anthropic.messages.create(
  max_tokens: 1024,
  messages: [
    {role: :user, content: "hello"},
    {role: response.role, content: response.content},
    {role: :user, content: "hello again"}
  ],
  model: :"claude-3-7-sonnet-latest"
)

pp(response)
