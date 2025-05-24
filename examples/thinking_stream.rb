#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

stream = anthropic.messages.stream_raw(
  model: "claude-3-7-sonnet-20250219",
  max_tokens: 3200,
  thinking: {type: :enabled, budget_tokens: 1600},
  messages: [{role: :user, content: "Create a haiku about Anthropic."}]
)

stream
  .lazy
  .grep(Anthropic::RawContentBlockDeltaEvent)
  .map { _1.delta }
  .each do |delta|
    case delta
    when Anthropic::ThinkingDelta
      pp("Thinking: ---")
      pp(delta.thinking)
    when Anthropic::TextDelta
      pp("Text: ---")
      pp(delta.text)
    end
  end
