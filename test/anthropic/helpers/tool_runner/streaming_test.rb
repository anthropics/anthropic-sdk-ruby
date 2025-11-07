# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Helpers::ToolRunner::StreamingTest < Minitest::Test
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
    @calculator = Calculator.new
  end

  def teardown
    WebMock.reset!
    super
  end

  class CalculatorInput < Anthropic::BaseModel
    required :lhs, Float
    required :rhs, Float
    required :operator, Anthropic::InputSchema::EnumOf[:+, :-, :*, :/]
  end

  class Calculator < Anthropic::BaseTool
    doc "Performs arithmetic"

    input_schema CalculatorInput

    attr_reader :call_history

    def initialize
      super
      @call_history = []
    end

    def call(expr)
      @call_history << {lhs: expr.lhs, rhs: expr.rhs, operator: expr.operator}
      expr.lhs.send(expr.operator, expr.rhs)
    end
  end

  def sse_response(*events)
    events.map { |e| "event: #{e[:type]}\ndata: #{e.to_json}\n\n" }.join
  end

  def stub_streaming_responses(*bodies)
    count = 0
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .to_return do |_|
      count += 1
      {
        status: 200,
        body: bodies[count - 1],
        headers: {"content-type" => "text/event-stream"}
      }
    end
  end

  def consume_stream(stream)
    # Consume all events in the stream to trigger tool execution
    stream.each { |_| } # rubocop:disable Lint/EmptyBlock
    stream.accumulated_message
  end

  def stream_events(id:, content:, stop_reason: "tool_use")
    events = [
      {
        type: "message_start",
        message: {
          id: id,
          type: "message",
          role: "assistant",
          content: [],
          model: "claude-3-7-sonnet-latest",
          usage: {input_tokens: 10, output_tokens: 0}
        }
      }
    ]

    content.each_with_index do |block, i|
      if block[:type] == "text"
        events << {type: "content_block_start", index: i, content_block: {type: "text", text: ""}}
        events << {type: "content_block_delta", index: i, delta: {type: "text_delta", text: block[:text]}}
      else
        events << {
          type: "content_block_start",
          index: i,
          content_block: {type: "tool_use", id: block[:id], name: block[:name], input: ""}
        }
        events << {
          type: "content_block_delta",
          index: i,
          delta: {type: "input_json_delta", partial_json: block[:input].to_json}
        }
      end
      events << {type: "content_block_stop", index: i}
    end

    events << {type: "message_delta", delta: {stop_reason: stop_reason}, usage: {output_tokens: 20}}
    events << {type: "message_stop"}
    sse_response(*events)
  end

  def test_basic_streaming_with_tool_loop
    stub_streaming_responses(
      stream_events(
        id: "msg_1",
        content: [
          {
            type: "tool_use",
            id: "t1",
            name: "calculator",
            input: {lhs: 10.0, rhs: 5.0, operator: "+"}
          }
        ]
      ),
      stream_events(
        id: "msg_2",
        content: [{type: "text", text: "Result is 15"}],
        stop_reason: "end_turn"
      )
    )

    accumulated_messages = []
    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Calculate", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@calculator],
      stream: true
    ).each_streaming do |stream|
      accumulated_messages << consume_stream(stream)
    end

    assert_pattern do
      accumulated_messages => [
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [{text: "Result is 15"}]}
      ]
    end

    assert_pattern do
      @calculator.call_history => [
        {lhs: 10.0, rhs: 5.0, operator: :+}
      ]
    end
  end

  def test_multiple_tools_in_one_response
    stub_streaming_responses(
      stream_events(
        id: "msg_1",
        content: [
          {
            type: "tool_use",
            id: "t1",
            name: "calculator",
            input: {lhs: 10.0, rhs: 2.0, operator: "*"}
          },
          {
            type: "tool_use",
            id: "t2",
            name: "calculator",
            input: {lhs: 20.0, rhs: 5.0, operator: "/"}
          }
        ]
      ),
      stream_events(
        id: "msg_2",
        content: [{type: "text", text: "Done"}],
        stop_reason: "end_turn"
      )
    )

    accumulated_messages = []
    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Calculate", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@calculator],
      stream: true
    ).each_streaming do |stream|
      accumulated_messages << consume_stream(stream)
    end

    assert_pattern do
      accumulated_messages => [
        {
          role: :assistant,
          content: [
            Anthropic::Beta::BetaToolUseBlock,
            Anthropic::Beta::BetaToolUseBlock
          ]
        },
        {role: :assistant, content: [{text: "Done"}]}
      ]
    end

    assert_pattern do
      @calculator.call_history => [
        {lhs: 10.0, rhs: 2.0, operator: :*},
        {lhs: 20.0, rhs: 5.0, operator: :/}
      ]
    end
  end

  def test_mixed_text_and_tools
    stub_streaming_responses(
      stream_events(
        id: "msg_1",
        content: [
          {type: "text", text: "Let me calculate:"},
          {
            type: "tool_use",
            id: "t1",
            name: "calculator",
            input: {lhs: 8.0, rhs: 3.0, operator: "-"}
          }
        ]
      ),
      stream_events(
        id: "msg_2",
        content: [{type: "text", text: "Answer is 5"}],
        stop_reason: "end_turn"
      )
    )

    accumulated_messages = []
    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Calculate", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@calculator],
      stream: true
    ).each_streaming do |stream|
      accumulated_messages << consume_stream(stream)
    end

    assert_pattern do
      accumulated_messages => [
        {
          role: :assistant,
          content: [
            {text: "Let me calculate:"},
            Anthropic::Beta::BetaToolUseBlock
          ]
        },
        {role: :assistant, content: [{text: "Answer is 5"}]}
      ]
    end

    assert_pattern do
      @calculator.call_history => [
        {lhs: 8.0, rhs: 3.0, operator: :-}
      ]
    end
  end

  def test_no_block_raises_error
    assert_raises(ArgumentError) do
      @client.beta.messages.tool_runner(
        max_tokens: 1024,
        messages: [{content: "Test", role: :user}],
        model: :"claude-3-7-sonnet-latest",
        tools: [Calculator]
      ).each_streaming
    end
  end

  def test_no_tools_single_response
    stub_streaming_responses(
      stream_events(
        id: "msg_1",
        content: [{type: "text", text: "Just text"}],
        stop_reason: "end_turn"
      )
    )

    accumulated_messages = []
    @client.beta.messages.tool_runner(
      max_tokens: 1024,
      messages: [{content: "Test", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      stream: true
    ).each_streaming do |stream|
      accumulated_messages << consume_stream(stream)
    end

    assert_pattern do
      accumulated_messages => [
        {role: :assistant, content: [{text: "Just text"}]}
      ]
    end
  end
end
