# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Messages::ResponseHeadersTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
  end

  def setup
    super
    @client = Anthropic::Client.new(base_url: "http://localhost", api_key: "test-key")
  end

  def teardown
    WebMock.reset!
    super
  end

  def test_non_streaming_response_headers
    stub_request(:post, "http://localhost/v1/messages")
      .with(
        headers: {
          "Content-Type" => "application/json"
        }
      )
      .to_return(
        status: 200,
        headers: {
          "Content-Type" => "application/json",
          "anthropic-ratelimit-requests-limit" => "5",
          "anthropic-ratelimit-requests-remaining" => "4",
          "anthropic-ratelimit-tokens-limit" => "24000",
          "anthropic-ratelimit-tokens-remaining" => "24000",
          "anthropic-ratelimit-input-tokens-remaining" => "20000",
          "anthropic-ratelimit-output-tokens-remaining" => "4000",
          "request-id" => "req_abc123"
        },
        body: {
          id: "msg_123",
          type: "message",
          role: "assistant",
          content: [
            {type: "text", text: "Hello!"}
          ],
          model: "claude-opus-4-6",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 5, cache_creation_input_tokens: 0, cache_read_input_tokens: 0}
        }.to_json
      )

    response = @client.messages.create(
      max_tokens: 1024,
      messages: [{role: "user", content: "Hello"}],
      model: "claude-opus-4-6"
    )

    assert_instance_of(Anthropic::Message, response)
    assert_equal("msg_123", response.id)

    # Verify HTTP status is accessible
    assert_equal(200, response._status)

    # Verify HTTP headers are accessible
    refute_nil(response._headers)
    assert_equal("5", response._headers["anthropic-ratelimit-requests-limit"])
    assert_equal("4", response._headers["anthropic-ratelimit-requests-remaining"])
    assert_equal("24000", response._headers["anthropic-ratelimit-tokens-limit"])
    assert_equal("24000", response._headers["anthropic-ratelimit-tokens-remaining"])
    assert_equal("20000", response._headers["anthropic-ratelimit-input-tokens-remaining"])
    assert_equal("4000", response._headers["anthropic-ratelimit-output-tokens-remaining"])
    assert_equal("req_abc123", response._headers["request-id"])
  end

  def test_non_streaming_response_status
    stub_request(:post, "http://localhost/v1/messages")
      .to_return(
        status: 200,
        headers: {"Content-Type" => "application/json"},
        body: {
          id: "msg_456",
          type: "message",
          role: "assistant",
          content: [{type: "text", text: "Hi!"}],
          model: "claude-opus-4-6",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 5, output_tokens: 3, cache_creation_input_tokens: 0, cache_read_input_tokens: 0}
        }.to_json
      )

    response = @client.messages.create(
      max_tokens: 1024,
      messages: [{role: "user", content: "Hi"}],
      model: "claude-opus-4-6"
    )

    assert_equal(200, response._status)
  end
end
