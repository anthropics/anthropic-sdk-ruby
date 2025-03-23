#!/usr/bin/env -S -- ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

begin
  pp("----- streams are enumerable -----")

  stream = anthropic.messages.create_streaming(
    max_tokens: 1024,
    messages: [{role: :user, content: "Say hello there!"}],
    model: :"claude-3-7-sonnet-latest"
  )

  # the `stream` itself is an `https://rubyapi.org/3.1/o/enumerable`
  #   which means that you can work with the stream almost as if it is an array
  all_deltas =
    stream
    # calling any of the `enumerable` methods will block until the whole stream is consumed
    #   it will also clean up the stream.
    .grep(Anthropic::Models::RawContentBlockDeltaEvent)
    .map do |event|
      event.delta
    end

  pp(all_deltas)

  # once the stream has been consumed, it will become "empty"
  pp("this will print an empty array")
  pp(stream.to_a)
end

begin
  pp("----- streams can be lazy -----")

  stream = anthropic.messages.create_streaming(
    max_tokens: 1024,
    messages: [{role: :user, content: "Say hello there!"}],
    model: :"claude-3-7-sonnet-latest"
  )

  stream_of_deltas =
    stream
    # calling `#lazy` will return a deferred `https://rubyapi.org/3.1/o/enumerator/lazy`
    .lazy
    # each successive calls to methods that return another `enumerable` will not consume the stream
    #   but rather, return a transformed stream. (see link above)
    .grep(Anthropic::Models::RawContentBlockDeltaEvent)
    .map do |event|
      event.delta
    end

  # prints the suspended intermediary stream
  pp(stream_of_deltas)
  # beware that if the intermediary stream is not used, a call to `stream.close` is required
  #  to release the underlying connection

  # method calls that do not return another `enumerable` will consume the intermediary stream
  #   and perform cleanup
  stream_of_deltas.each do |delta|
    pp(delta)
  end

  # at this point the stream has been consumed already, so it will return an empty array
  pp(stream_of_deltas.to_a)
end
