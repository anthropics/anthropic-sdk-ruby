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

  def tool_input_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_tool","type":"message","role":"assistant","content":[],"model":"claude-sonnet-4-20250514","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

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

  def tool_params
    {
      max_tokens: 1024,
      messages: [{content: "What is the weather in San Francisco?", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [
        {
          name: "get_weather",
          description: "Get the current weather",
          input_schema: {
            type: "object",
            properties: {location: {type: "string"}},
            required: ["location"]
          }
        }
      ]
    }
  end

  def test_accumulated_message_decodes_tool_use_input
    stub_streaming_response(tool_input_sse_response)

    stream = @client.beta.messages.stream(**tool_params)

    message = stream.accumulated_message

    # The finished block carries the decoded object, like the non-streaming
    # message — not the raw partial-JSON buffer the input_json events expose.
    assert_pattern do
      message => {
        content: [{type: :tool_use, input: {location: "San Francisco"}}]
      }
    end
  end

  # A server-tool turn: the server_tool_use input streams in as input_json_delta
  # chunks like a client tool's, and its result block arrives whole (no deltas).
  def server_tool_use_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_srvtool","type":"message","role":"assistant","content":[],"model":"claude-sonnet-4-20250514","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":25,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"server_tool_use","id":"srvtoolu_1","name":"web_search","input":{}}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"{\\"query\\":"}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":" \\"Anthropic Claude\\"}"}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: content_block_start
      data: {"type":"content_block_start","index":1,"content_block":{"type":"web_search_tool_result","tool_use_id":"srvtoolu_1","content":[{"type":"web_search_result","url":"https://example.com/claude","title":"Claude by Anthropic","encrypted_content":"EqgfCioIBBgCIiQ3YmU4Mjc2Zi1kNjJlLTQ=","page_age":"January 15, 2025"}]}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":1}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":34}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def test_accumulated_message_decodes_server_tool_use_input
    stub_streaming_response(server_tool_use_sse_response)

    message = @client.beta.messages.stream(**compaction_params).accumulated_message

    # The streamed input must land on the server_tool_use block just as it does
    # for tool_use, matching the non-streaming message.
    assert_pattern do
      message => {
        content: [
          {type: :server_tool_use, name: :web_search, input: {query: "Anthropic Claude"}},
          {type: :web_search_tool_result, tool_use_id: "srvtoolu_1", content: [{url: "https://example.com/claude"}]}
        ]
      }
    end
  end

  # An MCP connector turn: mcp_tool_use input also streams in as input_json_delta.
  def mcp_tool_use_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_mcptool","type":"message","role":"assistant","content":[],"model":"claude-sonnet-4-20250514","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":25,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"mcp_tool_use","id":"mcptoolu_1","name":"echo","server_name":"example","input":{}}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"{\\"text\\": "}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"input_json_delta","partial_json":"\\"hi\\"}"}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: content_block_start
      data: {"type":"content_block_start","index":1,"content_block":{"type":"mcp_tool_result","tool_use_id":"mcptoolu_1","is_error":false,"content":[{"type":"text","text":"hi"}]}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":1}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":20}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def test_accumulated_message_decodes_mcp_tool_use_input
    stub_streaming_response(mcp_tool_use_sse_response)

    json_events = []
    stream = @client.beta.messages.stream(**compaction_params)
    stream.each do |event|
      json_events << event if event.type == :input_json
    end

    assert_equal("{\"text\": \"hi\"}", json_events.last.snapshot)
    assert_pattern do
      stream.accumulated_message => {
        content: [
          {type: :mcp_tool_use, name: "echo", server_name: "example", input: {text: "hi"}},
          {type: :mcp_tool_result, tool_use_id: "mcptoolu_1", is_error: false}
        ]
      }
    end
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

  def test_fallback_accumulated_message_model
    stub_streaming_response(fallback_sse_response)

    stream = @client.beta.messages.stream(**compaction_params)
    message = stream.accumulated_message

    assert_equal("claude-fallback-model-b", message.model.to_s)
    assert_equal(2, message.content.length)
    fallback_block = message.content[0]
    assert_equal(:fallback, fallback_block.type)
    assert_equal("claude-requested-model-a", fallback_block.from.model.to_s)
    assert_equal("claude-fallback-model-b", fallback_block.to.model.to_s)
  end

  def test_accumulated_message_carries_context_management_and_container
    stub_streaming_response(context_management_sse_response)

    stream = @client.beta.messages.stream(**compaction_params)
    message = stream.accumulated_message

    # context_management rides on the message_delta event itself, and the container
    # only ever arrives on message_delta — neither is present on message_start.
    assert_equal(1, message.context_management.applied_edits.length)
    applied_edit = message.context_management.applied_edits.first
    assert_equal(:clear_tool_uses_20250919, applied_edit.type)
    assert_equal(150, applied_edit.cleared_input_tokens)
    assert_equal("container_beta", message.container.id)
    assert_equal(9, message.usage.output_tokens_details.thinking_tokens)
  end

  def context_management_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_ctx","type":"message","role":"assistant","content":[],"model":"claude-sonnet-4-20250514","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"text","text":"","citations":null}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"Hi."}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_delta
      data: {"type":"message_delta","context_management":{"applied_edits":[{"type":"clear_tool_uses_20250919","cleared_input_tokens":150,"cleared_tool_uses":2}]},"delta":{"stop_reason":"end_turn","stop_sequence":null,"container":{"id":"container_beta","expires_at":"2025-01-01T00:00:00Z"}},"usage":{"output_tokens":15,"output_tokens_details":{"thinking_tokens":9}}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def test_accumulated_message_carries_fallback_credit_usage
    stub_streaming_response(fallback_credit_sse_response)

    stream = @client.beta.messages.stream(**compaction_params)
    message = stream.accumulated_message

    # message_delta usage is authoritative; the redemption outcome must survive
    # accumulation like the other usage fields.
    assert_pattern do
      message.usage => {
        output_tokens: 15,
        fallback_credit: {status: {type: :redeemed}}
      }
    end
  end

  def fallback_credit_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_credit","type":"message","role":"assistant","content":[],"model":"claude-fallback-model-b","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"text","text":"","citations":null}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"Hi."}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":15,"fallback_credit":{"status":{"type":"redeemed"}}}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end

  def fallback_sse_response
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_fallback","type":"message","role":"assistant","content":[],"model":"claude-requested-model-a","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"fallback","from":{"model":"claude-requested-model-a"},"to":{"model":"claude-fallback-model-b"}}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: content_block_start
      data: {"type":"content_block_start","index":1,"content_block":{"type":"text","text":"","citations":null}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":1,"delta":{"type":"text_delta","text":"Hello from the fallback."}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":1}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":15}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
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
