#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/anthropic"

anthropic = Anthropic::Client.new

# when using tools, the model may decide to call them during the response.
# tool definitions follow JSON Schema format for input validation.

class GetWeather < Anthropic::BaseModel
  required :location, String, doc: "The city and state, e.g. San Francisco, CA"
  required :unit,
           Anthropic::EnumOf[:celsius, :fahrenheit],
           doc: "The unit of temperature, either 'celsius' or 'fahrenheit'",
           nil?: true

  doc "Get the current weather in a given location"
end

class GetTime < Anthropic::BaseModel
  required :timezone, String, doc: "The IANA time zone name, e.g. America/Los_Angeles"

  doc "Get the current time in a given time zone"
end

stream = anthropic.messages.stream(
  max_tokens: 1024,
  model: "claude-sonnet-4-5-20250929",
  tools: [GetWeather, GetTime],
  messages: [
    {
      role: "user",
      content: "What is the weather like right now in New York? Also what time is it there?"
    }
  ]
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

message = stream.accumulated_message

# find and print parsed tool use blocks:
tool_uses = message.content.select { _1.type == :tool_use }
tool_uses.each do |tool_use|
  puts(<<-FMT)
  Tool: #{tool_use.name}
  JSON input:
  #{tool_use.input}
  Parsed object:
  FMT

  pp tool_use.parsed
end
