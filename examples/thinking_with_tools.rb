#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: false

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

# Define a simple calculator tool using the SDK's BaseModel pattern.
class CalculatorInput < Anthropic::BaseModel
  required :expression, String, doc: "A mathematical expression to evaluate, e.g. '2 + 3 * 4'"

  doc "Evaluate a mathematical expression and return the result"
end

# --- Step 1: Send a request with both extended thinking and tools ---
puts("--- Step 1: Sending request with thinking + tools ---")

user_message = {
  role: "user",
  content: "I have 147 apples and want to split them evenly among 7 baskets. " \
           "How many apples go in each basket, and how many are left over?"
}

response = client.messages.create(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 8000,
  thinking: {type: :enabled, budget_tokens: 5000},
  messages: [user_message],
  tools: [CalculatorInput]
)

# Display thinking and identify tool use
response.content.each do |block|
  case block
  when Anthropic::ThinkingBlock
    puts("Thinking: #{block.thinking[0..200]}...")
  when Anthropic::TextBlock
    puts("Text: #{block.text}")
  when Anthropic::Models::ToolUseBlock
    puts("Tool call: #{block.name}(#{block.input.inspect})")
  end
end

# --- Step 2: Handle tool use if requested ---
if response.stop_reason == :tool_use
  tool_use = response.content.grep(Anthropic::Models::ToolUseBlock).first
  raise "Tool use block not found" unless tool_use

  # Simulate executing the calculator tool.
  # In a real application, you would evaluate the expression or call an external service.
  puts("\n--- Step 2: Executing tool '#{tool_use.name}' ---")
  expression = tool_use.input["expression"]
  puts("Expression: #{expression}")

  # rubocop:disable Security/Eval
  result = eval(expression).to_s
  # rubocop:enable Security/Eval
  puts("Result: #{result}")

  # --- Step 3: Send the tool result back, including all prior content blocks ---
  #
  # When combining thinking with tools, the assistant message must include ALL
  # content blocks from the response (thinking blocks + tool_use blocks).
  puts("\n--- Step 3: Sending tool result back ---")

  final_response = client.messages.create(
    model: "claude-sonnet-4-5-20250929",
    max_tokens: 8000,
    thinking: {type: :enabled, budget_tokens: 5000},
    messages: [
      user_message,
      # Include the full assistant response (thinking + tool_use blocks)
      {role: :assistant, content: response.content},
      # Provide the tool result
      {
        role: :user,
        content: [
          {
            type: :tool_result,
            tool_use_id: tool_use.id,
            content: [{type: :text, text: result}]
          }
        ]
      }
    ],
    tools: [CalculatorInput]
  )

  puts("\n--- Final response ---")
  final_response.content.each do |block|
    case block
    when Anthropic::ThinkingBlock
      puts("Thinking: #{block.thinking[0..200]}...")
    when Anthropic::TextBlock
      puts("Response: #{block.text}")
    end
  end
else
  # Model answered directly without using tools
  puts("\n--- Model responded without tool use ---")
end
