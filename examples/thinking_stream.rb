#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: true

require_relative "../lib/anthropic"

# helper function to output thinking events as they stream in.
def output_thoughts(thinking_stream)
  thinking_stream.each do |event|
    print(event.thinking)
  end
end

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

pp("----- thinking stream -----")

stream = anthropic.messages.stream(
  max_tokens: 3200,
  thinking: {type: :enabled, budget_tokens: 1600},
  messages: [{role: :user, content: "Create a haiku about space."}],
  model: :"claude-3-7-sonnet-latest"
)

# use grep to filter only ThinkingEvent objects, and use lazy to do so in real time.
thinking_stream = stream.lazy.grep(Anthropic::Streaming::ThinkingEvent)

puts("Thinking:\n---------")
output_thoughts(thinking_stream)

# the accumulated_text method returns only the final response text,
# excluding the thinking content.
puts("\n\nResult:\n-----")
puts(stream.accumulated_text)
