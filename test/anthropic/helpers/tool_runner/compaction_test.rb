# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Helpers::ToolRunner::CompactionTest < Minitest::Test
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
    @simple_tool = SimpleTool.new
    @callback_invocations = []
  end

  def teardown
    WebMock.reset!
    super
  end

  # Helper to create a message response
  def message_response(id:, content:, stop_reason:, input_tokens: 100, output_tokens: 50, cache_tokens: 0)
    {
      status: 200,
      headers: {"Content-Type" => "application/json"},
      body: {
        id:,
        type: "message",
        role: "assistant",
        model: "claude-sonnet-4-20250514",
        content:,
        stop_reason:,
        usage: {
          input_tokens:,
          output_tokens:,
          cache_creation_input_tokens: cache_tokens,
          cache_read_input_tokens: 0
        }
      }.to_json
    }
  end

  def tool_use_response(id:, tool_name:, input:, **opts)
    message_response(
      id:,
      content: [{type: "tool_use", id: "tool_#{id}", name: tool_name, input: input}],
      stop_reason: "tool_use",
      **opts
    )
  end

  def text_response(id:, text:, **opts)
    message_response(
      id:,
      content: [{type: "text", text:}],
      stop_reason: "end_turn",
      **opts
    )
  end

  def summary_response(id:, summary:, **opts)
    message_response(
      id:,
      content: [{type: "text", text: "<summary>#{summary}</summary>"}],
      stop_reason: "end_turn",
      **opts
    )
  end

  def stub_responses(*responses)
    call_count = 0
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .to_return do |_request|
        call_count += 1
        responses[call_count - 1]
      end
  end

  # Simple tool for testing
  class SimpleToolInput < Anthropic::BaseModel
    required :value, String, doc: "Some value"
  end

  class SimpleTool < Anthropic::BaseTool
    doc "A simple test tool"
    input_schema SimpleToolInput

    def call(input)
      "Result: #{input.value}"
    end
  end

  def test_compaction_triggers_when_threshold_exceeded
    # First request: 300 tokens total (200 input + 100 output) - below threshold
    # Second request: tool use with 600 tokens total (400 input + 200 output) - exceeds 500 threshold
    # Third request: compaction summary
    # Fourth request: final response after compaction
    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_name: "simple_tool",
        input: {value: "test"},
        input_tokens: 200,
        output_tokens: 100
      ),
      tool_use_response(
        id: "msg_2",
        tool_name: "simple_tool",
        input: {value: "test2"},
        input_tokens: 400,
        output_tokens: 200
      ),
      summary_response(
        id: "summary_1",
        summary: "This is a compacted summary",
        output_tokens: 50
      ),
      text_response(
        id: "msg_3",
        text: "Final response",
        input_tokens: 100,
        output_tokens: 30
      )
    )

    messages = []
    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test compaction", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool],
      compaction_control: {
        enabled: true,
        context_token_threshold: 500
      }
    ).each_message { messages << _1 }

    # We should have 3 messages: 2 tool uses and 1 final text
    assert_equal(3, messages.length)
  end

  def test_no_compaction_below_threshold
    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_name: "simple_tool",
        input: {value: "test"},
        input_tokens: 100,
        output_tokens: 50
      ),
      text_response(
        id: "msg_2",
        text: "Done",
        input_tokens: 120,
        output_tokens: 30
      )
    )

    messages = []
    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test no compaction", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool],
      compaction_control: {
        enabled: true,
        context_token_threshold: 500
      }
    ).each_message { messages << _1 }

    # Should complete normally without compaction
    assert_equal(2, messages.length)
  end

  def test_callback_invoked_on_compaction
    callback_invoked = false
    tokens_before = nil
    tokens_after = nil

    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_name: "simple_tool",
        input: {value: "test"},
        input_tokens: 400,
        output_tokens: 200
      ),
      summary_response(
        id: "summary_1",
        summary: "Compacted",
        output_tokens: 50
      ),
      text_response(id: "msg_2", text: "Done")
    )

    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test callback", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool],
      compaction_control: {
        enabled: true,
        context_token_threshold: 500,
        on_compact: lambda do |before, after|
          callback_invoked = true
          tokens_before = before
          tokens_after = after
        end
      }
    ).each_message { |_msg| nil }

    assert(callback_invoked, "Callback should have been invoked")
    assert_equal(600, tokens_before, "Should report correct tokens before compaction")
    assert_equal(50, tokens_after, "Should report correct tokens after compaction")
  end

  def test_custom_summary_prompt
    custom_prompt = "Please provide a brief summary."
    request_bodies = []

    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .to_return do |request|
        request_bodies << JSON.parse(request.body)
        call_count = request_bodies.length

        case call_count
        in 1
          tool_use_response(
            id: "msg_1",
            tool_name: "simple_tool",
            input: {value: "test"},
            input_tokens: 400,
            output_tokens: 200
          )
        in 2
          # This is the compaction request - check the prompt
          summary_response(id: "summary_1", summary: "Compacted", output_tokens: 50)
        in 3
          text_response(id: "msg_2", text: "Done")
        end
      end

    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test custom prompt", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool],
      compaction_control: {
        enabled: true,
        context_token_threshold: 500,
        summary_prompt: custom_prompt
      }
    ).each_message { |_msg| nil }

    # The second request should be the compaction request with custom prompt
    assert_equal(3, request_bodies.length)
    compaction_request = request_bodies[1]
    last_message = compaction_request["messages"].last
    assert_equal("user", last_message["role"])
    assert_equal(custom_prompt, last_message["content"])
  end

  def test_custom_model_for_compaction
    request_bodies = []

    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .to_return do |request|
        request_bodies << JSON.parse(request.body)
        call_count = request_bodies.length

        case call_count
        in 1
          tool_use_response(
            id: "msg_1",
            tool_name: "simple_tool",
            input: {value: "test"},
            input_tokens: 400,
            output_tokens: 200
          )
        in 2
          summary_response(id: "summary_1", summary: "Compacted", output_tokens: 50)
        in 3
          text_response(id: "msg_2", text: "Done")
        end
      end

    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test custom model", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool],
      compaction_control: {
        enabled: true,
        context_token_threshold: 500,
        model: "claude-3-7-sonnet-20250219"
      }
    ).each_message { |_msg| nil }

    # The compaction request should use the custom model
    compaction_request = request_bodies[1]
    assert_equal("claude-3-7-sonnet-20250219", compaction_request["model"])
  end

  def test_disabled_compaction_does_not_trigger
    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_name: "simple_tool",
        input: {value: "test"},
        input_tokens: 400,
        output_tokens: 200
      ),
      text_response(id: "msg_2", text: "Done")
    )

    messages = []
    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test disabled", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool],
      compaction_control: {
        enabled: false,
        context_token_threshold: 500
      }
    ).each_message { messages << _1 }

    # Should complete without compaction even though tokens exceed threshold
    assert_equal(2, messages.length)
  end

  def test_nil_compaction_control_works
    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_name: "simple_tool",
        input: {value: "test"},
        input_tokens: 400,
        output_tokens: 200
      ),
      text_response(id: "msg_2", text: "Done")
    )

    params = {
      max_tokens: 1024,
      messages: [{content: "Test nil config", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool]
    }

    # Should work fine with nil compaction_control (default behavior)
    messages = []
    @client.beta.messages.tool_runner(params).each_message { messages << _1 }

    assert_equal(2, messages.length)
  end

  def test_compaction_includes_cache_tokens_in_calculation
    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_name: "simple_tool",
        input: {value: "test"},
        input_tokens: 200,
        output_tokens: 100,
        cache_tokens: 250 # This pushes us over 500 threshold
      ),
      summary_response(id: "summary_1", summary: "Compacted", output_tokens: 50),
      text_response(id: "msg_2", text: "Done")
    )

    callback_invoked = false
    tokens_before = nil

    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test cache tokens", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool],
      compaction_control: {
        enabled: true,
        context_token_threshold: 500,
        on_compact: lambda do |before, _after|
          callback_invoked = true
          tokens_before = before
        end
      }
    ).each_message { |_msg| nil }

    assert(callback_invoked, "Compaction should trigger when cache tokens included")
    # 200 input + 250 cache + 100 output = 550 tokens
    assert_equal(550, tokens_before)
  end

  def test_compaction_handles_tool_use_blocks_in_last_message
    # Tests compaction when it triggers after a tool_use response
    # Without proper handling, this would cause a 400 error from the API
    request_bodies = []

    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .to_return do |request|
        request_bodies << JSON.parse(request.body)
        call_count = request_bodies.length

        case call_count
        in 1
          # First response with tool_use (this will trigger compaction on next iteration)
          tool_use_response(
            id: "msg_1",
            tool_name: "simple_tool",
            input: {value: "test"},
            input_tokens: 400,
            output_tokens: 200
          )
        in 2
          # Compaction request - verify tool_use blocks were stripped
          summary_response(id: "summary_1", summary: "Compacted", output_tokens: 50)
        in 3
          # Final response after compaction
          text_response(id: "msg_2", text: "Done")
        end
      end

    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test tool_use handling", role: :user}],
      model: :"claude-sonnet-4-20250514",
      tools: [@simple_tool],
      compaction_control: {
        enabled: true,
        context_token_threshold: 500
      }
    ).each_message { |_msg| nil }

    # Verify the compaction request (second call) doesn't include tool_use blocks
    assert_equal(3, request_bodies.length)
    compaction_request = request_bodies[1]

    # The last message before the summary prompt should not have tool_use blocks
    messages_before_summary = compaction_request["messages"][0..-2]
    return unless messages_before_summary.last&.[]("role") == "assistant"

    content = messages_before_summary.last["content"]
    tool_use_blocks = content.select { |block| block["type"] == "tool_use" }
    assert_equal(0, tool_use_blocks.length, "tool_use blocks should be filtered out")
  end
end
