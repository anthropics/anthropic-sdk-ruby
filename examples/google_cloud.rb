#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets project, location, and workspace from `ANTHROPIC_GOOGLE_CLOUD_PROJECT`,
# `ANTHROPIC_GOOGLE_CLOUD_LOCATION`, and `ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID`;
# auth via Google Application Default Credentials
anthropic = Anthropic::GoogleCloudClient.new

message = anthropic.messages.create(
  max_tokens: 100,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "claude-haiku-4-5"
)

puts message
