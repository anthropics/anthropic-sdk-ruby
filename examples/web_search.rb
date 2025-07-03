#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

message = anthropic.messages.create(
  model: "claude-sonnet-4-20250514",
  max_tokens: 1024,
  messages: [{role: :user, content: "What's the weather in New York?"}],
  tools: [
    {
      name: "web_search",
      type: "web_search_20250305"
    }
  ]
)

message
  .content
  .each do |content|
    case content
    when Anthropic::ServerToolUseBlock
      pp("Tool use: ---")
      pp(content.input)
    when Anthropic::WebSearchToolResultBlock
      pp("Search: ---")
      pp(content.content)
    when Anthropic::TextBlock
      pp("Text: ---")
      pp(content.text)
    end
  end

pp("Input tokens: #{message.usage.input_tokens}")

pp("Output tokens: #{message.usage.output_tokens}")
