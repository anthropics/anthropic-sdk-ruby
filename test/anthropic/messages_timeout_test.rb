# frozen_string_literal: true

require_relative "test_helper"

class Anthropic::Test::MessagesTimeoutTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  PARAMS = {
    max_tokens: 1024,
    messages: [{content: "Hello, world", role: :user}],
    model: Anthropic::Model::CLAUDE_OPUS_5
  }.freeze

  SSE = "event: message_stop\ndata: {\"type\":\"message_stop\"}\n\n"

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 200, body: {})
    stub_request(:post, "http://localhost/v1/messages?beta=true").to_return_json(status: 200, body: {})
  end

  def teardown
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def stub_streams
    [nil, "?beta=true"].each do |query|
      stub_request(:post, "http://localhost/v1/messages#{query}")
        .to_return(status: 200, headers: {"content-type" => "text/event-stream"}, body: SSE)
    end
  end

  def sent_timeouts
    WebMock::RequestRegistry.instance.requested_signatures.hash.keys.map do
      Float(_1.headers.fetch("X-Stainless-Timeout"))
    end
  end

  def test_client_timeout_applies_to_create_and_streams
    client = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key", timeout: 30)

    client.messages.create(**PARAMS)
    client.beta.messages.create(**PARAMS)
    assert_equal([30.0, 30.0], sent_timeouts)

    WebMock.reset!
    stub_streams
    client.messages.stream_raw(**PARAMS).to_a
    client.beta.messages.stream_raw(**PARAMS).to_a
    client.messages.stream(**PARAMS).close
    client.beta.messages.stream(**PARAMS).close
    assert_equal([30.0], sent_timeouts.uniq)
    assert_requested(:post, %r{http://localhost/v1/messages}, times: 4)
  end

  def test_request_timeout_wins_over_the_client_timeout
    client = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key", timeout: 30)

    client.messages.create(**PARAMS, request_options: {timeout: 5})
    client.beta.messages.create(**PARAMS, request_options: {timeout: 5})

    assert_equal([5.0], sent_timeouts.uniq)
  end

  def test_default_client_still_requires_streaming_for_long_requests
    client = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(ArgumentError) { client.messages.create(**PARAMS, max_tokens: 128_000) }
    assert_raises(ArgumentError) { client.beta.messages.create(**PARAMS, max_tokens: 128_000) }
    assert_not_requested(:post, %r{http://localhost/v1/messages})

    client.messages.create(**PARAMS)
    client.beta.messages.create(**PARAMS)
    assert_equal([600.0, 600.0], sent_timeouts)
  end

  def test_client_timeout_equal_to_the_default_still_counts_as_set
    client = Anthropic::Client.new(
      base_url: "http://localhost",
      api_key: "my-anthropic-api-key",
      timeout: 600
    )

    client.messages.create(**PARAMS, max_tokens: 128_000)
    client.beta.messages.create(**PARAMS, max_tokens: 128_000)

    assert_equal([600.0, 600.0], sent_timeouts)
  end
end
