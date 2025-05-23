#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

message = anthropic.messages.create(
  model: "claude-3-7-sonnet-20250219",
  max_tokens: 3200,
  thinking: {type: :enabled, budget_tokens: 1600},
  messages: [{role: :user, content: "Create a haiku about Anthropic."}]
)

message
  .content
  .each do |content|
    case content
    when Anthropic::ThinkingBlock
      pp("Thinking: ---")
      pp(content.thinking)
    when Anthropic::TextBlock
      pp("Text: ---")
      pp(content.text)
    end
  end
