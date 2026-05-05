#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

# --- Turn 1: Ask an initial question with extended thinking enabled ---
puts("--- Turn 1: Initial question ---")

first_response = anthropic.messages.create(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 8000,
  thinking: {type: :enabled, budget_tokens: 5000},
  messages: [{role: :user, content: "What are the three largest prime numbers below 1000?"}]
)

first_response.content.each do |block|
  case block
  when Anthropic::ThinkingBlock
    puts("Thinking: #{block.thinking[0..200]}...")
  when Anthropic::TextBlock
    puts("Response: #{block.text}")
  end
end

# --- Turn 2: Follow up, carrying forward thinking blocks ---
#
# IMPORTANT: When using extended thinking in multi-turn conversations, you must
# include ALL content blocks from the assistant's previous response — including
# `thinking` and `redacted_thinking` blocks — in the messages array. The API
# will reject requests that strip thinking blocks from prior assistant turns.
#
# The response's `.content` already contains the correctly typed blocks
# (ThinkingBlock, RedactedThinkingBlock, TextBlock), so you can pass them
# directly as the assistant message content.
puts("\n--- Turn 2: Follow-up question (thinking blocks carried forward) ---")

second_response = anthropic.messages.create(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 8000,
  thinking: {type: :enabled, budget_tokens: 5000},
  messages: [
    {role: :user, content: "What are the three largest prime numbers below 1000?"},
    # Pass ALL content blocks (thinking + text) from the first response
    {role: :assistant, content: first_response.content},
    {role: :user, content: "Now multiply the largest of those primes by 2. Is the result also prime?"}
  ]
)

second_response.content.each do |block|
  case block
  when Anthropic::ThinkingBlock
    puts("Thinking: #{block.thinking[0..200]}...")
  when Anthropic::TextBlock
    puts("Response: #{block.text}")
  end
end
