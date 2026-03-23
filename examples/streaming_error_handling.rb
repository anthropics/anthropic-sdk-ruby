#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

# The .type field on APIStatusError lets you identify error kinds uniformly
# across both HTTP errors and streaming errors. Streaming errors arrive as
# SSE error events with HTTP 200 status, so status codes and error subclasses
# are unreliable — but .type always reflects the actual error kind.

begin
  stream = client.messages.stream(
    model: :"claude-sonnet-4-5-20250929",
    max_tokens: 1024,
    messages: [{role: :user, content: "Hello"}]
  )
  stream.each { |event| puts(event) }
rescue Anthropic::Errors::APIStatusError => e
  puts("Error type: #{e.type}")
  puts("Status: #{e.status}")
  puts("Body: #{e.body}")

  case e.type
  when :rate_limit_error, :overloaded_error
    puts("Retryable error — back off and retry")
  when :authentication_error
    puts("Check your API key")
  when :invalid_request_error
    puts("Fix your request parameters")
  else
    puts("Unexpected error type: #{e.type.inspect}")
  end
end
