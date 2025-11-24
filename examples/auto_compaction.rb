#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/anthropic"

# Gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

# Simple tool for the example
class SubmitAnalysisInput < Anthropic::BaseModel
  required :summary, String, doc: "The final analysis summary"
end

class SubmitAnalysisTool < Anthropic::BaseTool
  doc "Call this LAST with your final analysis."
  input_schema SubmitAnalysisInput

  def call(input)
    puts("\n>>> Analysis submitted: #{input.summary[0..50]}... <<<")
    "Analysis submitted"
  end
end

tool = SubmitAnalysisTool.new

puts "=" * 80
puts "Auto-Compaction Example"
puts "=" * 80
puts "\nThis example demonstrates automatic context compaction."
puts "We're using a low threshold (2000 tokens) to trigger compaction."
puts "\n#{'=' * 80}\n\n"

# Create a tool runner with auto-compaction enabled
runner = client.beta.messages.tool_runner(
  model: "claude-sonnet-4-20250514",
  max_tokens: 4000,
  max_iterations: 10,
  tools: [tool],
  messages: [
    {
      role: :user,
      content: "Write a detailed 500 word essay about dogs, cats, and birds. " \
               "Call the tool submit_analysis with the information about all three animals. " \
               "Note that you should call it only once at the end of your essay"
    }
  ],
  compaction_control: {
    enabled: true,
    context_token_threshold: 2000,
    on_compact: ->(tokens_before, tokens_after) do
      puts("\n#{'!' * 80}")
      puts("COMPACTION OCCURRED!")
      puts("  Tokens before: #{tokens_before}")
      puts("  Tokens after:  #{tokens_after}")
      reduction = tokens_before - tokens_after
      percentage = ((1 - (tokens_after.to_f / tokens_before)) * 100).round(1)
      puts("  Reduction:     #{reduction} tokens (#{percentage}%)")
      puts("#{'!' * 80}\n\n")
    end
  }
)

# Iterate through messages and print token usage
iteration = 0
runner.each_message do |message|
  iteration += 1
  puts "Iteration #{iteration}:"
  puts "  Input tokens:  #{message.usage.input_tokens}"
  puts "  Output tokens: #{message.usage.output_tokens}"
  puts "  Total tokens:  #{message.usage.input_tokens + message.usage.output_tokens}"

  # Show text content (skip tool use blocks)
  text_blocks = message.content.grep_v(Anthropic::Models::Beta::BetaToolUseBlock)
  unless text_blocks.empty?
    puts "\n  Text content preview:"
    text_blocks.each do |block|
      preview = block.text[0..100].gsub("\n", " ")
      puts "    #{preview}#{'...' if block.text.length > 100}"
    end
  end

  puts "\n"
end

puts "=" * 80
puts "Final message reached!"
puts "=" * 80
puts "\nNotice how the context was automatically compacted when the token"
puts "threshold was exceeded, allowing the conversation to continue efficiently."
