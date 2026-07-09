#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

# Create an environment
environment = client.beta.environments.create(name: "streaming-deltas-example")
puts "Created environment: #{environment.id}"

# Create an agent
agent = client.beta.agents.create(name: "streaming-deltas-example", model: "claude-sonnet-5")
puts "Created agent: #{agent.id}"

# Create a session
session = client.beta.sessions.create(
  environment_id: environment.id,
  agent: {type: "agent", id: agent.id}
)
puts "Created session: #{session.id}"

# Subscribe to the event stream with `agent.message` deltas enabled
stream = client.beta.sessions.events.stream_events(session.id, event_deltas: [:"agent.message"])

# Send a user message
client.beta.sessions.events.send_(
  session.id,
  events: [{type: "user.message", content: [{type: "text", text: "Write a short haiku about the ocean."}]}]
)

# Fold delta previews into `agent.message` snapshots as they stream in
accumulator = Anthropic::Helpers::Sessions::EventAccumulator.new

puts "\nStreaming:"
accumulator.wrap(stream).each do |event|
  case event
  when Anthropic::Models::Beta::BetaManagedAgentsDeltaEvent
    print("\r#{accumulator.agent_message_text(event.event_id)}")
  when Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent
    puts
    puts("[final] #{accumulator.agent_message_text(event.id)}")
  when Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent
    break if event.stop_reason.is_a?(Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn)
  when Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent
    puts("[error] #{event.error.type}: #{event.error.message}")
  end
end
