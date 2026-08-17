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

  def tool_use_response(id:, tool_use:, text: nil, stop_reason: "tool_use", container: nil)
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
        stop_reason: stop_reason,
        container: container
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

  def message_body(id:, content:, stop_reason:, usage: nil, container: nil)
    {
      id: id,
      type: "message",
      role: "assistant",
      model: "claude-3-7-sonnet-latest",
      content: content,
      stop_reason: stop_reason,
      usage: usage || {input_tokens: 10, output_tokens: 20},
      container: container
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

  class StrictCalculator < Anthropic::BaseTool
    doc "Performs basic arithmetic operations"

    input_schema CalculatorInput

    tool_options strict: true, cache_control: {type: :ephemeral}

    def call(expr) = expr.lhs.public_send(expr.operator, expr.rhs)
  end

  def basic_params
    {
      max_tokens: 1024,
      messages: [{content: "Calculate 10 + 5", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      tools: [@calculator]
    }
  end

  def test_tool_options_are_sent_on_every_request
    stub_responses(
      tool_use_response(
        id: "msg_1",
        tool_use: {id: "tool_1", name: "strict_calculator", input: {lhs: 10.0, rhs: 5.0, operator: "+"}}
      ),
      text_response(id: "msg_2", text: "10 + 5 = 15")
    )

    runner = @client.beta.messages.tool_runner({**basic_params, tools: [StrictCalculator.new]})
    runner.each_message { nil }

    assert_requested(:post, "http://localhost/v1/messages?beta=true", times: 2) do |request|
      assert_pattern do
        JSON.parse(request.body, symbolize_names: true) => {
          tools: [
            {
              name: "strict_calculator",
              description: "Performs basic arithmetic operations",
              input_schema: {type: "object"},
              strict: true,
              cache_control: {type: "ephemeral"}
            }
          ]
        }
      end
    end
    assert_pattern { tool_result_for(runner, "tool_1") => {is_error: false, content: "15.0"} }
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

  def test_refusal_turn_with_tool_use_is_terminal
    stub_responses(
      tool_use_response(
        id: "msg_1",
        text: "I can't help with that.",
        tool_use: {id: "tool_1", name: "calculator", input: {lhs: 10.0, rhs: 5.0, operator: "+"}},
        stop_reason: "refusal"
      ),
      text_response(id: "msg_2", text: "unreachable")
    )

    runner = @client.beta.messages.tool_runner(basic_params)
    messages = []
    runner.each_message { messages << _1 }

    assert_pattern do
      messages => [
        {id: "msg_1", stop_reason: :refusal, content: [{type: :text}, Anthropic::Beta::BetaToolUseBlock]}
      ]
    end
    assert_empty(@calculator.call_history)
    assert(runner.finished?)
    assert_nil(runner.next_message)
    assert_requested(:post, "http://localhost/v1/messages?beta=true", times: 1)
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

  # Like `stub_responses`, but also records each request body the runner sends.
  def stub_responses_capturing_bodies(*responses)
    [].tap do |bodies|
      stub_request(:post, "http://localhost/v1/messages?beta=true")
        .to_return do |request|
          bodies << JSON.parse(request.body, symbolize_names: true)
          responses[bodies.length - 1]
        end
    end
  end

  def test_unknown_tool_use_is_replayed_verbatim
    bodies = stub_responses_capturing_bodies(
      tool_use_response(
        id: "msg_1",
        text: "Let me look that up.",
        tool_use: {id: "tool_1", name: "get_tides", input: {city: "Paris", days: 3}}
      ),
      text_response(id: "msg_2", text: "I have no tide tool available")
    )

    @client.beta.messages.tool_runner(basic_params).each_message { _1 }

    assert_empty(@calculator.call_history)
    assert_equal(2, bodies.length)

    first, follow_up = bodies
    assert_pattern do
      follow_up[:messages] => [
        *sent,
        {
          role: "assistant",
          content: [
            {type: "text", text: "Let me look that up."},
            {type: "tool_use", id: "tool_1", name: "get_tides", input: {city: "Paris", days: 3}}
          ]
        },
        {
          role: "user",
          content: [{type: "tool_result", tool_use_id: "tool_1", is_error: true, content: String}]
        }
      ]
      sent => ^(first[:messages])
    end
    assert_match(/'get_tides' not found/, follow_up.dig(:messages, -1, :content, 0, :content))
  end

  def calculator_tool_use_response(id:, tool_id:, container: nil)
    tool_use_response(
      id: id,
      tool_use: {id: tool_id, name: "calculator", input: {lhs: 10.0, rhs: 5.0, operator: "+"}},
      container: container
    )
  end

  SERVER_CONTAINER = {id: "cntr_server", expires_at: "2025-01-01T00:00:00Z"}.freeze

  def container_hop_bodies(params, container: SERVER_CONTAINER)
    bodies = stub_responses_capturing_bodies(
      calculator_tool_use_response(id: "msg_1", tool_id: "tool_1", container: container),
      text_response(id: "msg_2", text: "10 + 5 = 15")
    )
    @client.beta.messages.tool_runner(params).each_message { _1 }

    assert_equal(2, bodies.length)
    bodies
  end

  def test_server_assigned_container_is_forwarded
    first, follow_up = container_hop_bodies(basic_params)

    refute_operator(first, :key?, :container)
    assert_equal("cntr_server", follow_up[:container])
  end

  def test_pinned_container_id_is_not_overridden
    _first, follow_up = container_hop_bodies({**basic_params, container: "cntr_pinned"})

    assert_equal("cntr_pinned", follow_up[:container])
  end

  def test_pinned_container_hash_without_id_adopts_the_server_id
    skills = [{type: "anthropic", skill_id: "pptx", version: "latest"}]
    _first, follow_up = container_hop_bodies({**basic_params, container: {skills: skills}})

    assert_equal({id: "cntr_server", skills: skills}, follow_up[:container])
  end

  def test_pinned_container_params_without_id_adopts_the_server_id
    pinned = Anthropic::Beta::BetaContainerParams.new(skills: [{type: :anthropic, skill_id: "pptx"}])
    _first, follow_up = container_hop_bodies({**basic_params, container: pinned})

    assert_equal({id: "cntr_server", skills: [{type: "anthropic", skill_id: "pptx"}]}, follow_up[:container])
  end

  def test_pinned_container_hash_with_id_is_not_overridden
    pinned = {id: "cntr_pinned", skills: [{type: "anthropic", skill_id: "pptx"}]}
    _first, follow_up = container_hop_bodies({**basic_params, container: pinned})

    assert_equal(pinned, follow_up[:container])
  end

  def test_response_without_container_leaves_follow_up_without_one
    _first, follow_up = container_hop_bodies(basic_params, container: nil)

    refute_operator(follow_up, :key?, :container)
  end

  def tool_result_for(runner, tool_use_id)
    blocks = runner.params[:messages].select { _1[:role] == :user }.flat_map { _1[:content] }
    blocks.find { _1.is_a?(Hash) && _1[:tool_use_id] == tool_use_id }
  end

  def test_removed_tool_call_is_treated_as_unknown_tool
    removal = {
      role: :system,
      content: [{type: :tool_removal, tool: {type: :tool_reference, name: "calculator"}}]
    }

    stub_responses(
      calculator_tool_use_response(id: "msg_1", tool_id: "tool_1"),
      text_response(id: "msg_2", text: "Cannot calculate right now"),
      calculator_tool_use_response(id: "msg_3", tool_id: "tool_1"),
      text_response(id: "msg_4", text: "Cannot calculate right now")
    )

    removed_runner = @client.beta.messages.tool_runner(
      {**basic_params, messages: [*basic_params[:messages], removal]}
    )
    removed_runner.each_message { _1 }

    assert_empty(@calculator.call_history)

    # The same call against a runner where `calculator` was never declared at all.
    undeclared_runner = @client.beta.messages.tool_runner({**basic_params, tools: [@stateful_counter]})
    undeclared_runner.each_message { _1 }

    removed_result = tool_result_for(removed_runner, "tool_1")
    undeclared_result = tool_result_for(undeclared_runner, "tool_1")

    assert_equal(true, removed_result[:is_error])
    assert_equal(undeclared_result, removed_result)
  end

  def test_tool_addition_restores_removed_tool
    messages = [
      *basic_params[:messages],
      {
        role: :system,
        content: [{type: :tool_removal, tool: {type: :tool_reference, name: "calculator"}}]
      },
      {role: :user, content: "Actually, keep the calculator available."},
      {
        role: :system,
        content: [
          Anthropic::Beta::BetaRequestToolAdditionBlock.new(
            tool: {type: :tool_reference, name: "calculator"}
          )
        ]
      }
    ]

    stub_responses(
      calculator_tool_use_response(id: "msg_1", tool_id: "tool_1"),
      text_response(id: "msg_2", text: "10 + 5 = 15")
    )

    runner = @client.beta.messages.tool_runner({**basic_params, messages:})
    runner.each_message { _1 }

    assert_equal([{lhs: 10.0, rhs: 5.0, operator: :+}], @calculator.call_history)
    assert_pattern do
      tool_result_for(runner, "tool_1") => {is_error: false, content: "15.0"}
    end
  end

  def calculator_removal_message
    {
      role: :system,
      content: [{type: :tool_removal, tool: {type: :tool_reference, name: "calculator"}}]
    }
  end

  def calculator_addition_message
    {
      role: :system,
      content: [{type: :tool_addition, tool: {type: :tool_reference, name: "calculator"}}]
    }
  end

  def assert_not_found_result(result)
    assert_pattern do
      result => {is_error: true, content: /'calculator' not found/}
    end
  end

  # `each_message` yields the response before that turn's tool dispatch, and an in-place
  # append keeps the runner's messages array, so the removal applies to that same turn.
  def test_in_place_appended_tool_removal_blocks_same_turn_dispatch
    stub_responses(
      calculator_tool_use_response(id: "msg_1", tool_id: "tool_1"),
      calculator_tool_use_response(id: "msg_2", tool_id: "tool_2"),
      text_response(id: "msg_3", text: "Cannot calculate right now")
    )

    runner = @client.beta.messages.tool_runner(basic_params)
    runner.each_message do
      runner.params[:messages] << calculator_removal_message if _1.id == "msg_2"
    end

    assert_equal([{lhs: 10.0, rhs: 5.0, operator: :+}], @calculator.call_history)
    assert_pattern do
      tool_result_for(runner, "tool_1") => {is_error: false, content: "15.0"}
    end
    assert_not_found_result(tool_result_for(runner, "tool_2"))
  end

  # `feed_messages` swaps in a new messages array, so the runner skips that turn's dispatch
  # entirely and honors the removal from the following turn on.
  def test_tool_removal_via_feed_messages_blocks_the_following_turn
    stub_responses(
      calculator_tool_use_response(id: "msg_1", tool_id: "tool_1"),
      calculator_tool_use_response(id: "msg_2", tool_id: "tool_2"),
      text_response(id: "msg_3", text: "Cannot calculate right now")
    )

    runner = @client.beta.messages.tool_runner(basic_params)
    runner.each_message do
      runner.feed_messages(calculator_removal_message) if _1.id == "msg_1"
    end

    assert_empty(@calculator.call_history)
    assert_nil(tool_result_for(runner, "tool_1"))
    assert_not_found_result(tool_result_for(runner, "tool_2"))
  end

  # Reassigning `params` wholesale behaves like `feed_messages`: the replaced array skips the
  # current turn's dispatch and the removal governs the next one.
  def test_tool_removal_via_params_replacement_blocks_the_following_turn
    stub_responses(
      calculator_tool_use_response(id: "msg_1", tool_id: "tool_1"),
      calculator_tool_use_response(id: "msg_2", tool_id: "tool_2"),
      text_response(id: "msg_3", text: "Cannot calculate right now")
    )

    runner = @client.beta.messages.tool_runner(basic_params)
    runner.each_message do
      next unless _1.id == "msg_1"

      runner.params = {
        **runner.params,
        messages: [*runner.params[:messages], calculator_removal_message]
      }
    end

    assert_empty(@calculator.call_history)
    assert_nil(tool_result_for(runner, "tool_1"))
    assert_not_found_result(tool_result_for(runner, "tool_2"))
  end

  def test_in_place_appended_tool_addition_re_enables_removed_tool
    stub_responses(
      calculator_tool_use_response(id: "msg_1", tool_id: "tool_1"),
      calculator_tool_use_response(id: "msg_2", tool_id: "tool_2"),
      text_response(id: "msg_3", text: "10 + 5 = 15")
    )

    runner = @client.beta.messages.tool_runner(basic_params)
    runner.each_message do
      case _1.id
      when "msg_1"
        runner.params[:messages] << calculator_removal_message
      when "msg_2"
        runner.params[:messages] << calculator_addition_message
      end
    end

    assert_equal([{lhs: 10.0, rhs: 5.0, operator: :+}], @calculator.call_history)
    assert_not_found_result(tool_result_for(runner, "tool_1"))
    assert_pattern do
      tool_result_for(runner, "tool_2") => {is_error: false, content: "15.0"}
    end
  end
end
