#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

# Create an environment
environment = client.beta.environments.create(name: "simple-example-environment")
puts "Created environment: #{environment.id}"

# Create an agent
agent = client.beta.agents.create(name: "simple-example-agent", model: "claude-sonnet-4-6")
puts "Created agent: #{agent.id}"

# Create a session pinned to the agent version
session = client.beta.sessions.create(
  environment_id: environment.id,
  agent: {type: "agent", id: agent.id, version: agent.version}
)
puts "Created session: #{session.id}"

# Send a user message
client.beta.sessions.events.send_(
  session.id,
  events: [{type: "user.message", content: [{type: "text", text: "Hello Claude!"}]}]
)

# Stream events until the session goes idle
puts "Streaming events:"
stream = client.beta.sessions.events.stream_events(session.id)
stream.each do |event|
  pp event
  break if event.is_a?(Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent)
end
