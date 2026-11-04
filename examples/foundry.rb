#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets the resource and API key from `ANTHROPIC_FOUNDRY_RESOURCE` and
# `ANTHROPIC_FOUNDRY_API_KEY`; for Microsoft Entra ID, pass
# `azure_ad_token_provider` instead of an API key
anthropic = Anthropic::FoundryClient.new

message = anthropic.messages.create(
  max_tokens: 100,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "claude-haiku-5-5"
)

puts message
