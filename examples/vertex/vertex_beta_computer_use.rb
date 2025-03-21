#!/usr/bin/env -S -- ruby
# frozen_string_literal: true
# typed: strong

require_relative "../../lib/anthropic"

# gets API credentials from environment variable `CLOUD_ML_REGION` and `ANTHROPIC_VERTEX_PROJECT_ID`
anthropic = Anthropic::Vertex::Client.new

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
      type: "computer_20250124",
      name: "computer",
      display_width_px: 1024,
      display_height_px: 768,
      display_number: 1
    },
    {
      type: "text_editor_20250124",
      name: "str_replace_editor"
    },
    {
      type: "bash_20250124",
      name: "bash"
    }
  ],
  model: "claude-3-7-sonnet@20250219",
  betas: ["computer-use-2025-01-24"]
)

puts(message.content)
