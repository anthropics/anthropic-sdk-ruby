#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: ignore

# Example: use Anthropic::Mcp to bridge GitHub's hosted MCP server with the
# Anthropic SDK's beta tool runner.
#
# This connects to `https://api.githubcopilot.com/mcp/` over MCP's Streamable
# HTTP transport using the official `mcp` gem (>= 0.13), lists the available
# tools, and lets Claude invoke them to answer a question about GitHub issues.
#
# Requirements:
#   - GITHUB_TOKEN env var (a GitHub PAT with at least `public_repo` scope)
#   - ANTHROPIC_API_KEY env var
#   - The following gems installed:
#         gem install mcp faraday event_stream_parser

require_relative "../lib/anthropic"

# The Anthropic helpers themselves only require `mcp`. The two below are
# transport-level dependencies of the `mcp` gem itself, not of this SDK:
#   - `faraday`             — used by `MCP::Client::HTTP` for any remote server.
#   - `event_stream_parser` — used by `MCP::Client::HTTP` when the server
#                             returns SSE responses, which the GitHub MCP
#                             server does. Stdio servers don't need it.
# We require them explicitly so missing-gem errors surface here at the top of
# the script instead of mid-request.
require "faraday"
require "event_stream_parser"
require "mcp"

github_token = ENV.fetch("GITHUB_TOKEN") do
  warn("GITHUB_TOKEN env var is required.")
  exit(1)
end

# --- Connect to GitHub's hosted MCP server ---

transport = MCP::Client::HTTP.new(
  url: "https://api.githubcopilot.com/mcp/",
  headers: {"Authorization" => "Bearer #{github_token}"}
)
mcp_client = MCP::Client.new(transport: transport)
mcp_client.connect

mcp_tools = mcp_client.tools
printf("Fetched %d tools from GitHub MCP server.\n\n", mcp_tools.size)

# --- Wire tools into the Anthropic beta tool runner ---

anthropic = Anthropic::Client.new

question = "List the 5 most recently opened issues in the github/github-mcp-server " \
           "repository. For each, include the issue number, title, and who opened it."
printf("[user]: %s\n\n", question)

runner = anthropic.beta.messages.tool_runner(
  max_tokens: 4096,
  messages: [{role: "user", content: question}],
  model: "claude-opus-4-7",
  tools: Anthropic::Mcp.tools(mcp_tools, mcp_client),
  max_iterations: 10
)

runner.each_message do |message|
  message.content.each do |block|
    case block
    in Anthropic::Beta::BetaTextBlock if block.text != ""
      puts(block.text)
    in Anthropic::Beta::BetaToolUseBlock
      printf("  [tool call: %s]\n", block.name)
    else
    end
  end
end
