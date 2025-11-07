#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: false

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

class GetWeatherInput < Anthropic::BaseModel
  required :location, String, doc: "The city and state, e.g. San Francisco, CA"
  required :unit,
           Anthropic::EnumOf[:celsius, :fahrenheit],
           doc: "The unit of temperature, either 'celsius' or 'fahrenheit'",
           nil?: true

  doc "Get the current weather in a given location"
end

user_message = {
  role: "user",
  content: "What is the weather in SF?"
}

puts("--- you can specify a custom name for the tool ---\n")

message = client.messages.create(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  messages: [user_message],
  tools: [{name: "get_weather_tool", input_schema: GetWeatherInput}]
)

pp("custom tool name called: #{message.content.first.name}")

puts("--- full message ---\n")

puts(message)
