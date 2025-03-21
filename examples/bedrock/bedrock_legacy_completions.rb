#!/usr/bin/env -S -- ruby
# frozen_string_literal: true
# typed: strong

require_relative "../../lib/anthropic"

# gets API credentials from environment variable `AWS_REGION` and `AWS_SECRET_ACCESS_KEY`
anthropic = Anthropic::Bedrock::Client.new

completion =  anthropic.completions.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "anthropic.claude-v2:1"
)

pp(completion)
