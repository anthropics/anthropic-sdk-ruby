#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

begin
  pp("----- basic streaming -----")

  # create a streaming message request. This returns a MessageStream object
  # that emits events as the response is generated.
  stream = anthropic.messages.stream(
    max_tokens: 1024,
    messages: [{role: :user, content: "Say hello there!"}],
    model: :"claude-sonnet-4-5-20250929"
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

  # after the stream is consumed, you can access the final accumulated text.
  puts("\nResponse:\n---------")
  pp(stream.accumulated_text)
end

begin
  pp("----- manual closing of stream -----")

  stream = anthropic.messages.stream(
    max_tokens: 1024,
    messages: [{role: :user, content: "Say hello there!"}],
    model: :"claude-sonnet-4-5-20250929"
  )

  # important: `stream` needs to be manually closed if it is not consumed.
  stream.close
end
