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

result = anthropic.messages.count_tokens(
  model: "claude-sonnet-4-5-20250929",
  messages: [
    {
      role: "user",
      content: "give me some famous numbers"
    }
  ],
  output_config: {format: Output}
)

puts("Token count with output_config:")
pp(result)
