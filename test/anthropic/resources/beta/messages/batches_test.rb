# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Messages::BatchesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response = @anthropic.beta.messages.batches.create(
      requests: [
        {
          custom_id: "my-custom-id-1",
          params: {
            max_tokens: 1024,
            messages: [{content: "Hello, world", role: :user}],
            model: :"claude-3-7-sonnet-latest"
          }
        }
      ]
    )

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaMessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Models::Beta::Messages::BetaMessageBatch::ProcessingStatus,
        request_counts: Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.messages.batches.retrieve("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaMessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Models::Beta::Messages::BetaMessageBatch::ProcessingStatus,
        request_counts: Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.beta.messages.batches.list

    assert_pattern do
      response => Anthropic::Page
    end

    row = response.to_enum.first
    assert_pattern do
      row => Anthropic::Models::Beta::Messages::BetaMessageBatch
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Models::Beta::Messages::BetaMessageBatch::ProcessingStatus,
        request_counts: Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_delete
    response = @anthropic.beta.messages.batches.delete("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_cancel
    response = @anthropic.beta.messages.batches.cancel("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaMessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Models::Beta::Messages::BetaMessageBatch::ProcessingStatus,
        request_counts: Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_results
    skip("Prism doesn't support JSONL responses yet")

    response = @anthropic.beta.messages.batches.results("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse
    end

    assert_pattern do
      response => {
        custom_id: String,
        result: Anthropic::Models::Beta::Messages::BetaMessageBatchResult
      }
    end
  end
end
