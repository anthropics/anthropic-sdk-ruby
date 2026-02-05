# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Messages::StreamingTest < Minitest::Test
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

  def stub_streaming_response(response_body)
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .with(
        headers: {
          "Accept" => "text/event-stream",
          "Content-Type" => "application/json"
        }
      )
      .to_return(
        status: 200,
        headers: {"Content-Type" => "text/event-stream"},
        body: response_body
      )
  end

  def compaction_params
    {
      max_tokens: 1024,
      messages: [{content: "Hello", role: :user}],
      model: :"claude-sonnet-4-20250514"
    }
  end

  def test_compaction_streaming
    stub_streaming_response(compaction_sse_response)

    compaction_events = []
    stream = @client.beta.messages.stream(**compaction_params)

    stream.each do |event|
      compaction_events << event if event.type == :compaction
    end

    assert_equal(1, compaction_events.length)
    assert_equal("Summary of the conversation so far.", compaction_events.first.content)
  end

  def test_compaction_accumulated_message
    stub_streaming_response(compaction_sse_response)

    stream = @client.beta.messages.stream(**compaction_params)
    message = stream.accumulated_message

    assert_equal(1, message.content.length)
    content_block = message.content[0]
    assert_equal(:compaction, content_block.type)
    assert_equal("Summary of the conversation so far.", content_block.content)
  end

  def compaction_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_compaction","type":"message","role":"assistant","content":[],"model":"claude-sonnet-4-20250514","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"compaction","content":null}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"compaction_delta","content":"Summary of the conversation so far."}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":15}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end
end
