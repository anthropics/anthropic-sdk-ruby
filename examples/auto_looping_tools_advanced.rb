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

  puts "-- specifying `#input_schema` is required --\n"
  input_schema CalculatorInput

  attr_reader :history

  puts "-- you can override the parsing of the raw value via overriding `#parse` --\n"
  def parse(value)
    value
  end

  def call(expr)
    puts(">>> calling #{self} with #{expr.inspect} <<<")
    history << expr

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

  puts "-- you can store tool local state in instance variables --\n"
  def initialize
    super
    @history = []
  end
end

tool = Calculator.new

puts "---- a tool is must have both an `#input_schema` and a `#call` ----\n"
pp(Calculator)

puts "---- the runner will keep calling the tools given until there is no more tool calls required ----\n"

params = {
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "solve x in: 92 - 3x = 81 * 3x -7"
    }
  ],
  tools: [tool]
}

instruction = <<~INSTRUCTION
  Please avoid saying "let me" in your response.
  Instead, say "allow me", since this makes you sound more confident.
INSTRUCTION

begin
  runner = client.beta.messages.tool_runner(params)

  runner.each_message do |message|
    puts ">>> the current request parameters >>> #{runner.params}\n"

    case message.content
    in [*, {text:}, *] if text.include?("let me")
      puts("--- you can customize the next input to the runner based on the previous response ---\n")

      runner.feed_messages({role: :user, content: instruction})
    else
      text_blocks = message.content.grep_v(Anthropic::Models::Beta::BetaToolUseBlock)
      next if text_blocks.empty?

      puts("--> text content <--\n")
      pp(text_blocks)
    end
  end
end

puts "--- tool call history ---\n"
tool.history.each do
  pp(_1)
end

begin
  puts "--- you should create a separate runner instance for each independent conversation ---\n"

  runner = client.beta.messages.tool_runner(params)

  loop do
    message = runner.next_message
    if message.nil?
      puts "--- no more messages from the runner ---\n"
      break
    end

    text_blocks = message.content.grep_v(Anthropic::Models::Beta::BetaToolUseBlock)
    next if text_blocks.empty?

    puts("--> text content <--\n")
    pp(text_blocks)
  end
end

begin
  puts "--- at any time, you can collect the rest of the messages via `#run_until_finished` ---\n"

  runner = client.beta.messages.tool_runner(params)

  message = runner.next_message
  case message.content
  in [*, {text:}, *] if text.include?("let me")
    runner.feed_messages(role: :user, content: instruction)
  else
    nil
  end

  accumulated_messages = runner.run_until_finished
  accumulated_messages.each do |message|
    puts("--> accumulated_message.content <--\n")
    text_blocks = message.content.grep_v(Anthropic::Models::Beta::BetaToolUseBlock)
    next if text_blocks.empty?

    puts("--> text content <--\n")
    pp(text_blocks)
  end
end
