# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Helpers::ToolRunner::MessagesTest < Minitest::Test
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
    @failing_tool = FailingTool.new
    @stateful_counter = StatefulCounter.new
  end

  def teardown
    WebMock.reset!
    super
  end

  def tool_use_response(id:, tool_use:, text: nil, stop_reason: "tool_use")
    tool_uses = if tool_use.is_a?(Array)
      tool_use.map { {type: "tool_use", **_1} }
    else
      [{type: "tool_use", **tool_use}]
    end

    content = []
    content << {type: "text", text: text} if text
    content.concat(tool_uses)

    {
      status: 200,
      headers: {"Content-Type" => "application/json"},
      body: message_body(
        id: id,
        content: content,
        stop_reason: stop_reason
      ).to_json
    }
  end

  def text_response(id:, text:, stop_reason: "end_turn")
    {
      status: 200,
      headers: {"Content-Type" => "application/json"},
      body: message_body(
        id: id,
        content: [{type: "text", text: text}],
        stop_reason: stop_reason
      ).to_json
    }
  end

  def message_body(id:, content:, stop_reason:, usage: nil)
    {
      id: id,
      type: "message",
      role: "assistant",
      model: "claude-3-7-sonnet-latest",
      content: content,
      stop_reason: stop_reason,
      usage: usage || {input_tokens: 10, output_tokens: 20}
    }
  end

  def stub_responses(*responses)
    call_count = 0
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .to_return do |_request|
        call_count += 1
        responses[call_count - 1]
      end
  end

  def collect_messages(params)
    [].tap do |messages|
      @client.beta.messages.tool_runner(params).each_message { messages << _1 }
    end
  end

  class CalculatorInput < Anthropic::BaseModel
    required :lhs, Float, doc: "left hand side operand"
    required :rhs, Float, doc: "right hand side operand"
    required :operator, Anthropic::InputSchema::EnumOf[:+, :-, :*, :/]
  end

  class Calculator < Anthropic::BaseTool
    doc "Performs basic arithmetic operations"

    input_schema CalculatorInput

    attr_reader :call_history

    def initialize
      super
      @call_history = []
    end

    def call(expr)
      @call_history << {lhs: expr.lhs, rhs: expr.rhs, operator: expr.operator}

      case expr.operator
      in :+
        expr.lhs + expr.rhs
      in :-
        expr.lhs - expr.rhs
      in :*
        expr.lhs * expr.rhs
      in :/
        expr.lhs / expr.rhs
      end
    end
  end

  class FailingToolInput < Anthropic::BaseModel
    required :message, String, doc: "error message"
  end

  class FailingTool < Anthropic::BaseTool
    description "A tool that always fails"

    input_schema FailingToolInput

    attr_reader :call_count

    def initialize
      super
      @call_count = 0
    end

    def call(input)
      @call_count += 1
      raise StandardError.new(input.message)
    end
  end

  class CounterInput < Anthropic::BaseModel
    required :increment, Integer, doc: "amount to increment"
  end

  class StatefulCounter < Anthropic::BaseTool
    description "Counts invocations"

    input_schema CounterInput

    attr_reader :total

    def initialize
      super
      @total = 0
    end

    def call(input)
      @total += input.increment
      @total
    end
  end

  def basic_params
    {
      max_tokens: 1024,
      messages: [{content: "Calculate 10 + 5", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@calculator]
    }
  end

  def test_basic_each_message
    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_use: {id: "tool_1", name: "calculator", input: {lhs: 10.0, rhs: 5.0, operator: "+"}}
      ),
      text_response(id: "msg_2", text: "10 + 5 = 15")
    )

    messages = collect_messages(basic_params)

    assert_pattern do
      messages => [
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [{text: "10 + 5 = 15"}]}
      ]
    end

    assert_equal([{lhs: 10.0, rhs: 5.0, operator: :+}], @calculator.call_history)
  end

  def test_multiple_tool_calls_in_loop
    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_use: {id: "tool_1", name: "calculator", input: {lhs: 10.0, rhs: 5.0, operator: "+"}}
      ),
      tool_use_response(
        id: "msg_2",
        tool_use: {id: "tool_2", name: "calculator", input: {lhs: 15.0, rhs: 3.0, operator: "*"}}
      ),
      text_response(id: "msg_3", text: "Result is 45")
    )

    messages = collect_messages(basic_params)

    assert_pattern do
      messages => [
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [{text: "Result is 45"}]}
      ]
    end

    assert_equal(
      [
        {lhs: 10.0, rhs: 5.0, operator: :+},
        {lhs: 15.0, rhs: 3.0, operator: :*}
      ],
      @calculator.call_history
    )
  end

  def test_error_handling_in_tool_execution
    params = {
      max_tokens: 1024,
      messages: [{content: "Trigger an error", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@failing_tool]
    }

    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_use: {id: "tool_1", name: "failing_tool", input: {message: "Expected failure"}}
      ),
      text_response(id: "msg_2", text: "The tool failed with an error")
    )

    messages = collect_messages(params)

    assert_pattern do
      messages => [
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [{text: "The tool failed with an error"}]}
      ]
    end

    assert_equal(1, @failing_tool.call_count)
  end

  def test_mixed_content_with_tools
    stub_responses(
      tool_use_response(
        id: "msg_1",
        text: "Let me calculate that for you.",
        tool_use: {id: "tool_1", name: "calculator", input: {lhs: 20.0, rhs: 4.0, operator: "/"}}
      ),
      text_response(id: "msg_2", text: "The result is 5")
    )

    messages = collect_messages(basic_params)

    assert_pattern do
      messages => [
        {
          role: :assistant,
          content: [
            {text: "Let me calculate that for you."},
            Anthropic::Beta::BetaToolUseBlock
          ]
        },
        {role: :assistant, content: [{text: "The result is 5"}]}
      ]
    end
  end

  def test_stateful_tool_preservation
    params = {
      max_tokens: 1024,
      messages: [{content: "Count up", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@stateful_counter]
    }

    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_use: {id: "tool_1", name: "stateful_counter", input: {increment: 5}}
      ),
      tool_use_response(
        id: "msg_2",
        tool_use: {id: "tool_2", name: "stateful_counter", input: {increment: 3}}
      ),
      text_response(id: "msg_3", text: "Total is 8")
    )

    messages = collect_messages(params)

    assert_pattern do
      messages => [
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [{text: "Total is 8"}]}
      ]
    end

    assert_equal(8, @stateful_counter.total)
  end

  def test_no_block_given_raises_error
    assert_raises(ArgumentError) do
      @client.beta.messages.tool_runner(basic_params).each_message
    end
  end

  def test_no_tools_no_loop
    params = {
      max_tokens: 1024,
      messages: [{content: "Just respond with text", role: :user}],
      model: :"claude-3-7-sonnet-latest"
    }

    stub_responses(
      text_response(id: "msg_1", text: "Here is a text response")
    )

    messages = collect_messages(params)

    assert_pattern do
      messages => [
        {role: :assistant, content: [{text: "Here is a text response"}]}
      ]
    end
  end

  def test_multiple_tools_in_single_response
    params = {
      max_tokens: 1024,
      messages: [{content: "Calculate multiple things", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@calculator, @stateful_counter]
    }

    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_use: [
          {id: "tool_1", name: "calculator", input: {lhs: 10.0, rhs: 2.0, operator: "*"}},
          {id: "tool_2", name: "stateful_counter", input: {increment: 20}}
        ]
      ),
      text_response(id: "msg_2", text: "Calculated 20 and counted to 20")
    )

    messages = collect_messages(params)

    assert_pattern do
      messages => [
        {
          role: :assistant,
          content: [
            Anthropic::Beta::BetaToolUseBlock,
            Anthropic::Beta::BetaToolUseBlock
          ]
        },
        {role: :assistant, content: [{text: "Calculated 20 and counted to 20"}]}
      ]
    end

    assert_equal([{lhs: 10.0, rhs: 2.0, operator: :*}], @calculator.call_history)
    assert_equal(20, @stateful_counter.total)
  end

  # Test that non-string results are properly converted
  class ComplexResultInput < Anthropic::BaseModel
    required :format, Anthropic::InputSchema::EnumOf[:array, :hash, :number]
  end

  class ComplexResultTool < Anthropic::BaseTool
    doc "Returns complex results"

    input_schema ComplexResultInput

    def call(input)
      case input.format
      in :array
        [1, 2, 3]
      in :hash
        {key: "value"}
      in :number
        42
      end
    end
  end

  def test_tool_result_content_handling
    @complex_result_tool = ComplexResultTool.new
    params = {
      max_tokens: 1024,
      messages: [{content: "Get complex results", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@complex_result_tool]
    }

    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_use: {id: "tool_1", name: "complex_result_tool", input: {format: "array"}}
      ),
      text_response(id: "msg_2", text: "Got array result")
    )

    messages = collect_messages(params)

    assert_pattern do
      messages => [
        {role: :assistant, content: [Anthropic::Beta::BetaToolUseBlock]},
        {role: :assistant, content: [{text: "Got array result"}]}
      ]
    end
  end
end
