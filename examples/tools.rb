# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

user_message = {
  role: "user",
  content: "What is the weather in SF?"
}

tools = [
  {
    name: "get_weather",
    description: "Get the weather for a specific location",
    input_schema: {
      type: "object",
      properties: {
        location: {type: "string"}
      }
    }
  }
]

message = client.messages.create(
  model: "claude-sonnet-4-20250514",
  max_tokens: 1024,
  messages: [user_message],
  tools: tools
)

puts "Initial response: #{JSON.pretty_generate(message)}"

raise "Expected tool_use stop_reason" unless message.stop_reason == :tool_use

tool = message.content.find { |c| c.type == :tool_use }

raise "Tool use not found" unless tool

response = client.messages.create(
  model: "claude-sonnet-4-20250514",
  max_tokens: 1024,
  messages: [
    user_message,
    {role: message.role, content: message.content},
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
  tools: tools
)

puts
puts "Final response: #{JSON.pretty_generate(response)}"
