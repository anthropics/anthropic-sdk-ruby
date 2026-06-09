# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::DeploymentsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.deployments.create(
        agent: "string",
        environment_id: "x",
        initial_events: [{content: [{text: "Where is my order #1234?", type: :text}], type: :"user.message"}],
        name: "x"
      )

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeployment
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        environment_id: String,
        initial_events: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        paused_reason: Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason | nil,
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionResourceConfig]),
        schedule: Anthropic::Beta::BetaManagedAgentsSchedule | nil,
        status: Anthropic::Beta::BetaManagedAgentsDeploymentStatus,
        type: Anthropic::Beta::BetaManagedAgentsDeployment::Type,
        updated_at: Time,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_retrieve
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.deployments.retrieve("deployment_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeployment
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        environment_id: String,
        initial_events: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        paused_reason: Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason | nil,
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionResourceConfig]),
        schedule: Anthropic::Beta::BetaManagedAgentsSchedule | nil,
        status: Anthropic::Beta::BetaManagedAgentsDeploymentStatus,
        type: Anthropic::Beta::BetaManagedAgentsDeployment::Type,
        updated_at: Time,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_update
    response = @anthropic.beta.deployments.update("deployment_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeployment
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        environment_id: String,
        initial_events: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        paused_reason: Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason | nil,
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionResourceConfig]),
        schedule: Anthropic::Beta::BetaManagedAgentsSchedule | nil,
        status: Anthropic::Beta::BetaManagedAgentsDeploymentStatus,
        type: Anthropic::Beta::BetaManagedAgentsDeployment::Type,
        updated_at: Time,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.deployments.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaManagedAgentsDeployment
    end

    assert_pattern do
      row => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        environment_id: String,
        initial_events: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        paused_reason: Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason | nil,
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionResourceConfig]),
        schedule: Anthropic::Beta::BetaManagedAgentsSchedule | nil,
        status: Anthropic::Beta::BetaManagedAgentsDeploymentStatus,
        type: Anthropic::Beta::BetaManagedAgentsDeployment::Type,
        updated_at: Time,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_archive
    response = @anthropic.beta.deployments.archive("deployment_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeployment
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        environment_id: String,
        initial_events: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        paused_reason: Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason | nil,
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionResourceConfig]),
        schedule: Anthropic::Beta::BetaManagedAgentsSchedule | nil,
        status: Anthropic::Beta::BetaManagedAgentsDeploymentStatus,
        type: Anthropic::Beta::BetaManagedAgentsDeployment::Type,
        updated_at: Time,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_pause
    response = @anthropic.beta.deployments.pause("deployment_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeployment
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        environment_id: String,
        initial_events: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        paused_reason: Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason | nil,
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionResourceConfig]),
        schedule: Anthropic::Beta::BetaManagedAgentsSchedule | nil,
        status: Anthropic::Beta::BetaManagedAgentsDeploymentStatus,
        type: Anthropic::Beta::BetaManagedAgentsDeployment::Type,
        updated_at: Time,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_run
    response = @anthropic.beta.deployments.run("deployment_id")

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

  def test_unpause
    response = @anthropic.beta.deployments.unpause("deployment_id")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeployment
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
        archived_at: Time | nil,
        created_at: Time,
        description: String | nil,
        environment_id: String,
        initial_events: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent]),
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        name: String,
        paused_reason: Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason | nil,
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsSessionResourceConfig]),
        schedule: Anthropic::Beta::BetaManagedAgentsSchedule | nil,
        status: Anthropic::Beta::BetaManagedAgentsDeploymentStatus,
        type: Anthropic::Beta::BetaManagedAgentsDeployment::Type,
        updated_at: Time,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end
end
