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
  end

  def teardown
    WebMock.reset!
    super
  end

  def stub_streaming_response(response_body)
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
        body: response_body
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
    stub_streaming_response(basic_sse_response)

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
    stub_streaming_response(basic_sse_response)

    stream = @client.messages.stream(**basic_params)

    assert_equal(["Hello", " there", "!"], stream.text.to_a)
  end

  def test_accumulated_message
    stub_streaming_response(basic_sse_response)

    stream = @client.messages.stream(**basic_params)

    message = stream.accumulated_message

    assert_pattern do
      message => {
        content: [{type: :text, text: "Hello there!"}]
      }
    end
  end

  def test_accumulated_text
    stub_streaming_response(basic_sse_response)

    stream = @client.messages.stream(**basic_params)

    assert_equal("Hello there!", stream.accumulated_text)
  end

  def thinking_params
    {
      max_tokens: 1024,
      thinking: {type: :enabled, budget_tokens: 512},
      messages: [{content: "Create a short haiku", role: :user}],
      model: :"claude-3-opus-20240229"
    }
  end

  def test_thinking_streaming
    stub_streaming_response(thinking_sse_response)

    thinking_events = []
    stream = @client.messages.stream(**thinking_params)

    stream.each do |event|
      thinking_events << event if event.type == :thinking
    end

    assert_equal(["Space", " vast", " and", " dark"], thinking_events.map(&:thinking))
    assert_equal("Space vast and dark", thinking_events.last.snapshot)
  end

  def tools_params
    {
      max_tokens: 1024,
      messages: [{content: "What is the weather in SF?", role: :user}],
      model: :"claude-3-opus-20240229",
      tools: [
        {
          name: "get_weather",
          description: "Get weather for a location",
          input_schema: {
            type: "object",
            properties: {
              location: {type: "string"}
            },
            required: ["location"]
          }
        }
      ]
    }
  end

  def test_tools_streaming
    stub_streaming_response(tools_sse_response)

    json_events = []
    stream = @client.messages.stream(**tools_params)

    stream.each do |event|
      json_events << event if event.type == :input_json
    end

    assert_equal(["{\"location\":", "\"San Francisco\"", "\"", "}"], json_events.map(&:partial_json))
    # snapshot should be the accumulated input string, not parsed JSON
    assert_equal("{\"location\":\"San Francisco\"\"}", json_events.last.snapshot)
  end

  def citations_params
    {
      max_tokens: 1024,
      messages: [
        {
          content: [
            {
              type: "document",
              source: {
                type: "text",
                media_type: "text/plain",
                data: "The sky is blue due to Rayleigh scattering."
              },
              title: "Sky Color",
              citations: {enabled: true}
            },
            {type: "text", text: "Why is the sky blue?"}
          ],
          role: :user
        }
      ],
      model: :"claude-3-opus-20240229"
    }
  end

  def test_citations_streaming
    stub_streaming_response(citations_sse_response)

    citation_events = []
    stream = @client.messages.stream(**citations_params)

    stream.each do |event|
      citation_events << event if event.type == :citation
    end

    assert_equal(1, citation_events.length)
    citation = citation_events.first.citation
    assert_equal("Sky Color", citation.document_title)
    assert_equal(0, citation.start_char_index)
    assert_equal(42, citation.end_char_index)
  end

  def test_stream_response_headers
    stub_request(:post, "http://localhost/v1/messages")
      .with(
        headers: {
          "Accept" => "text/event-stream",
          "Content-Type" => "application/json"
        }
      )
      .to_return(
        status: 200,
        headers: {
          "Content-Type" => "text/event-stream",
          "anthropic-ratelimit-requests-remaining" => "48",
          "anthropic-ratelimit-tokens-remaining" => "48000",
          "anthropic-ratelimit-input-tokens-remaining" => "39000",
          "anthropic-ratelimit-output-tokens-remaining" => "9000",
          "request-id" => "req_stream456"
        },
        body: basic_sse_response
      )

    stream = @client.messages.stream(**basic_params)

    # Test that headers are accessible immediately (before consuming stream):
    refute_nil(stream.headers)
    assert_equal("48", stream.headers["anthropic-ratelimit-requests-remaining"])
    assert_equal("48000", stream.headers["anthropic-ratelimit-tokens-remaining"])
    assert_equal("39000", stream.headers["anthropic-ratelimit-input-tokens-remaining"])
    assert_equal("9000", stream.headers["anthropic-ratelimit-output-tokens-remaining"])
    assert_equal("req_stream456", stream.headers["request-id"])

    # Verify headers remain accessible after consuming the stream:
    stream.until_done
    assert_equal("48", stream.headers["anthropic-ratelimit-requests-remaining"])
    assert_equal("48000", stream.headers["anthropic-ratelimit-tokens-remaining"])
    assert_equal("39000", stream.headers["anthropic-ratelimit-input-tokens-remaining"])
    assert_equal("9000", stream.headers["anthropic-ratelimit-output-tokens-remaining"])
    assert_equal("req_stream456", stream.headers["request-id"])
  end

  def test_stream_response_status
    stub_streaming_response(basic_sse_response)

    stream = @client.messages.stream(**basic_params)

    assert_equal(200, stream.status)

    stream.until_done
    assert_equal(200, stream.status)
  end

  def basic_sse_response
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

  def thinking_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_thinking","type":"message","role":"assistant","content":[],"model":"claude-3-opus-20240229","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"thinking","thinking":""}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"thinking_delta","thinking":"Space"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"thinking_delta","thinking":" vast"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"thinking_delta","thinking":" and"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"thinking_delta","thinking":" dark"}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: content_block_start
      data: {"type":"content_block_start","index":1,"content_block":{"type":"text","text":""}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":1,"delta":{"type":"text_delta","text":"Haiku created"}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":1}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def tools_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_tools","type":"message","role":"assistant","content":[],"model":"claude-3-opus-20240229","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":15,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"tool_use","id":"tool_use_1","name":"get_weather","input":{}}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"{\\"location\\":", "snapshot": null}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"\\"San Francisco\\"", "snapshot": "{\\"location\\":\\"San Francisco"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"\\"", "snapshot": "{\\"location\\":\\"San Francisco\\""}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"}", "snapshot": "{\\"location\\":\\"San Francisco\\"}"}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def citations_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_citations","type":"message","role":"assistant","content":[],"model":"claude-3-opus-20240229","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":20,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"text","text":""}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"The sky is blue due to Rayleigh scattering"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"citations_delta","citation":{"type":"citation_char_location","document_title":"Sky Color","start_char_index":0,"end_char_index":42}}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"."}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end
end
