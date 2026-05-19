# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Environments::WorkTest < Anthropic::Test::ResourceTest
  def test_retrieve_required_params
    response =
      @anthropic.beta.environments.work.retrieve("work_id", environment_id: "env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::Environments::BetaSelfHostedWork
    end

    assert_pattern do
      response => {
        id: String,
        acknowledged_at: String | nil,
        created_at: String,
        data: Anthropic::Beta::Environments::BetaSessionWorkData,
        environment_id: String,
        latest_heartbeat_at: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        started_at: String | nil,
        state: Anthropic::Beta::Environments::BetaSelfHostedWork::State,
        stop_requested_at: String | nil,
        stopped_at: String | nil,
        type: Symbol
      }
    end
  end

  def test_update_required_params
    response =
      @anthropic.beta.environments.work.update(
        "work_id",
        environment_id: "env_011CZkZ9X2dpNyB7HsEFoRfW",
        metadata: {foo: "string"}
      )

    assert_pattern do
      response => Anthropic::Beta::Environments::BetaSelfHostedWork
    end

    assert_pattern do
      response => {
        id: String,
        acknowledged_at: String | nil,
        created_at: String,
        data: Anthropic::Beta::Environments::BetaSessionWorkData,
        environment_id: String,
        latest_heartbeat_at: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        started_at: String | nil,
        state: Anthropic::Beta::Environments::BetaSelfHostedWork::State,
        stop_requested_at: String | nil,
        stopped_at: String | nil,
        type: Symbol
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.environments.work.list("env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Environments::BetaSelfHostedWork
    end

    assert_pattern do
      row => {
        id: String,
        acknowledged_at: String | nil,
        created_at: String,
        data: Anthropic::Beta::Environments::BetaSessionWorkData,
        environment_id: String,
        latest_heartbeat_at: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        started_at: String | nil,
        state: Anthropic::Beta::Environments::BetaSelfHostedWork::State,
        stop_requested_at: String | nil,
        stopped_at: String | nil,
        type: Symbol
      }
    end
  end

  def test_ack_required_params
    response =
      @anthropic.beta.environments.work.ack("work_id", environment_id: "env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::Environments::BetaSelfHostedWork
    end

    assert_pattern do
      response => {
        id: String,
        acknowledged_at: String | nil,
        created_at: String,
        data: Anthropic::Beta::Environments::BetaSessionWorkData,
        environment_id: String,
        latest_heartbeat_at: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        started_at: String | nil,
        state: Anthropic::Beta::Environments::BetaSelfHostedWork::State,
        stop_requested_at: String | nil,
        stopped_at: String | nil,
        type: Symbol
      }
    end
  end

  def test_heartbeat_required_params
    response =
      @anthropic.beta.environments.work.heartbeat("work_id", environment_id: "env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse
    end

    assert_pattern do
      response => {
        last_heartbeat: String,
        lease_extended: Anthropic::Internal::Type::Boolean,
        state: Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State,
        ttl_seconds: Integer,
        type: Symbol
      }
    end
  end

  def test_poll
    response = @anthropic.beta.environments.work.poll("env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::Environments::BetaSelfHostedWork
    end

    assert_pattern do
      response => {
        id: String,
        acknowledged_at: String | nil,
        created_at: String,
        data: Anthropic::Beta::Environments::BetaSessionWorkData,
        environment_id: String,
        latest_heartbeat_at: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        started_at: String | nil,
        state: Anthropic::Beta::Environments::BetaSelfHostedWork::State,
        stop_requested_at: String | nil,
        stopped_at: String | nil,
        type: Symbol
      }
    end
  end

  def test_stats
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.environments.work.stats("env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::Environments::BetaSelfHostedWorkQueueStats
    end

    assert_pattern do
      response => {
        depth: Integer,
        oldest_queued_at: String | nil,
        pending: Integer,
        type: Symbol,
        workers_polling: Integer | nil
      }
    end
  end

  def test_stop_required_params
    response =
      @anthropic.beta.environments.work.stop("work_id", environment_id: "env_011CZkZ9X2dpNyB7HsEFoRfW")

    assert_pattern do
      response => Anthropic::Beta::Environments::BetaSelfHostedWork
    end

    assert_pattern do
      response => {
        id: String,
        acknowledged_at: String | nil,
        created_at: String,
        data: Anthropic::Beta::Environments::BetaSessionWorkData,
        environment_id: String,
        latest_heartbeat_at: String | nil,
        metadata: ^(Anthropic::Internal::Type::HashOf[String]),
        started_at: String | nil,
        state: Anthropic::Beta::Environments::BetaSelfHostedWork::State,
        stop_requested_at: String | nil,
        stopped_at: String | nil,
        type: Symbol
      }
    end
  end
end
