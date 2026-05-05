# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Agents::VersionsTest < Anthropic::Test::ResourceTest
  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.agents.versions.list("agent_011CZkYpogX7uDKUyvBTophP")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaManagedAgentsAgent
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        mcp_servers: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        model: Anthropic::Beta::BetaManagedAgentsModelConfig,
        multiagent: Anthropic::Beta::BetaManagedAgentsMultiagent | nil,
        name: String,
        skills: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsAgent::Skill]),
        system_: String | nil,
        tools: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsAgent::Tool]),
        type: Anthropic::Beta::BetaManagedAgentsAgent::Type,
        updated_at: Time,
        version: Integer
      }
    end
  end
end
