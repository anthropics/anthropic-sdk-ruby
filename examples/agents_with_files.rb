#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

# Create an environment
environment = client.beta.environments.create(name: "files-example-environment")
puts "Created environment: #{environment.id}"

# Create an agent with the built-in toolset and an always-allow permission policy
agent = client.beta.agents.create(
  name: "files-example-agent",
  model: "claude-sonnet-4-6",
  tools: [
    {
      type: :agent_toolset_20260401,
      default_config: {
        enabled: true,
        permission_policy: {type: :always_allow}
      }
    }
  ]
)
puts "Created agent: #{agent.id}"

# Upload a file
file = client.beta.files.upload(file: Pathname.new(__dir__) / "data.csv")
puts "Uploaded file: #{file.id}"

# Create a session with the file mounted as a resource
session = client.beta.sessions.create(
  environment_id: environment.id,
  agent: {type: "agent", id: agent.id, version: agent.version},
  resources: [
    {
      type: :file,
      file_id: file.id,
      mount_path: "data.csv"
    }
  ]
)
puts "Created session: #{session.id}"

resources = client.beta.sessions.resources.list(session.id)
puts "Listed session resources: #{resources.data}"

# Send a prompt asking the agent to read the mounted file
client.beta.sessions.events.send_(
  session.id,
  events: [
    {
      type: "user.message",
      content: [
        {
          type: "text",
          text: "Read /uploads/data.csv and tell me the column names."
        }
      ]
    }
  ]
)

# Stream events until the session goes idle
puts "Streaming events:"
stream = client.beta.sessions.events.stream_events(session.id)
stream.each do |event|
  pp event
  break if event.is_a?(Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent)
end
