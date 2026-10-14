#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# Every client reports its API calls as spans once the application has registered a tracer
# provider with OpenTelemetry, for example with `OpenTelemetry::SDK.configure`.
# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

# adds the messages, stop sequences and tool calls to the spans, up to 64 KiB a span
verbose = Anthropic::Client.new(open_telemetry: {traces: {content_mode: :content, max_content_bytes: 65_536}})

# emits no spans
quiet = Anthropic::Client.new(open_telemetry: {traces: false})

[anthropic, verbose, quiet].each do |client|
  message = client.messages.create(
    max_tokens: 1024,
    messages: [{role: :user, content: "hello"}],
    model: :"claude-sonnet-5-5",
    # sets `gen_ai.conversation.id` on the span of this call
    request_options: {open_telemetry: {conversation_id: "conversation-1"}}
  )

  pp(message.content)
end
