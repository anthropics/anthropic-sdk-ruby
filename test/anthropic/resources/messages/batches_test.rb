# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Messages::BatchesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.messages.batches.create(
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
      response => Anthropic::Messages::MessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Messages::MessageBatch::ProcessingStatus,
        request_counts: Anthropic::Messages::MessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_retrieve
    response = @anthropic.messages.batches.retrieve("message_batch_id")

    assert_pattern do
      response => Anthropic::Messages::MessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Messages::MessageBatch::ProcessingStatus,
        request_counts: Anthropic::Messages::MessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.messages.batches.list

    assert_pattern do
      response => Anthropic::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Messages::MessageBatch
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Messages::MessageBatch::ProcessingStatus,
        request_counts: Anthropic::Messages::MessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_delete
    response = @anthropic.messages.batches.delete("message_batch_id")

    assert_pattern do
      response => Anthropic::Messages::DeletedMessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        type: Symbol
      }
    end
  end

  def test_cancel
    response = @anthropic.messages.batches.cancel("message_batch_id")

    assert_pattern do
      response => Anthropic::Messages::MessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Messages::MessageBatch::ProcessingStatus,
        request_counts: Anthropic::Messages::MessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end
end
