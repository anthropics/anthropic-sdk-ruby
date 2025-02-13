# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Messages::BatchesTest < Minitest::Test
  def before_all
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end

  def test_create_required_params
    response = @anthropic.beta.messages.batches.create(
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
      response => Anthropic::Models::Beta::Messages::BetaMessageBatch
    end
  end

  def test_retrieve
    response = @anthropic.beta.messages.batches.retrieve("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaMessageBatch
    end
  end

  def test_list
    response = @anthropic.beta.messages.batches.list

    assert_pattern do
      response => Anthropic::Page
    end

    page = response.next_page
    assert_pattern do
      page => Anthropic::Page
    end

    row = response.to_enum.first
    assert_pattern do
      row => Anthropic::Models::Beta::Messages::BetaMessageBatch
    end
  end

  def test_delete
    response = @anthropic.beta.messages.batches.delete("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch
    end
  end

  def test_cancel
    response = @anthropic.beta.messages.batches.cancel("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaMessageBatch
    end
  end

  def test_results
    skip("Prism doesn't support JSONL responses yet")

    response = @anthropic.beta.messages.batches.results("message_batch_id")

    assert_pattern do
      response => Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse
    end
  end
end
