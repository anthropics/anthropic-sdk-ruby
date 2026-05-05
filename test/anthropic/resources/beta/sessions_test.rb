# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::SessionsTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.sessions.create(
        agent: "agent_011CZkYpogX7uDKUyvBTophP",
        environment_id: "env_011CZkZ9X2dpNyB7HsEFoRfW"
      )

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsSession
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsSessionAgent,
        archived_at: Time | nil,
        created_at: Time,
        environment_id: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        outcome_evaluations: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource]),
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource]),
        stats: Anthropic::Beta::BetaManagedAgentsSessionStats,
        status: Anthropic::Beta::BetaManagedAgentsSession::Status,
        title: String | nil,
        type: Anthropic::Beta::BetaManagedAgentsSession::Type,
        updated_at: Time,
        usage: Anthropic::Beta::BetaManagedAgentsSessionUsage,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.sessions.retrieve("sesn_011CZkZAtmR3yMPDzynEDxu7")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsSession
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsSessionAgent,
        archived_at: Time | nil,
        created_at: Time,
        environment_id: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        outcome_evaluations: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource]),
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource]),
        stats: Anthropic::Beta::BetaManagedAgentsSessionStats,
        status: Anthropic::Beta::BetaManagedAgentsSession::Status,
        title: String | nil,
        type: Anthropic::Beta::BetaManagedAgentsSession::Type,
        updated_at: Time,
        usage: Anthropic::Beta::BetaManagedAgentsSessionUsage,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_update
    response = @anthropic.beta.sessions.update("sesn_011CZkZAtmR3yMPDzynEDxu7")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsSession
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsSessionAgent,
        archived_at: Time | nil,
        created_at: Time,
        environment_id: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        outcome_evaluations: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource]),
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource]),
        stats: Anthropic::Beta::BetaManagedAgentsSessionStats,
        status: Anthropic::Beta::BetaManagedAgentsSession::Status,
        title: String | nil,
        type: Anthropic::Beta::BetaManagedAgentsSession::Type,
        updated_at: Time,
        usage: Anthropic::Beta::BetaManagedAgentsSessionUsage,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.sessions.list

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::BetaManagedAgentsSession
    end

    assert_pattern do
      row => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsSessionAgent,
        archived_at: Time | nil,
        created_at: Time,
        environment_id: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        outcome_evaluations: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource]),
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource]),
        stats: Anthropic::Beta::BetaManagedAgentsSessionStats,
        status: Anthropic::Beta::BetaManagedAgentsSession::Status,
        title: String | nil,
        type: Anthropic::Beta::BetaManagedAgentsSession::Type,
        updated_at: Time,
        usage: Anthropic::Beta::BetaManagedAgentsSessionUsage,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_delete
    response = @anthropic.beta.sessions.delete("sesn_011CZkZAtmR3yMPDzynEDxu7")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsDeletedSession
    end

    assert_pattern do
      response => {
        id: String,
        type: Anthropic::Beta::BetaManagedAgentsDeletedSession::Type
      }
    end
  end

  def test_archive
    response = @anthropic.beta.sessions.archive("sesn_011CZkZAtmR3yMPDzynEDxu7")

    assert_pattern do
      response => Anthropic::Beta::BetaManagedAgentsSession
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::BetaManagedAgentsSessionAgent,
        archived_at: Time | nil,
        created_at: Time,
        environment_id: String,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        outcome_evaluations: ^(Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource]),
        resources: ^(Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource]),
        stats: Anthropic::Beta::BetaManagedAgentsSessionStats,
        status: Anthropic::Beta::BetaManagedAgentsSession::Status,
        title: String | nil,
        type: Anthropic::Beta::BetaManagedAgentsSession::Type,
        updated_at: Time,
        usage: Anthropic::Beta::BetaManagedAgentsSessionUsage,
        vault_ids: ^(Anthropic::Internal::Type::ArrayOf[String])
      }
    end
  end
end
