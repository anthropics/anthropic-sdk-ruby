#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

pp("----- tools stream -----")

# when using tools, the model may decide to call them during the response.
# tool definitions follow JSON Schema format for input validation.
stream = anthropic.messages.stream(
  max_tokens: 1024,
  model: "claude-3-5-sonnet-latest",
  tools: [
    {
      name: "get_weather",
      description: "Get the weather at a specific location",
      input_schema: {
        type: "object",
        properties: {
          location: {type: "string", description: "The city and state, e.g. San Francisco, CA"},
          unit: {
            type: "string",
            enum: %w[celsius fahrenheit],
            description: "Unit for the output"
          }
        },
        required: ["location"]
      }
    }
  ],
  messages: [{role: "user", content: "What is the weather in SF?"}]
)

stream.each do |event|
  case event
  when Anthropic::Streaming::InputJsonEvent
    # InputJsonEvent fires as the model streams JSON for tool inputs.
    # partial_json contains the incremental JSON string delta.
    # snapshot contains the accumulated JSON string so far.
    puts("delta: #{event.partial_json}")
    puts("snapshot: #{event.snapshot}")
  end
end

puts
