#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/anthropic"

anthropic = Anthropic::Client.new

class FamousNumber < Anthropic::BaseModel
  required :value, Float
  optional :reason, String, doc: "why is this number mathematically significant?"
end

class Output < Anthropic::BaseModel
  doc "some famous numbers"

  required :numbers, Anthropic::ArrayOf[FamousNumber], min_length: 3, max_length: 5
end

stream = anthropic.messages.stream(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 9999,
  messages: [
    {
      role: "user",
      content: "give me some famous numbers"
    }
  ],
  output_config: {format: Output}
)

begin
  puts("---- streaming text deltas ----\n")

  stream.text.each do |text|
    print(text)
  end

  puts("\n\n---- retrieving parsed structured output from accumulated message ----\n")

  pp(stream.accumulated_message.parsed_output)
end
