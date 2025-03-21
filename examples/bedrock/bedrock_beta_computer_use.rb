#!/usr/bin/env -S -- ruby
# frozen_string_literal: true
# typed: strong

require_relative "../../lib/anthropic"

# gets API credentials from environment variable `AWS_REGION` and `AWS_SECRET_ACCESS_KEY`
anthropic = Anthropic::Bedrock::Client.new

message = anthropic.beta.messages.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Save a picture of a cat to my desktop."
    }
  ],
  tools: [
    {
      type: "computer_20241022",
      name: "computer",
      display_width_px: 1024,
      display_height_px: 768,
      display_number: 1
    },
    {
      type: "text_editor_20241022",
      name: "str_replace_editor"
    },
    {
      type: "bash_20241022",
      name: "bash"
    }
  ],
  model: "us.anthropic.claude-3-5-sonnet-20241022-v2:0",
  betas: ["computer-use-2024-10-22"]
)

pp(message.content)
