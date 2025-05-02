#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

begin
  pp("----- named arguments in sorbet -----")

  # the method signature in sorbet has named arguments
  #   the following example type checks.
  message = anthropic.messages.create(
    max_tokens: 1024,
    # Sorbet works best when using `Class` types instead of raw `Hash`es
    messages: [Anthropic::Models::MessageParam.new(role: :user, content: "hello")],
    model: :"claude-3-7-sonnet-latest"
  )

  pp(message.content.first)
end

begin
  pp("----- trying to use params class in sorbet -----")

  params = Anthropic::Models::MessageCreateParams.new(
    max_tokens: 1024,
    # Using a raw `Hash` where sorbet expects `Class`es still works
    #   but due to current limitations of the typechecker, the SDK cannot provide type safety when doing so.
    messages: [{role: :user, content: "hello"}],
    model: :"claude-3-7-sonnet-latest"
  )

  # if you have sorbet LSP enabled, and uncomment the two lines below
  #   you will see a red squiggly line on `params` due to a quirk of the sorbet type system.
  #
  # this file will still infact, run correctly as uncommented.

  # message = anthropic.messages.create(params)
  # pp(message.content.first)
end

begin
  pp("----- using params class correctly in sorbet -----")

  params = Anthropic::Models::MessageCreateParams.new(
    max_tokens: 1024,
    messages: [Anthropic::Models::MessageParam.new(role: :user, content: "hello")],
    model: :"claude-3-7-sonnet-latest"
  )

  # notice the `**` operator, it allows you to pass a parameter's class
  #   into compatible methods that have named arguments
  message = anthropic.messages.create(**params)

  pp(message.content.first)
end
