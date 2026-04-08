# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::AgentsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.agents.create(model: :"claude-sonnet-4-6", name: "My First Agent")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsAgent
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        mcp_servers: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        model: Anthropic::Beta::BetaManagedAgentsModelConfig,
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

  def test_retrieve
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.agents.retrieve("agent_011CZkYpogX7uDKUyvBTophP")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsAgent
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        mcp_servers: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        model: Anthropic::Beta::BetaManagedAgentsModelConfig,
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

  def test_update_required_params
    response = @anthropic.beta.agents.update("agent_011CZkYpogX7uDKUyvBTophP", version: 1)

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsAgent
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        mcp_servers: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        model: Anthropic::Beta::BetaManagedAgentsModelConfig,
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

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.agents.list

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

  def test_archive
    response = @anthropic.beta.agents.archive("agent_011CZkYpogX7uDKUyvBTophP")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsAgent
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        mcp_servers: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        model: Anthropic::Beta::BetaManagedAgentsModelConfig,
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
