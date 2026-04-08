#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/anthropic"

MCP_SERVER_NAME = "github"
MCP_SERVER_URL = "https://api.githubcopilot.com/mcp/"

PROMPT =
  "Hi! List every tool and skill you have access to, grouped by where they " \
  "came from (built-in toolset, custom tool, MCP server, skills)."

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
client = Anthropic::Client.new

github_token = ENV.fetch("GITHUB_TOKEN") do
  raise "GITHUB_TOKEN is required (use a fine-grained PAT with public-repo read only)"
end

# Create an environment
environment = client.beta.environments.create(name: "comprehensive-example-environment")
puts "Created environment: #{environment.id}"

# Create a vault and store the MCP server credential in it
vault = client.beta.vaults.create(display_name: "comprehensive-example-vault")
puts "Created vault: #{vault.id}"

credential = client.beta.vaults.credentials.create(
  vault.id,
  display_name: "github-mcp",
  auth: {
    type: :static_bearer,
    mcp_server_url: MCP_SERVER_URL,
    token: github_token
  }
)
puts "Created credential: #{credential.id}"

# Upload a custom skill
skill_md_path = Pathname.new(__dir__) / "greeting-SKILL.md"
skill = client.beta.skills.create(
  display_title: "comprehensive-greeting-#{(Time.now.to_f * 1000).to_i}",
  files: [
    Anthropic::FilePart.new(skill_md_path, filename: "greeting/SKILL.md", content_type: "text/markdown")
  ]
)
puts "Created skill: #{skill.id}"

# Create v1 of the agent with the built-in toolset, an MCP server, and a custom tool
agent_v1 = client.beta.agents.create(
  name: "comprehensive-example-agent",
  model: "claude-sonnet-4-6",
  system_: "You are a helpful assistant.",
  mcp_servers: [{type: "url", name: MCP_SERVER_NAME, url: MCP_SERVER_URL}],
  tools: [
    {type: :agent_toolset_20260401},
    {type: :mcp_toolset, mcp_server_name: MCP_SERVER_NAME},
    {
      type: :custom,
      name: "get_weather",
      description: "Look up the current weather for a city.",
      input_schema: {
        type: "object",
        properties: {city: {type: "string"}},
        required: ["city"]
      }
    }
  ]
)
puts "Created agent v1: #{agent_v1.id}"

# Patch the agent to v2 by adding skills; each update bumps the version
agent = client.beta.agents.update(
  agent_v1.id,
  version: agent_v1.version,
  skills: [
    {type: :custom, skill_id: skill.id},
    {type: :anthropic, skill_id: "xlsx"}
  ]
)
puts "Patched agent to v2: #{agent.id}"

versions = client.beta.agents.versions.list(agent.id)
puts "Agent versions: #{versions.data}"

# Create a session pinned to v2; the vault supplies the MCP credential
session = client.beta.sessions.create(
  environment_id: environment.id,
  agent: {type: "agent", id: agent.id, version: agent.version},
  vault_ids: [vault.id]
)
puts "Created session: #{session.id}"

# Send a prompt and stream events, answering the custom tool if called
client.beta.sessions.events.send_(
  session.id,
  events: [{type: "user.message", content: [{type: "text", text: PROMPT}]}]
)

puts "Streaming events:"
stream = client.beta.sessions.events.stream_events(session.id)
stream.each do |event|
  pp event

  if event.is_a?(Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent) &&
     event.name == "get_weather"
    client.beta.sessions.events.send_(
      session.id,
      events: [
        {
          type: "user.custom_tool_result",
          custom_tool_use_id: event.id,
          content: [{type: "text", text: '{"temperature_c": 14}'}]
        }
      ]
    )
  end

  if event.is_a?(Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent) &&
     event.stop_reason.is_a?(Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn)
    break
  end
end
