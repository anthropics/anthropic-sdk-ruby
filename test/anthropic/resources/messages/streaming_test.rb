# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Messages::StreamingTest < Minitest::Test
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
    stub_streaming_response
  end

  def teardown
    WebMock.reset!
    super
  end

  def stub_streaming_response
    stub_request(:post, "http://localhost/v1/messages")
      .with(
        headers: {
          "Accept" => "text/event-stream",
          "Content-Type" => "application/json"
        }
      )
      .to_return(
        status: 200,
        headers: {"Content-Type" => "text/event-stream"},
        body: sse_response
      )
  end

  def basic_params
    {
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-3-opus-20240229"
    }
  end

  def test_basic_streaming
    events = []
    final_message = nil

    stream = @client.messages.stream(**basic_params)

    stream.each do |event|
      events << event
      final_message = event.message if event.type == :message_stop
    end

    # verify event sequence
    assert_equal(
      [
        :message_start,
        :content_block_start,
        :content_block_delta,
        :text,
        :content_block_delta,
        :text,
        :content_block_delta,
        :text,
        :content_block_stop,
        :message_delta,
        :message_stop
      ],
      events.map(&:type)
    )

    assert_pattern do
      final_message => {
        id: "msg_4QpJur2dWWDjF6C758FbBw5vm12BaVipnK",
        model: :"claude-3-opus-20240229",
        role: :assistant,
        stop_reason: :end_turn,
        content: [{type: :text, text: "Hello there!"}]
      }
    end
  end

  def test_text_streaming
    stream = @client.messages.stream(**basic_params)

    assert_equal(["Hello", " there", "!"], stream.text.to_a)
  end

  def test_accumulated_message
    stream = @client.messages.stream(**basic_params)

    message = stream.accumulated_message

    assert_pattern do
      message => {
        content: [{type: :text, text: "Hello there!"}]
      }
    end
  end

  def test_accumulated_text
    stream = @client.messages.stream(**basic_params)

    assert_equal("Hello there!", stream.accumulated_text)
  end

  def sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_4QpJur2dWWDjF6C758FbBw5vm12BaVipnK","type":"message","role":"assistant","content":[],"model":"claude-3-opus-20240229","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":11,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"text","text":""}}

      event: ping
      data: {"type":"ping"}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"Hello"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":" there"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"!"}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":6}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end
end
