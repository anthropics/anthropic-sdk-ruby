#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: true

require "time"
require_relative "../lib/anthropic"

class CurrentTime < Anthropic::BaseTool
  class Input < Anthropic::BaseModel
  end

  doc "Get the current time in UTC"
  input_schema Input

  def call(_input)
    Time.now.utc.iso8601
  end
end

client = Anthropic::Client.new

client.beta.messages.tool_runner(
  model: "claude-sonnet-5-5",
  max_tokens: 1024,
  messages: [{role: "user", content: "What time is it, and what is today's science news?"}],
  tools: [
    CurrentTime.new,
    Anthropic::Beta::BetaWebSearchTool20260209.new(name: :web_search, type: :web_search_20260209)
  ]
).each_message do |message|
  pp(message.content)
end
