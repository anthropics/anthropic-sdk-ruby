#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: false

require_relative "../lib/anthropic"

# 1. Server-side fallbacks (preferred): the API retries a refusal itself —
# one request, a plain client, no client-side logic. Use this when talking
# to the API directly.
client = Anthropic::Client.new
served = client.beta.messages.create(
  model: :"claude-fable-5",
  max_tokens: 1024,
  messages: [{role: :user, content: "Some prompt that triggers a refusal"}],
  fallbacks: [{model: "claude-opus-4-8"}],
  betas: ["server-side-fallback-2026-06-01"]
)
puts("server-side, served by: #{served.model}")

# If your provider doesn't support server-side fallbacks, register the
# client-side middleware instead:
fallback_client = Anthropic::Client.new(
  middleware: [Anthropic::BetaRefusalFallbackMiddleware.new([{model: "claude-opus-4-8"}])]
)
state = Anthropic::BetaFallbackState.new # pins follow-ups to the model that accepted

# 2. Streaming: on a refusal the middleware retries and splices the
# fallback's events onto the open stream — one continuous message, with a
# `fallback` content block marking the model boundary.
stream = fallback_client.beta.messages.stream(
  model: :"claude-fable-5",
  max_tokens: 1024,
  messages: [{role: :user, content: "Some prompt that triggers a refusal"}],
  request_options: {fallback_state: state}
)
stream.each do |event|
  case event.type
  when :content_block_delta
    print(event.delta.text) if event.delta.type == :text_delta
  when :content_block_start
    if event.content_block.type == :fallback
      from = event.content_block.from
      to = event.content_block.to
      puts("\n--- fell back: #{from.model} -> #{to.model} ---")
    end
  end
end
puts("\nstreaming, served by: #{stream.accumulated_message.model}")

# 3. Non-streaming: same middleware, the retry just happens before you get
# the message back.
message = fallback_client.beta.messages.create(
  model: :"claude-fable-5",
  max_tokens: 1024,
  messages: [{role: :user, content: "Some prompt that triggers a refusal"}],
  request_options: {fallback_state: state} # reusing the state keeps the conversation pinned
)
puts("non-streaming, served by: #{message.model}")
