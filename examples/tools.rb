#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: false

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

class GetWeather < Anthropic::BaseModel
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

message = client.messages.create(
  model: "claude-sonnet-4-20250514",
  max_tokens: 1024,
  messages: [user_message],
  tools: [GetWeather]
)

puts "Initial response: ", message

raise "Expected tool_use stop_reason" unless message.stop_reason == :tool_use

tool = message.content.grep(Anthropic::Models::ToolUseBlock).first

raise "Tool use not found" unless tool

response = client.messages.create(
  model: "claude-sonnet-4-20250514",
  max_tokens: 1024,
  messages: [
    user_message,
    {role: message.role, content: message.content},
    # create a new user message with type tool_result that provides the execution result of the tool
    # ("The weather is 73f"). this simulates that we ran the weather tool and got this result.
    {
      role: "user",
      content: [
        {
          type: "tool_result",
          tool_use_id: tool.id,
          content: [
            {type: "text", text: "The weather is 73f"}
          ]
        }
      ]
    }
  ],
  tools: [GetWeather]
)

puts "Final response: ", response
