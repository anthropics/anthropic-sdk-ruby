#!/usr/bin/env -S -- ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

begin
  pp("----- basic streaming -----")

  stream = anthropic.messages.create_streaming(
    max_tokens: 1024,
    messages: [{role: :user, content: "Say hello there!"}],
    model: :"claude-3-7-sonnet-latest"
  )

  # calling `#each` will always clean up the stream, even if an error is thrown inside the `#each` block.
  stream.each do |message|
    pp(message)

    # it is possible to exit out of the `#each` loop early, this will also clean up the stream for you.
    if rand >= 0.99
      pp("randomly exit")
      break
    end
  end

  # once the stream has been exhausted, no more chunks will be produced.
  stream.each do
    pp("this will never run")
  end
end

begin
  pp("----- manual closing of stream -----")

  stream = anthropic.messages.create_streaming(
    max_tokens: 1024,
    messages: [{role: :user, content: "Say hello there!"}],
    model: :"claude-3-7-sonnet-latest"
  )

  # `stream` need to be manually closed if it is not consumed
  stream.close
end
