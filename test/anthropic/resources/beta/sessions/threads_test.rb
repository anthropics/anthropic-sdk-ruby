# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Sessions::ThreadsTest < Anthropic::Test::ResourceTest
  def test_retrieve_required_params
    response =
      @anthropic.beta.sessions.threads.retrieve(
        "sthr_011CZkZVWa6oIjw0rgXZpnBt",
        session_id: "sesn_011CZkZAtmR3yMPDzynEDxu7"
      )

    assert_pattern do
      response => Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadAgent,
        archived_at: Time | nil,
        created_at: Time,
        parent_thread_id: String | nil,
        session_id: String,
        stats: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats | nil,
        status: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus,
        type: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type,
        updated_at: Time,
        usage: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage | nil
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.sessions.threads.list("sesn_011CZkZAtmR3yMPDzynEDxu7")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread
    end

    assert_pattern do
      row => {
        id: String,
        agent: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadAgent,
        archived_at: Time | nil,
        created_at: Time,
        parent_thread_id: String | nil,
        session_id: String,
        stats: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats | nil,
        status: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus,
        type: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type,
        updated_at: Time,
        usage: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage | nil
      }
    end
  end

  def test_archive_required_params
    response =
      @anthropic.beta.sessions.threads.archive(
        "sthr_011CZkZVWa6oIjw0rgXZpnBt",
        session_id: "sesn_011CZkZAtmR3yMPDzynEDxu7"
      )

    assert_pattern do
      response => Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread
    end

    assert_pattern do
      response => {
        id: String,
        agent: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadAgent,
        archived_at: Time | nil,
        created_at: Time,
        parent_thread_id: String | nil,
        session_id: String,
        stats: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats | nil,
        status: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus,
        type: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type,
        updated_at: Time,
        usage: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage | nil
      }
    end
  end
end
