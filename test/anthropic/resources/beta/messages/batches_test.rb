# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Messages::BatchesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    skip("prism validates based on the non-beta endpoint")

    response =
      @anthropic.beta.messages.batches.create(
        requests: [
          {
            custom_id: "my-custom-id-1",
            params: {
              max_tokens: 1024,
              messages: [{content: "Hello, world", role: :user}],
              model: :"claude-opus-4-6"
            }
          }
        ]
      )

    assert_pattern do
      response => Anthropic::Beta::Messages::BetaMessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Beta::Messages::BetaMessageBatch::ProcessingStatus,
        request_counts: Anthropic::Beta::Messages::BetaMessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_retrieve
    response = @anthropic.beta.messages.batches.retrieve("message_batch_id")

    assert_pattern do
      response => Anthropic::Beta::Messages::BetaMessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Beta::Messages::BetaMessageBatch::ProcessingStatus,
        request_counts: Anthropic::Beta::Messages::BetaMessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.beta.messages.batches.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Messages::BetaMessageBatch
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Beta::Messages::BetaMessageBatch::ProcessingStatus,
        request_counts: Anthropic::Beta::Messages::BetaMessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_delete
    response = @anthropic.beta.messages.batches.delete("message_batch_id")

    assert_pattern do
      response => Anthropic::Beta::Messages::BetaDeletedMessageBatch
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
      response => Anthropic::Beta::Messages::BetaMessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Beta::Messages::BetaMessageBatch::ProcessingStatus,
        request_counts: Anthropic::Beta::Messages::BetaMessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end
end
