#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

stream = anthropic.messages.stream_raw(
  model: "claude-3-7-sonnet-20250219",
  max_tokens: 1024,
  messages: [{role: :user, content: "What's the weather in New York?"}],
  tools: [
    {
      name: "web_search",
      type: "web_search_20250305"
    }
  ]
)

stream
  .each do |event|
    case event
    when Anthropic::Models::RawContentBlockStartEvent
      pp("Started(#{event.index}): ---")
      pp(event.content_block)
    when Anthropic::Models::RawContentBlockDeltaEvent
      pp("Delta: ---")
      pp(event.delta)
    when Anthropic::Models::RawContentBlockStopEvent
      pp("Stopped(#{event.index}): ---")
    end
  end
