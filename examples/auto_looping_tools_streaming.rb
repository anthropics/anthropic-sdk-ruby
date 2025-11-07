#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

class CalculatorInput < Anthropic::BaseModel
  required :lhs, Float, doc: "left hand side operand"
  required :rhs, Float, doc: "right hand side operand"
  required :operator, Anthropic::InputSchema::EnumOf[:+, :-, :*, :/, :**]
end

class Calculator < Anthropic::BaseTool
  doc "i do math"
  input_schema CalculatorInput

  def call(expr)
    puts(">>> calling #{self} with #{expr.inspect} <<<")

    case expr.operator
    in :+
      expr.lhs + expr.rhs
    in :-
      expr.lhs - expr.rhs
    in :*
      expr.lhs * expr.rhs
    in :/
      expr.lhs / expr.rhs
    in :**
      expr.lhs**expr.rhs
    end
  end
end

tool = Calculator.new

puts "---- a tool is must have both an `#input_schema` and a `#call` ----\n"
pp(Calculator)

puts "---- the runner will keep calling the tools given until there is no more tool calls required ----\n"

client.beta.messages.tool_runner(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "solve x in: 92 - 3x = 81 * 3x -7"
    }
  ],
  tools: [tool]
).each_streaming do |stream|
  stream.each do |event|
    pp(event)
  end

  puts("\n--> stream.accumulated_text <--\n")
  puts(stream.accumulated_text)
  puts("\n")
end
