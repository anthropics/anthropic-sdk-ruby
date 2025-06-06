#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"
require "base64"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

image = Pathname(__FILE__).parent.join("logo.png").read

response = anthropic.messages.create(
  model: "claude-3-5-sonnet-latest",
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
