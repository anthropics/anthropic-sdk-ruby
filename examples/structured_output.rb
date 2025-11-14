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

message = anthropic.beta.messages.create(
  model: "claude-sonnet-4-5-20250929-structured-outputs",
  betas: ["structured-outputs-2025-09-17"],
  max_tokens: 9999,
  messages: [
    {
      role: "user",
      content: "give me some famous numbers"
    }
  ],
  output_format: Output
)

begin
  puts("\n---- retrieving parsed structured json response via a short hand method: `#parsed_output` ----\n")

  pp(message.parsed_output)
end

begin
  puts("\n---- parsed structured json response without the short hand ----\n")

  parsed = message.content.first&.parsed

  pp(parsed)
end
