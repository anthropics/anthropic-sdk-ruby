#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

message = anthropic.messages.create(
  model: "claude-sonnet-5",
  max_tokens: 16_000,
  thinking: {type: :adaptive, display_: :summarized},
  output_config: {effort: :high},
  messages: [
    {
      role: :user,
      content: "Create a haiku about Anthropic. Think carefully about syllable counts before answering."
    }
  ]
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
