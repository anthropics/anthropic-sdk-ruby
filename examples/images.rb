#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require "base64"
require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

image = Pathname(__FILE__).parent.join("logo.png").read

response = anthropic.messages.create(
  model: "claude-sonnet-4-20250514",
  max_tokens: 1024,
  messages: [
    {
      role: :user,
      content: [
        {
          type: :text,
          text: "Hello!"
        },
        {
          type: :image,
          source: {
            type: "base64",
            media_type: "image/png",
            data: Base64.strict_encode64(image)
          }
        }
      ]
    }
  ]
)

pp(response)
