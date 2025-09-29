#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

pp("----- text streaming -----")

stream = anthropic.messages.stream(
  max_tokens: 1024,
  messages: [{role: :user, content: "Say hello there!"}],
  model: :"claude-sonnet-4-5-20250929"
)

# the .text method provides a convenient way to stream only text content.
stream.text.each do |text_delta|
  print(text_delta)
end

puts
