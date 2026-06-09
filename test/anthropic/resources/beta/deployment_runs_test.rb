# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::DeploymentRunsTest < Anthropic::Test::ResourceTest
  def test_retrieve
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.deployment_runs.retrieve("deployment_run_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeploymentRun
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        created_at: Time,
        deployment_id: String,
        error: Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error | nil,
        session_id: String | nil,
        trigger_context: Anthropic::Beta::BetaManagedAgentsTriggerContext,
        type: Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.deployment_runs.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaManagedAgentsDeploymentRun
    end

    assert_pattern do
      row => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        created_at: Time,
        deployment_id: String,
        error: Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error | nil,
        session_id: String | nil,
        trigger_context: Anthropic::Beta::BetaManagedAgentsTriggerContext,
        type: Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type
      }
    end
  end
end
