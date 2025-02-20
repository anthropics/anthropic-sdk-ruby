# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Messages::BatchesTest < Minitest::Test
  def before_all
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end

  def test_create_required_params
    response = @anthropic.messages.batches.create(
      requests: [
        {
          custom_id: "my-custom-id-1",
          params: {
            max_tokens: 1024,
            messages: [{content: "Hello, world", role: :user}],
            model: :"claude-3-5-haiku-latest"
          }
        }
      ]
    )

    assert_pattern do
      response => Anthropic::Models::Messages::MessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Models::Messages::MessageBatch::ProcessingStatus,
        request_counts: Anthropic::Models::Messages::MessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_retrieve
    response = @anthropic.messages.batches.retrieve("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Messages::MessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Models::Messages::MessageBatch::ProcessingStatus,
        request_counts: Anthropic::Models::Messages::MessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_list
    response = @anthropic.messages.batches.list

    assert_pattern do
      response => Anthropic::Page
    end

    page = response.next_page
    assert_pattern do
      page => Anthropic::Page
    end

    row = response.to_enum.first
    assert_pattern do
      row => Anthropic::Models::Messages::MessageBatch
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Models::Messages::MessageBatch::ProcessingStatus,
        request_counts: Anthropic::Models::Messages::MessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_delete
    response = @anthropic.messages.batches.delete("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Messages::DeletedMessageBatch
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
      response => Anthropic::Models::Messages::MessageBatch
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        cancel_initiated_at: Time | nil,
        created_at: Time,
        ended_at: Time | nil,
        expires_at: Time,
        processing_status: Anthropic::Models::Messages::MessageBatch::ProcessingStatus,
        request_counts: Anthropic::Models::Messages::MessageBatchRequestCounts,
        results_url: String | nil,
        type: Symbol
      }
    end
  end

  def test_results
    skip("Prism doesn't support JSONL responses yet")

    response = @anthropic.messages.batches.results("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Messages::MessageBatchIndividualResponse
    end

    assert_pattern do
      response => {
        custom_id: String,
        result: Anthropic::Models::Messages::MessageBatchResult
      }
    end
  end
end
