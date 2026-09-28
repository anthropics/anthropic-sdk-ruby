# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Helpers::ToolRunner::CompactBeforeNextTurnTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  MESSAGES_URL = "http://localhost/v1/messages?beta=true"

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
    doc "Performs basic arithmetic operations"

    input_schema CalculatorInput

    attr_reader :call_history

    def initialize
      super
      @call_history = []
    end

    def call(expr)
      @call_history << expr.operator
      expr.lhs.public_send(expr.operator, expr.rhs)
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

  def json_response(id:, content:, stop_reason:)
    {
      status: 200,
      headers: {"Content-Type" => "application/json"},
      body: {
        id: id,
        type: "message",
        role: "assistant",
        model: "claude-3-7-sonnet-latest",
        content: content,
        stop_reason: stop_reason,
        usage: {input_tokens: 10, output_tokens: 20}
      }.to_json
    }
  end

  TOOL_USE = {
    type: "tool_use",
    id: "tool_1",
    name: "calculator",
    input: {lhs: 10.0, rhs: 5.0, operator: "+"}
  }.freeze
  TOOL_RESULT = {type: "tool_result", tool_use_id: "tool_1", content: "15.0", is_error: false}.freeze
  FINAL_TURN = {role: "assistant", content: [{type: "text", text: "10 + 5 = 15"}]}.freeze

  def tool_use_response(stop_reason: "tool_use")
    json_response(id: "msg_tool_use", content: [TOOL_USE], stop_reason:)
  end

  def text_response = json_response(id: "msg_text", content: FINAL_TURN[:content], stop_reason: "end_turn")

  def paused_response
    json_response(
      id: "msg_paused",
      content: [{type: "server_tool_use", id: "srvtoolu_1", name: "web_search", input: {query: "10 + 5"}}],
      stop_reason: "pause_turn"
    )
  end

  def compaction_block = {type: "compaction", content: "Summary so far.", signature: "sig_01"}

  def compacted_response(content: [compaction_block], stop_reason: "compaction")
    json_response(id: "msg_compacted", content:, stop_reason:)
  end

  # Without a summary the API sends no content, and the summarization call's own stop reason.
  def not_compacted_response = compacted_response(content: [], stop_reason: "max_tokens")

  def compaction_block_alone = [{role: "assistant", content: [compaction_block]}]

  # Records each request the runner sends, and answers with the given responses in order.
  def stub_responses(*responses)
    [].tap do |requests|
      stub_request(:post, MESSAGES_URL).to_return do |request|
        requests << request
        responses.fetch(requests.length - 1)
      end
    end
  end

  def bodies(requests) = requests.map { JSON.parse(_1.body, symbolize_names: true) }

  # The runner's messages the way they would be sent.
  def sent_form(messages)
    dumped = Anthropic::Internal::Type::Converter.dump(
      Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaMessageParam],
      messages
    )
    JSON.parse(dumped.to_json, symbolize_names: true)
  end

  def compact_on(runner, stop_reason, *compaction)
    [].tap do |messages|
      runner.each_message do |message|
        messages << message
        runner.compact_before_next_turn(*compaction) if message.stop_reason == stop_reason
      end
    end
  end

  def test_is_sent_after_the_tools_run
    # The second block is of a type this SDK version does not model.
    compacted = [compaction_block, {type: "mcp_tool_listing", mcp_server_name: "docs", tools: []}]
    requests = stub_responses(tool_use_response, compacted_response(content: compacted), text_response)
    context_management = {edits: [{type: :clear_tool_uses_20250919}]}

    runner = @client.beta.messages.tool_runner(
      {
        **basic_params,
        betas: ["compact-2026-09-04"],
        context_management:,
        # The compaction request is not a model turn, so both real turns still fit.
        max_iterations: 2
      }
    )
    messages = compact_on(runner, :tool_use, {type: :summarize, instructions: "Keep the numbers."})

    assert_equal([:tool_use, :compaction, :end_turn], messages.map(&:stop_reason))
    assert_pattern do
      messages[1].content => [Anthropic::Beta::BetaCompactionBlock[content: "Summary so far."], _]
    end
    assert_equal([:+], @calculator.call_history)

    first, compaction, after = bodies(requests)
    assert_equal({type: "summarize", instructions: "Keep the numbers."}, compaction[:compaction])
    refute_operator(compaction, :key?, :context_management)
    assert_equal(
      [
        {role: "user", content: "Calculate 10 + 5"},
        {role: "assistant", content: [TOOL_USE]},
        {role: "user", content: [TOOL_RESULT]}
      ],
      compaction[:messages]
    )

    assert_equal([{role: "assistant", content: compacted}], after[:messages])
    refute_operator(after, :key?, :compaction)
    assert_equal({edits: [{type: "clear_tool_uses_20250919"}]}, first[:context_management])
    assert_equal(first[:context_management], after[:context_management])
    # The beta is the caller's to pass; the runner sends what it was given and nothing more.
    assert_equal(["compact-2026-09-04"] * 3, requests.map { _1.headers["Anthropic-Beta"] })
  end

  def test_leaves_out_the_params_that_only_shape_a_reply
    format = {type: :json_schema, schema: {type: :object}}
    any_tool = Anthropic::Beta::BetaToolChoiceAny.new
    typed_fallback = Anthropic::Beta::BetaFallbackParam.new(
      model: "claude-haiku-4-5",
      output_config: Anthropic::Beta::BetaOutputConfig.new(format_: format)
    )
    reply_only = [:stop_sequences, :tool_choice, :output_config, :output_format, :fallbacks]

    [
      [
        {
          stop_sequences: ["STOP"],
          tool_choice: {type: :tool, name: "calculator"},
          output_config: {effort: :low, format:}
        },
        {output_config: {effort: "low"}}
      ],
      [{stop_sequences: ["STOP"], tool_choice: any_tool, output_format: format}, {}],
      [{tool_choice: {type: :auto}, output_config: {format:}}, {tool_choice: {type: "auto"}}],
      [
        {output_config: Anthropic::Beta::BetaOutputConfig.new(effort: :low, format_: format)},
        {output_config: {effort: "low"}}
      ],
      [
        {fallbacks: [{model: "claude-opus-4-1", output_config: {effort: :low, format:}}, typed_fallback]},
        {fallbacks: [{model: "claude-opus-4-1", output_config: {effort: "low"}}, {model: "claude-haiku-4-5"}]}
      ],
      [{fallbacks: :default}, {fallbacks: "default"}]
    ].each do |params, carried|
      WebMock.reset!
      requests = stub_responses(tool_use_response, compacted_response, text_response)

      runner = @client.beta.messages.tool_runner(
        {**basic_params, system_: "Be brief.", betas: ["compact-2026-09-04"], **params}
      )
      compact_on(runner, :tool_use)

      first, compaction, after = bodies(requests)
      assert_empty(params.keys - first.keys)
      assert_equal(first.except(:messages), after.except(:messages))
      assert_equal(carried, compaction.slice(*reply_only))
      assert_pattern do
        compaction => {
          compaction: {type: "summarize"},
          tools: [{name: "calculator"}],
          system: "Be brief.",
          max_tokens: 1024
        }
      end
      assert_equal(["compact-2026-09-04"] * 3, requests.map { _1.headers["Anthropic-Beta"] })
    end
  end

  def test_before_the_first_request_is_the_first_request
    requests = stub_responses(compacted_response, text_response)

    runner = @client.beta.messages.tool_runner(basic_params)
    # An edit made before the compaction request is part of what gets summarized.
    runner.feed_messages({role: :user, content: "And 10 - 5?"})
    runner.compact_before_next_turn
    messages = []
    runner.each_message { messages << _1 }

    assert_equal([:compaction, :end_turn], messages.map(&:stop_reason))
    compaction, after = bodies(requests)
    assert_equal({type: "summarize"}, compaction[:compaction])
    assert_equal(["Calculate 10 + 5", "And 10 - 5?"], compaction[:messages].map { _1[:content] })
    assert_equal(compaction_block_alone, after[:messages])
  end

  def test_calling_again_replaces_the_pending_compaction
    requests = stub_responses(tool_use_response, compacted_response, text_response)

    runner = @client.beta.messages.tool_runner(basic_params)
    runner.each_message do
      next unless _1.stop_reason == :tool_use

      runner.compact_before_next_turn({type: :summarize, instructions: "Keep the numbers."})
      runner.compact_before_next_turn({type: :summarize, instructions: "Keep the operator."})
    end

    assert_equal(
      [nil, {type: "summarize", instructions: "Keep the operator."}, nil],
      bodies(requests).map { _1[:compaction] }
    )
  end

  def test_waits_out_a_paused_turn
    requests = stub_responses(paused_response, tool_use_response, compacted_response, text_response)

    compact_on(@client.beta.messages.tool_runner(basic_params), :pause_turn)

    _, resumed, compaction, after = bodies(requests)
    refute_operator(resumed, :key?, :compaction)
    assert_pattern { resumed[:messages].last => {role: "assistant", content: [{type: "server_tool_use"}]} }
    assert_equal({type: "summarize"}, compaction[:compaction])
    assert_pattern { compaction[:messages].last => {role: "user", content: [{type: "tool_result"}]} }
    assert_equal(compaction_block_alone, after[:messages])
  end

  def test_on_the_final_turn_is_sent_before_stopping
    requests = stub_responses(text_response, compacted_response)

    # The final answer is also the last iteration allowed; the compaction still goes out.
    runner = @client.beta.messages.tool_runner({**basic_params, max_iterations: 1})
    messages = compact_on(runner, :end_turn)

    assert_equal([:end_turn, :compaction], messages.map(&:stop_reason))
    assert(runner.finished?)
    _, compaction = bodies(requests)
    assert_equal({type: "summarize"}, compaction[:compaction])
    assert_equal([{role: "user", content: "Calculate 10 + 5"}, FINAL_TURN], compaction[:messages])
    assert_equal(compaction_block_alone, sent_form(runner.params[:messages]))
  end

  def test_is_skipped_on_a_final_turn_with_tool_calls_that_never_ran
    requests = stub_responses(tool_use_response(stop_reason: "max_tokens"))

    runner = @client.beta.messages.tool_runner(basic_params)
    messages = nil
    _out, err = capture_io { messages = compact_on(runner, :max_tokens) }

    assert_equal([:max_tokens], messages.map(&:stop_reason))
    assert_equal(1, requests.length)
    assert_match(/pending compaction was skipped because the last turn \(stop_reason: :max_tokens\)/, err)
    assert_match(/Call `#compact_before_next_turn` again/, err)
    assert_empty(@calculator.call_history)
    assert_equal([{role: "user", content: "Calculate 10 + 5"}], sent_form(runner.params[:messages]))
    assert_nil(runner.next_message)
  end

  def test_is_dropped_when_max_iterations_ends_the_run_after_a_tool_turn
    requests = stub_responses(tool_use_response)

    _out, err = capture_io do
      compact_on(@client.beta.messages.tool_runner({**basic_params, max_iterations: 1}), :tool_use)
    end

    assert_equal(1, requests.length)
    refute_match(/pending compaction was skipped/, err)
  end

  def test_on_the_compaction_response_is_ignored
    # A fourth request would run out of stubbed responses and fail the test.
    requests = stub_responses(tool_use_response, compacted_response, text_response)

    runner = @client.beta.messages.tool_runner(basic_params)
    messages = []
    runner.each_message do
      messages << _1
      runner.compact_before_next_turn unless _1.stop_reason == :end_turn
    end

    assert_equal([:tool_use, :compaction, :end_turn], messages.map(&:stop_reason))
    assert_equal([nil, {type: "summarize"}, nil], bodies(requests).map { _1[:compaction] })
  end

  def test_without_a_summary_keeps_the_history_and_warns
    # A compaction that failed can also come back as a block without content.
    failed = compacted_response(content: [{type: "compaction", content: nil}])
    [not_compacted_response, failed].each do |not_compacted|
      WebMock.reset!
      requests = stub_responses(tool_use_response, not_compacted, text_response)

      runner = @client.beta.messages.tool_runner(basic_params)
      seen = 0
      _out, err = capture_io do
        # The second call is made on the compaction response, so it is ignored: no retry is sent.
        runner.each_message { runner.compact_before_next_turn if (seen += 1) <= 2 }
      end

      _, compaction, after = bodies(requests)
      assert_equal(3, requests.length)
      assert_equal(compaction[:messages], after[:messages])
      refute_operator(after, :key?, :compaction)
      assert_match(/\[anthropic-ruby\] Compaction produced no summary/, err)
    end
  end

  def test_messages_cannot_be_replaced_while_compacting
    requests = stub_responses(tool_use_response, compacted_response, text_response)

    runner = @client.beta.messages.tool_runner(basic_params)
    runner.each_message do |message|
      case message.stop_reason
      in :tool_use
        runner.compact_before_next_turn
      in :compaction
        error = assert_raises(ArgumentError) { runner.feed_messages({role: :user, content: "And 10 - 5?"}) }
        assert_match(/while the conversation is being compacted/, error.message)
        error = assert_raises(ArgumentError) { runner.params = {**runner.params, messages: []} }
        assert_match(/while the conversation is being compacted/, error.message)
        # Other params can still change, and the change is kept after the history is replaced.
        runner.params = {**runner.params, max_tokens: 2048}
        runner.params.update(temperature: 0.5)
      else
        nil
      end
    end

    after = bodies(requests)[2]
    assert_equal(compaction_block_alone, after[:messages])
    assert_equal(2048, after[:max_tokens])
    assert_equal(0.5, after[:temperature])
  end

  def test_a_failed_compaction_can_be_asked_for_again
    requests = stub_responses(
      tool_use_response,
      {status: 400, headers: {"Content-Type" => "application/json"}, body: {type: "error"}.to_json},
      compacted_response,
      text_response
    )

    runner = @client.beta.messages.tool_runner(basic_params)
    assert_raises(Anthropic::Errors::BadRequestError) { compact_on(runner, :tool_use) }
    runner.feed_messages({role: :user, content: "And 10 - 5?"})
    runner.compact_before_next_turn
    messages = []
    runner.each_message { messages << _1 }

    assert_equal([:compaction, :end_turn], messages.map(&:stop_reason))
    assert_equal(
      [nil, {type: "summarize"}, {type: "summarize"}, nil],
      bodies(requests).map { _1[:compaction] }
    )
  end

  def test_removed_compaction_control_option_is_refused
    error = assert_raises(ArgumentError) do
      @client.beta.messages.tool_runner({**basic_params, compaction_control: {enabled: true}})
    end

    assert_match(/`compaction_control` has been removed.*`#compact_before_next_turn`/, error.message)
  end

  def test_compaction_param_is_refused_on_a_tool_runner
    refusal =
      "`compaction` cannot be set on a tool runner: every request in the loop would compact again. " \
      "Call `#compact_before_next_turn` when the conversation should be compacted instead."
    requests = stub_responses(text_response)

    from_constructor = assert_raises(ArgumentError) do
      @client.beta.messages.tool_runner({**basic_params, compaction: {type: :summarize}})
    end
    runner = @client.beta.messages.tool_runner(basic_params)
    from_setter = assert_raises(ArgumentError) do
      runner.params = {**runner.params, compaction: {type: :summarize}}
    end
    # `#params` can also be edited in place, which is only seen when the next request is built.
    runner.params.update(compaction: {type: :summarize})
    from_request = assert_raises(ArgumentError) { runner.next_message }

    assert_equal([refusal] * 3, [from_constructor, from_setter, from_request].map(&:message))
    assert_empty(requests)
  end

  def test_is_refused_beside_a_compaction_edit
    requests = stub_responses(text_response)
    edits = {edits: [{type: :compact_20260112}]}

    [edits, Anthropic::Beta::BetaContextManagementConfig.new(**edits)].each do |context_management|
      runner = @client.beta.messages.tool_runner({**basic_params, context_management:})
      error = assert_raises(ArgumentError) { runner.compact_before_next_turn }
      assert_match(/`context_management` has a compaction edit/, error.message)
    end

    runner = @client.beta.messages.tool_runner(basic_params)
    # Nothing is due yet, so the edit is the caller's business.
    runner.params = {**runner.params, context_management: edits}
    runner.params = runner.params.except(:context_management)
    runner.compact_before_next_turn
    error = assert_raises(ArgumentError) { runner.params = {**runner.params, context_management: edits} }
    assert_match(/`context_management` has a compaction edit/, error.message)
    # `#params` can also be edited in place, which is only seen when the request would be sent.
    runner.params.update(context_management: edits)
    error = assert_raises(ArgumentError) { runner.next_message }
    assert_match(/`context_management` has a compaction edit/, error.message)
    assert_empty(requests)
  end

  def test_a_call_that_is_ignored_does_not_raise
    stub_responses(tool_use_response, compacted_response, text_response)

    runner = @client.beta.messages.tool_runner(basic_params)
    runner.each_message do |message|
      case message.stop_reason
      in :tool_use
        runner.compact_before_next_turn
      in :compaction
        runner.params.update(context_management: {edits: [{type: :compact_20260112}]})
        assert_nil(runner.compact_before_next_turn)
      else
        nil
      end
    end
  end

  def test_next_message_returns_the_compaction_response
    requests = stub_responses(tool_use_response, compacted_response, text_response, compacted_response)

    runner = @client.beta.messages.tool_runner(basic_params)
    assert_equal(:tool_use, runner.next_message.stop_reason)
    runner.compact_before_next_turn

    compacted = runner.next_message
    assert_equal(:compaction, compacted.stop_reason)
    assert_equal(2, requests.length)
    assert_equal(compaction_block_alone, sent_form(runner.params[:messages]))
    # Nothing has followed the compaction response yet, so there is nothing new to summarize.
    runner.compact_before_next_turn

    assert_equal(:end_turn, runner.next_message.stop_reason)
    assert_equal([nil, {type: "summarize"}, nil], bodies(requests).map { _1[:compaction] })
    assert_nil(runner.next_message)
    # The runner has been advanced since, so a new call counts again.
    runner.compact_before_next_turn
    assert_equal(:compaction, runner.next_message.stop_reason)
  end

  def test_next_message_sends_a_compaction_asked_for_after_the_final_message
    requests = stub_responses(text_response, compacted_response)

    runner = @client.beta.messages.tool_runner(basic_params)
    assert_equal(:end_turn, runner.next_message.stop_reason)
    assert(runner.finished?)
    runner.compact_before_next_turn

    assert_equal(:compaction, runner.next_message.stop_reason)
    assert(runner.finished?)
    assert_equal([{role: "user", content: "Calculate 10 + 5"}, FINAL_TURN], bodies(requests)[1][:messages])
    assert_equal(compaction_block_alone, sent_form(runner.params[:messages]))
    assert_nil(runner.next_message)
    assert_equal(2, requests.length)
  end

  def test_a_finished_runner_can_be_compacted_again
    requests = stub_responses(text_response, not_compacted_response, compacted_response)

    runner = @client.beta.messages.tool_runner(basic_params)
    capture_io { compact_on(runner, :end_turn) }
    runner.compact_before_next_turn({type: :summarize, instructions: "Keep the numbers."})
    messages = []
    runner.each_message { messages << _1 }

    assert_equal([:compaction], messages.map(&:stop_reason))
    _, first_try, second_try = bodies(requests)
    assert_equal({type: "summarize", instructions: "Keep the numbers."}, second_try[:compaction])
    # The final turn was added to the history once, by the first try.
    assert_equal(first_try[:messages], second_try[:messages])
    assert_equal(compaction_block_alone, sent_form(runner.params[:messages]))
  end

  def sse_response(content_block, stop_reason, *deltas)
    events = [
      {
        type: "message_start",
        message: {
          id: "msg_streamed",
          type: "message",
          role: "assistant",
          model: "claude-3-7-sonnet-latest",
          content: [],
          usage: {input_tokens: 10, output_tokens: 0}
        }
      },
      {type: "content_block_start", index: 0, content_block: content_block},
      *deltas.map { {type: "content_block_delta", index: 0, delta: _1} },
      {type: "content_block_stop", index: 0},
      {type: "message_delta", delta: {stop_reason:}, usage: {output_tokens: 20}},
      {type: "message_stop"}
    ]
    {
      status: 200,
      headers: {"content-type" => "text/event-stream"},
      body: events.map { "event: #{_1[:type]}\ndata: #{_1.to_json}\n\n" }.join
    }
  end

  def streamed_responses
    [
      sse_response(
        {**TOOL_USE, input: {}},
        "tool_use",
        {type: "input_json_delta", partial_json: TOOL_USE[:input].to_json}
      ),
      # A compaction block arrives whole on the start event; there is no delta for it.
      sse_response(compaction_block, "compaction"),
      sse_response({type: "text", text: ""}, "end_turn", {type: "text_delta", text: "10 + 5 = 15"})
    ]
  end

  def test_when_streaming
    requests = stub_responses(*streamed_responses)

    runner = @client.beta.messages.tool_runner(basic_params)
    stop_reasons = []
    runner.each_streaming do |stream|
      stream.until_done
      stop_reasons << stream.accumulated_message.stop_reason
      runner.compact_before_next_turn unless stop_reasons.last == :end_turn
    end

    assert_equal([:tool_use, :compaction, :end_turn], stop_reasons)
    _, compaction, after = bodies(requests)
    assert_equal({type: "summarize"}, compaction[:compaction])
    assert_equal(true, compaction[:stream])
    assert_pattern { compaction[:messages].last => {role: "user", content: [{type: "tool_result"}]} }
    assert_equal(compaction_block_alone, after[:messages])
    refute_operator(after, :key?, :compaction)
  end

  def test_on_the_final_turn_when_streaming
    requests = stub_responses(streamed_responses.last, streamed_responses[1])

    runner = @client.beta.messages.tool_runner(basic_params)
    stop_reasons = []
    returned = runner.each_streaming do |stream|
      stop_reasons << stream.accumulated_message.stop_reason
      runner.compact_before_next_turn
    end

    assert_nil(returned)
    assert_equal([:end_turn, :compaction], stop_reasons)
    assert_equal([{role: "user", content: "Calculate 10 + 5"}, FINAL_TURN], bodies(requests)[1][:messages])
    assert_equal(compaction_block_alone, sent_form(runner.params[:messages]))
  end
end
