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
      model: :"claude-opus-4-6"
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
        model: :"claude-opus-4-6",
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
      model: :"claude-opus-4-6"
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
      model: :"claude-opus-4-6",
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

  # Valid-JSON twin of tools_sse_response below, whose buffer is deliberately
  # malformed to pin the verbatim mid-stream snapshot behavior.
  def tool_input_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_tool","type":"message","role":"assistant","content":[],"model":"claude-sonnet-4-5-20250929","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"tool_use","id":"tool_use_1","name":"get_weather","input":{}}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"{\\"location\\":"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"\\"San Francisco\\"}"}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"tool_use","stop_sequence":null},"usage":{"output_tokens":10}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def test_accumulated_message_decodes_tool_use_input
    stub_streaming_response(tool_input_sse_response)

    stream = @client.messages.stream(**tools_params)

    message = stream.accumulated_message

    # The finished block carries the decoded object, like the non-streaming
    # message — not the raw partial-JSON buffer the input_json events expose.
    assert_pattern do
      message => {
        content: [{type: :tool_use, input: {location: "San Francisco"}}]
      }
    end
  end

  def empty_tool_input_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_tool","type":"message","role":"assistant","content":[],"model":"claude-sonnet-4-5-20250929","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"tool_use","id":"tool_use_1","name":"get_weather","input":{}}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":""}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"tool_use","stop_sequence":null},"usage":{"output_tokens":10}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def test_accumulated_message_decodes_empty_tool_use_input_as_empty_object
    stub_streaming_response(empty_tool_input_sse_response)

    stream = @client.messages.stream(**tools_params)

    message = stream.accumulated_message

    assert_equal({}, message.content.first.input)
  end

  def test_accumulated_message_keeps_undecodable_tool_use_input_buffer
    # tools_sse_response's deltas accumulate to malformed JSON (a stray quote);
    # the raw buffer is kept rather than raising mid-stream.
    stub_streaming_response(tools_sse_response)

    stream = @client.messages.stream(**tools_params)

    message = stream.accumulated_message

    assert_equal("{\"location\":\"San Francisco\"\"}", message.content.first.input)
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
      model: :"claude-opus-4-6"
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
      data: {"type":"message_start","message":{"id":"msg_4QpJur2dWWDjF6C758FbBw5vm12BaVipnK","type":"message","role":"assistant","content":[],"model":"claude-opus-4-6","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":11,"output_tokens":1}}}

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
      data: {"type":"message_start","message":{"id":"msg_thinking","type":"message","role":"assistant","content":[],"model":"claude-opus-4-6","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

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
      data: {"type":"message_start","message":{"id":"msg_tools","type":"message","role":"assistant","content":[],"model":"claude-opus-4-6","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":15,"output_tokens":1}}}

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
      data: {"type":"message_start","message":{"id":"msg_citations","type":"message","role":"assistant","content":[],"model":"claude-opus-4-6","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":20,"output_tokens":1}}}

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

  # message_start carries the set-once usage fields (service_tier, cache_creation) that
  # message_delta never re-sends; the final message_delta carries the authoritative
  # cumulative counters plus the container and the thinking-token breakdown.
  def message_delta_fields_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_delta_fields","type":"message","role":"assistant","content":[],"model":"claude-opus-4-6","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":11,"output_tokens":1,"cache_creation_input_tokens":7,"cache_read_input_tokens":3,"cache_creation":{"ephemeral_5m_input_tokens":7,"ephemeral_1h_input_tokens":0},"service_tier":"standard"}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"text","text":""}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"Done."}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null,"container":{"id":"container_123","expires_at":"2025-01-01T00:00:00Z"}},"usage":{"input_tokens":25,"output_tokens":40,"cache_creation_input_tokens":9,"cache_read_input_tokens":5,"server_tool_use":{"web_search_requests":2,"web_fetch_requests":1},"output_tokens_details":{"thinking_tokens":12}}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def test_accumulated_message_carries_message_delta_fields
    stub_streaming_response(message_delta_fields_sse_response)

    message = @client.messages.stream(**basic_params).accumulated_message

    assert_equal("container_123", message.container.id)
    assert_equal(12, message.usage.output_tokens_details.thinking_tokens)
    assert_equal(2, message.usage.server_tool_use.web_search_requests)
    assert_equal(25, message.usage.input_tokens)
    assert_equal(40, message.usage.output_tokens)
    assert_equal(9, message.usage.cache_creation_input_tokens)
    assert_equal(5, message.usage.cache_read_input_tokens)
    assert_equal(:end_turn, message.stop_reason)
    assert_nil(message.stop_sequence)
  end

  def test_accumulated_message_keeps_message_start_usage_fields
    stub_streaming_response(message_delta_fields_sse_response)

    message = @client.messages.stream(**basic_params).accumulated_message

    # Never re-sent on message_delta, so they must survive from message_start.
    assert_equal(:standard, message.usage.service_tier)
    assert_equal(7, message.usage.cache_creation.ephemeral_5m_input_tokens)
  end

  def test_accumulated_message_keeps_usage_omitted_by_message_delta
    # basic_sse_response's message_delta reports only output_tokens.
    stub_streaming_response(basic_sse_response)

    message = @client.messages.stream(**basic_params).accumulated_message

    assert_equal(6, message.usage.output_tokens)
    assert_equal(11, message.usage.input_tokens)
    assert_nil(message.container)
    assert_nil(message.usage.output_tokens_details)
    # The delta's null stop_sequence must leave the field readable, not poisoned.
    assert_nil(message.stop_sequence)
  end

  def test_streaming_error_event_has_type
    sse_body = <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_test","type":"message","role":"assistant","content":[],"model":"claude-opus-4-6","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":11,"output_tokens":1}}}

      event: error
      data: {"type":"error","error":{"type":"overloaded_error","message":"Overloaded"}}

    SSE

    stub_streaming_response(sse_body)

    err = assert_raises(Anthropic::Errors::APIStatusError) do
      @client.messages.stream(**basic_params).each { |event| assert(event) }
    end

    assert_equal(:overloaded_error, err.type)
  end
end
