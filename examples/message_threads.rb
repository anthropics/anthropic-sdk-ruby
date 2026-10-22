#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

# A message thread keeps the conversation on the server, so each turn sends only the
# messages that are new.
thread = anthropic.beta.messages.thread(
  max_tokens: 1024,
  model: :"claude-sonnet-5",
  system_: "You are a concise travel guide."
)

reply = thread.send_message({role: :user, content: "Name one thing to see in Lisbon."})
pp(reply.content)

# The second turn sends this message alone; the thread continues from the first reply.
stream = thread.stream({role: :user, content: "And how do I get there from the airport?"})
stream.text.each { print(_1) }
puts

# The thread holds the whole conversation locally as well.
pp(thread.previous_message_id)
pp(thread.messages.length)

# A fork starts a separate conversation from the same history.
fork = thread.fork
pp(fork.send_message({role: :user, content: "Suggest a day trip instead."}).content)
