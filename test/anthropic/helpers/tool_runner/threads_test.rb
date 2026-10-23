# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../support/served_messages"

class Anthropic::Test::Helpers::ToolRunner::ThreadsTest < Minitest::Test
  extend Minitest::Serial
  include Anthropic::Test::ServedMessages

  ANY_PATH = %r{\Ahttp://localhost/}

  def setup
    super
    @adder = Adder.new
  end

  class AdderInput < Anthropic::BaseModel
    required :lhs, Integer
    required :rhs, Integer
  end

  class Adder < Anthropic::BaseTool
    doc "Adds two numbers"

    input_schema AdderInput

    attr_reader :calls

    def initialize
      super
      @calls = []
    end

    def call(input)
      @calls << [input.lhs, input.rhs]
      input.lhs + input.rhs
    end
  end

  def call_tool(id, tool_id = "toolu_#{id}", name: "adder", stop_reason: "tool_use", **)
    json(
      reply_body(id, [{type: "tool_use", id: tool_id, name: name, input: {lhs: 1, rhs: 2}}], stop_reason, **)
    )
  end

  def text(id, text = "done", stop_reason: "end_turn")
    json(reply_body(id, [{type: "text", text: text}], stop_reason))
  end

  def api_error(status, code, **details)
    error = {type: "invalid_request_error", message: "no", details: {error_code: code, **details}}
    {status: status, headers: {"Content-Type" => "application/json"}, body: {type: "error", error: error}.to_json}
  end

  def stream_events(id, block, stop_reason, deltas)
    [
      {type: "message_start", message: reply_body(id, [], nil)},
      {type: "content_block_start", index: 0, content_block: block},
      *deltas.map { {type: "content_block_delta", index: 0, delta: _1} },
      {type: "content_block_stop", index: 0},
      {type: "message_delta", delta: {stop_reason: stop_reason, stop_sequence: nil}, usage: {output_tokens: 2}},
      {type: "message_stop"}
    ]
  end

  def tool_events(id)
    block = {type: "tool_use", id: "toolu_#{id}", name: "adder", input: {}}
    stream_events(id, block, "tool_use", [{type: "input_json_delta", partial_json: "{\"lhs\":1,\"rhs\":2}"}])
  end

  def text_events(id, text = "done", stop_reason: "end_turn")
    stream_events(id, {type: "text", text: ""}, stop_reason, [{type: "text_delta", text: text}])
  end

  def start_over
    super
    @adder.calls.clear
  end

  def threads = bodies.map { _1[:thread] }

  def result_wire(id, content = "3")
    {role: "user", content: [{type: "tool_result", tool_use_id: "toolu_#{id}", content: content, is_error: false}]}
  end

  def tool_use_wire(*ids)
    content = ids.map { {id: "toolu_#{_1}", input: {lhs: 1, rhs: 2}, name: "adder", type: "tool_use"} }
    {role: "assistant", content: content}
  end

  def text_wire(text = "done") = {role: "assistant", content: [{text: text, type: "text"}]}

  def params(**overrides)
    {model: "claude-sonnet-4-5", max_tokens: 16, messages: [user("add")], tools: [@adder], **overrides}
  end

  def new_runner(client: @client, **) = client.beta.messages.tool_runner(params(**))

  def run_all(runner) = [].tap { |seen| runner.each_message { seen << _1 } }

  # A thread with the given messages staged.
  def new_thread(*staged, **)
    @client.beta.messages.thread(**params(messages: [], **)).tap { _1.append(*staged) }
  end

  def held_by(thread) = JSON.parse(thread.messages.to_json, symbolize_names: true)

  def test_threads_by_default
    [{}, {thread: nil}].each do |thread|
      start_over
      serve(call_tool("msg_1"), call_tool("msg_2"), text("msg_3"))

      messages = run_all(new_runner(system_: "s", request_options: {extra_headers: {"X-One" => "1"}}, **thread))

      assert_equal(%w[msg_1 msg_2 msg_3], messages.map(&:id))
      assert_equal([{type: "create"}, continue_from("msg_1"), continue_from("msg_2")], threads)
      assert_equal([[user_wire("add")], [result_wire("msg_1")], [result_wire("msg_2")]], bodies.map { _1[:messages] })
      assert_equal([[:system, :tools], [], []], bodies.map { (_1.keys & [:system, :tools]).sort })
      assert_equal([[THREADS_BETA]] * 3, [0, 1, 2].map { betas(_1) })
      assert_equal(["BetaToolRunner, message-thread"] * 3, helper_headers)
      assert_equal(["1"] * 3, @requests.map { _1[:headers]["X-One"] })
      assert_equal([[1, 2], [1, 2]], @adder.calls)
    end
  end

  def test_thread_false_opts_out
    serve(call_tool("msg_1"), text("msg_2"))

    run_all(new_runner(thread: false, betas: ["other-beta"]))

    assert_equal([nil, nil], threads)
    assert_equal([1, 3], bodies.map { _1[:messages].length })
    assert_equal([true, true], bodies.map { _1.key?(:tools) })
    assert_equal([%w[other-beta]] * 2, [0, 1].map { betas(_1) })
    assert_equal(["BetaToolRunner"] * 2, helper_headers)
  end

  def test_params_given_twice_keep_thread_false
    serve(text("msg_1"), text("msg_2"))
    options = params(thread: false)

    2.times { run_all(@client.beta.messages.tool_runner(options)) }

    assert_equal([nil, nil], threads)
  end

  def test_a_thread_value_of_the_caller_is_rejected
    serve
    typed = Anthropic::Beta::BetaThreadContinueParams.new(previous_message_id: "msg_0")
    [{type: :create}, continue_from("msg_0"), typed].each do |thread|
      error = assert_raises(ArgumentError) { new_runner(thread: thread) }
      assert_includes(error.message, "The runner sets `thread` for each request itself.")
    end
    assert_empty(@requests)
  end

  def runners_with_and_without_a_thread
    {"thread" => {}, "thread: false" => {thread: false}, **clients_without_threads}
  end

  def test_a_thread_value_set_on_the_runner_is_rejected
    typed = Anthropic::Beta::BetaThreadContinueParams.new(previous_message_id: "msg_0")
    runners_with_and_without_a_thread.each do |name, options|
      [{type: :create}, continue_from("msg_0"), typed, false].each do |thread|
        start_over
        serve(url: ANY_PATH)
        runner = new_runner(**options)

        error = assert_raises(ArgumentError, name) { runner.params = {**runner.params, thread: thread} }

        assert_includes(error.message, "The runner sets `thread` for each request itself.", name)
        refute(runner.params.key?(:thread), name)
        assert_empty(@requests, name)
      end
    end
  end

  def test_a_thread_value_put_into_the_params_of_the_runner_is_rejected
    runners_with_and_without_a_thread.each do |name, options|
      start_over
      serve(url: ANY_PATH)
      runner = new_runner(**options)
      runner.params[:thread] = {type: :create}

      assert_raises(ArgumentError, name) { run_all(runner) }

      assert_empty(@requests, name)
    end
  end

  def test_a_thread_value_set_during_a_run_is_rejected
    runners_with_and_without_a_thread.each do |name, options|
      start_over
      serve(call_tool("msg_1"), url: ANY_PATH)
      runner = new_runner(**options)

      assert_raises(ArgumentError, name) do
        runner.each_message { runner.params = {**runner.params, thread: {type: :create}} }
      end

      assert_equal(1, @requests.length, name)
      assert_empty(@adder.calls, name)
    end
  end

  def test_a_nil_thread_set_on_the_runner_counts_as_unset
    expected = {"thread" => [{type: "create"}, continue_from("msg_1")], "thread: false" => [nil, nil]}
    runners_with_and_without_a_thread.slice(*expected.keys).each do |name, options|
      start_over
      serve(call_tool("msg_1"), text("msg_2"))
      runner = new_runner(**options)
      runner.params = {**runner.params, thread: nil}

      run_all(runner)

      assert_equal(expected.fetch(name), threads, name)
    end
  end

  def test_paused_turn_resumes_with_no_messages
    serve(text("msg_1", stop_reason: "pause_turn"), text("msg_2"))

    run_all(new_runner)

    assert_equal([[], continue_from("msg_1")], bodies[1].values_at(:messages, :thread))
  end

  def test_thread_gone_mid_loop_replays
    serve(call_tool("msg_1"), api_error(404, "thread_not_found"), text("msg_2"))

    run_all(new_runner)

    assert_equal([{type: "create"}, continue_from("msg_1"), {type: "create"}], threads)
    assert_equal([user_wire("add"), tool_use_wire("msg_1"), result_wire("msg_1")], bodies[2][:messages])
    assert_equal([[1, 2]], @adder.calls)
  end

  def test_thread_gone_right_after_a_replay_continues_unthreaded
    not_found = api_error(404, "thread_not_found")
    serve(call_tool("msg_1"), not_found, call_tool("msg_2"), not_found, call_tool("msg_3"), text("msg_4"))

    run_all(new_runner)

    assert_equal([{type: "create"}, continue_from("msg_1"), {type: "create"}, continue_from("msg_2"), nil, nil], threads)
    assert_equal([1, 1, 3, 1, 5, 7], bodies.map { _1[:messages].length })
    assert_equal([true, true], bodies.last(2).map { _1.key?(:tools) })
  end

  def test_unsupported_request_continues_unthreaded
    serve(api_error(400, "thread_unsupported_request"), call_tool("msg_1"), text("msg_2"))

    run_all(new_runner)

    assert_equal([{type: "create"}, nil, nil], threads)
    assert_equal([1, 1, 3], bodies.map { _1[:messages].length })
    assert_empty(betas(2))
  end

  def test_a_runner_that_stopped_threading_drops_the_cache_markers_of_the_recorded_messages
    block = {type: "text", text: "add"}
    marked = {role: "user", content: [{**block, cache_control: {type: "ephemeral"}}]}
    rest = [tool_use_wire("msg_1"), result_wire("msg_1")]
    serve(api_error(400, "thread_unsupported_request"), call_tool("msg_1"), text("msg_2"), call_tool("msg_1"), text("msg_2"))

    run_all(new_runner(messages: [marked]))
    run_all(new_runner(messages: [marked], thread: false))

    assert_equal([[marked], [{role: "user", content: [block]}, *rest]], bodies[1..2].map { _1[:messages] })
    assert_equal([[marked], [marked, *rest]], bodies[3..4].map { _1[:messages] })
  end

  def test_runner_over_a_thread_continues_it
    serve(text("msg_1", "hello"), call_tool("msg_2"), text("msg_3"), text("msg_4"))
    thread = new_thread(system_: "s", request_options: {extra_headers: {"X-One" => "1"}})
    thread.send_message(user("hi"))
    thread.append(user("add"))

    runner = thread.tool_runner
    assert_equal(1, @requests.length)
    messages = run_all(runner)
    thread.send_message(user("thanks"))

    assert_equal(%w[msg_2 msg_3], messages.map(&:id))
    assert_equal([{type: "create"}, continue_from("msg_1"), continue_from("msg_2"), continue_from("msg_3")], threads)
    assert_equal([[user_wire("add")], [result_wire("msg_2")], [user_wire("thanks")]], bodies.drop(1).map { _1[:messages] })
    runner_on_a_thread = "BetaToolRunner, message-thread"
    assert_equal(["message-thread", runner_on_a_thread, runner_on_a_thread, "message-thread"], helper_headers)
    assert_equal(["1"] * 4, @requests.map { _1[:headers]["X-One"] })
    assert_equal(%w[user assistant user assistant user assistant user assistant], thread.messages.map { _1[:role].to_s })
  end

  def test_a_run_that_stops_at_its_limit_leaves_the_tool_results_on_the_thread
    container = {id: "cont_1", expires_at: "2026-01-01T00:00:00Z"}
    runs = {
      call_tool("msg_1", container:) => ->(runner) { run_all(runner) },
      sse(*tool_events("msg_1").tap { _1.first[:message][:container] = container }) => :run_until_finished.to_proc
    }
    runs.each do |reply, run|
      start_over
      serve(reply, text("msg_2"))
      thread = new_thread(user("add"))

      run.call(thread.tool_runner(max_iterations: 1))
      held = held_by(thread)
      thread.send_message(user("more"))

      assert_equal([[1, 2]], @adder.calls)
      assert_equal([user_wire("add"), tool_use_wire("msg_1"), result_wire("msg_1")], held)
      assert_equal([continue_from("msg_1"), [result_wire("msg_1"), user_wire("more")]], bodies[1].values_at(:thread, :messages))
      assert_equal("cont_1", bodies[1][:container])
    end
  end

  def test_a_refusal_ends_the_run_and_leaves_the_tool_results_on_the_thread
    runs = {
      [call_tool("msg_1"), text("msg_2", "no", stop_reason: "refusal")] => ->(runner) { run_all(runner) },
      [sse(*tool_events("msg_1")), sse(*text_events("msg_2", "no", stop_reason: "refusal"))] => :run_until_finished.to_proc
    }
    runs.each do |replies, run|
      start_over
      serve(*replies, text("msg_3"))
      thread = new_thread(user("add"), system_: "s")

      messages = run.call(runner = thread.tool_runner)
      held = held_by(thread)
      thread.send_message(user("more"))

      assert_equal([%w[msg_1 msg_2], :refusal], [messages.map(&:id), messages.last.stop_reason])
      assert_predicate(runner, :finished?)
      assert_equal([continue_from("msg_1"), [result_wire("msg_1")]], bodies[1].values_at(:thread, :messages))
      assert_equal([user_wire("add"), tool_use_wire("msg_1"), result_wire("msg_1")], held)
      assert_equal([{type: "create"}, "s", 1], [bodies[2][:thread], bodies[2][:system], bodies[2][:tools].length])
      assert_equal([*held, user_wire("more")], bodies[2][:messages])
    end
  end

  def test_a_reply_of_a_fallback_model_starts_a_new_thread_and_changes_no_param
    serve(call_tool("msg_1", iterations: written_by_fallback("claude-b")), call_tool("msg_2"), text("msg_3"))
    runner = new_runner(system_: "s", fallbacks: [{model: "claude-b"}], betas: ["server-side-fallback-2026-07-01"])

    messages = run_all(runner)

    assert_equal(%w[msg_1 msg_2 msg_3], messages.map(&:id))
    assert_equal([{type: "create"}, {type: "create"}, continue_from("msg_2")], threads)
    assert_equal([["claude-sonnet-4-5", [{model: "claude-b"}]]] * 3, bodies.map { _1.values_at(:model, :fallbacks) })
    assert_equal([user_wire("add"), tool_use_wire("msg_1"), result_wire("msg_1")], bodies[1][:messages])
    assert_equal(["s", 1], [bodies[1][:system], bodies[1][:tools].length])
    assert_equal([result_wire("msg_2")], bodies[2][:messages])
    assert_equal(["claude-sonnet-4-5", [{model: "claude-b"}]], runner.params.to_h.values_at(:model, :fallbacks))
  end

  def test_runner_over_a_thread_sends_a_cut_off_turn_again
    serve(sse(*text_events("msg_1", "par").first(3)), call_tool("msg_2"), text("msg_3"))
    thread = new_thread
    thread.stream(user("add")).until_done

    run_all(thread.tool_runner)

    assert_equal([{type: "create"}, {type: "create"}, continue_from("msg_2")], threads)
    assert_equal([[user_wire("add")], [result_wire("msg_2")]], bodies.drop(1).map { _1[:messages] })
  end

  def test_runner_over_a_thread_uses_its_unsupported_request_behavior
    unsupported = api_error(400, "thread_unsupported_request")
    serve(unsupported, unsupported, text("msg_1"))
    strict = new_thread(user("add"))
    lenient = new_thread(user("add"), unsupported_request_behavior: :continue_unthreaded)

    assert_raises(Anthropic::Errors::BadRequestError) { run_all(strict.tool_runner) }
    run_all(lenient.tool_runner)

    assert_equal([{type: "create"}, {type: "create"}, nil], threads)
    assert_equal([false] * 3, bodies.map { _1.key?(:unsupported_request_behavior) })
  end

  def test_runner_over_a_fork_runs_the_original_tools
    serve(call_tool("msg_1"), text("msg_2"))
    fork = new_thread.fork
    fork.append(user("add"))

    run_all(fork.tool_runner)

    assert_equal([{type: "create"}, continue_from("msg_1")], threads)
    assert_equal([["adder"], [[1, 2]]], [bodies[0][:tools].map { _1[:name] }, @adder.calls])
  end

  # The settings of a runner, and the responses that it gets ahead of its first reply.
  def runner_modes
    {
      default: [{}, []],
      opted_out: [{thread: false}, []],
      sends_the_whole_history: [{}, [api_error(400, "thread_unsupported_request")]]
    }
  end

  def served(id, blocks, stop_reason, streaming:)
    return json(reply_body(id, blocks, stop_reason)) unless streaming

    start, *, delta, stop = stream_events(id, {}, stop_reason, [])
    events = blocks.each_with_index.flat_map do |block, index|
      empty, filled =
        case block
        in {type: "text", text:} then [{text: ""}, {type: "text_delta", text:}]
        in {type: "tool_use", input:} then [{input: {}}, {type: "input_json_delta", partial_json: input.to_json}]
        end
      [
        {type: "content_block_start", index:, content_block: {**block, **empty}},
        {type: "content_block_delta", index:, delta: filled},
        {type: "content_block_stop", index:}
      ]
    end
    sse(start, *events, delta, stop)
  end

  def calls(*ids)
    [ids.map { {type: "tool_use", id: "toolu_#{_1}", name: "adder", input: {lhs: 1, rhs: 2}} }, "tool_use"]
  end

  def final = [[{type: "text", text: "done"}], "end_turn"]

  # Runs each loop that takes a block in each mode, and yields the mode, the runner and the
  # requests that were answered with `replies`.
  def in_every_mode(replies, on_first_reply, modes: runner_modes, **)
    modes.each do |mode, (settings, rejections)|
      [false, true].each do |streaming|
        start_over
        serve(*rejections, *replies.each_with_index.map { served("msg_#{_2 + 1}", *_1, streaming:) })
        runner = new_runner(**settings, **)
        handle = ->(reply) { on_first_reply.call(runner, reply) if reply.id == "msg_1" }

        streaming ? runner.each_streaming { handle.call(_1.accumulated_message) } : runner.each_message(&handle)

        yield(mode, runner, bodies.drop(rejections.length))
      end
    end
  end

  def turn(reply) = {role: :assistant, content: reply.content}

  def own_result(id, **)
    {role: :user, content: [{type: :tool_result, tool_use_id: "toolu_#{id}", content: "mine", **}]}
  end

  def own_result_wire(...) = JSON.parse(own_result(...).to_json, symbolize_names: true)

  def test_messages_replaced_while_handling_a_reply_are_sent_as_they_are
    answered = [user_wire("add"), tool_use_wire("msg_1"), own_result_wire("msg_1")]
    set = ->(runner, *messages) { runner.params = {**runner.params, messages:} }
    cases = [
      [answered, ->(runner, reply) { runner.feed_messages(turn(reply), own_result("msg_1")) }],
      [answered, ->(runner, reply) { runner.params[:messages] = [user("add"), turn(reply), own_result("msg_1")] }],
      [answered, ->(runner, reply) { set.call(runner, user("add"), turn(reply), own_result("msg_1")) }],
      [
        [*answered.first(2), own_result_wire("msg_1", is_error: true)],
        ->(runner, reply) { runner.feed_messages(turn(reply), own_result("msg_1", is_error: true)) }
      ],
      [[user_wire("add"), own_result_wire("msg_1")], ->(runner, _) { runner.feed_messages(own_result("msg_1")) }],
      [[user_wire("add"), user_wire("more")], ->(runner, _) { runner.feed_messages(user("more")) }],
      [[user_wire("add")], ->(runner, _) { runner.feed_messages }],
      [[user_wire("over")], ->(runner, _) { set.call(runner, user("over")) }],
      [
        [user_wire("context"), user_wire("add")],
        ->(runner, _) { set.call(runner, user("context"), *runner.params[:messages]) }
      ],
      [
        [user_wire("again"), *answered.last(2)],
        ->(runner, reply) { set.call(runner, user("again"), turn(reply), own_result("msg_1")) }
      ]
    ]
    cases.each do |conversation, replace|
      in_every_mode([calls("msg_1"), final], replace) do |mode, runner, requests|
        assert_equal(2, requests.length)
        assert_empty(@adder.calls)
        assert_equal(conversation.length, runner.params[:messages].length)
        expected =
          case mode
          in :default if conversation.first(2) == answered.first(2)
            [continue_from("msg_1"), conversation.drop(2)]
          in :default
            [{type: "create"}, conversation]
          else
            [nil, conversation]
          end
        assert_equal(expected, requests[1].values_at(:thread, :messages))
      end
    end
  end

  def test_an_answer_to_one_of_two_calls_is_sent_as_it_is
    answer_one = ->(runner, reply) { runner.feed_messages(turn(reply), own_result("one")) }

    in_every_mode([calls("one", "two"), final], answer_one) do |mode, _, requests|
      assert_equal(2, requests.length)
      assert_empty(@adder.calls)
      held = mode == :default ? [] : [user_wire("add"), tool_use_wire("one", "two")]
      assert_equal([*held, own_result_wire("one")], requests[1][:messages])
    end
  end

  def test_a_turn_whose_messages_were_replaced_is_not_counted
    answer = ->(runner, reply) { runner.feed_messages(turn(reply), own_result("msg_1")) }

    in_every_mode([calls("msg_1"), calls("msg_2")], answer, max_iterations: 1) do |_, runner, requests|
      assert_equal(2, requests.length)
      assert_equal([[1, 2]], @adder.calls)
      assert_equal(5, runner.params[:messages].length)
    end
  end

  def test_messages_edited_in_place_while_handling_a_reply_are_followed_by_the_turn
    the_turn = [tool_use_wire("msg_1"), result_wire("msg_1")]
    {
      [user_wire("add"), user_wire("more")] => ->(runner, _) { runner.params[:messages] << user("more") },
      [user_wire("context"), user_wire("add")] => ->(runner, _) { runner.params[:messages].unshift(user("context")) },
      [user_wire("again")] => ->(runner, _) { runner.params[:messages][0][:content] = "again" }
    }.each do |edited, edit|
      in_every_mode([calls("msg_1"), final], edit) do |mode, _, requests|
        assert_equal([[1, 2]], @adder.calls)
        thread = mode == :default ? {type: "create"} : nil
        assert_equal([thread, [*edited, *the_turn]], requests[1].values_at(:thread, :messages))
      end
    end
  end

  def test_the_turn_is_kept_as_typed_blocks_and_tool_calls_that_can_be_edited
    said_and_called = [[{type: "text", text: "sure"}, *calls("msg_1").first], "tool_use"]

    in_every_mode([said_and_called, final], ->(*) {}) do |mode, runner, requests|
      assert_equal(mode == :default ? continue_from("msg_1") : nil, requests[1][:thread])
      kept = runner.params[:messages][1]
      assert_pattern { kept => {role: :assistant, content: [Anthropic::Beta::BetaTextBlock, Hash]} }
      assert_equal("sure", kept[:content].first.text)
      kept[:content].last[:cache_control] = {type: :ephemeral}
      kept[:content] << {type: :text, text: "more"}
      assert_equal(3, runner.params[:messages][1][:content].length)
    end
  end

  def test_frozen_messages_are_sent_when_no_tool_is_called
    in_every_mode([final], ->(*) {}, messages: [user("add")].freeze) do |_, runner, requests|
      assert_equal([[user_wire("add")]], requests.map { _1[:messages] })
      assert_predicate(runner, :finished?)
    end
  end

  def test_messages_appended_to_the_thread_during_a_run_go_out_with_the_next_request
    before_the_run = lambda do |thread, runner|
      thread.append(user("more"))
      run_all(runner)
    end
    in_a_block = ->(thread, runner) { runner.each_message { thread.append(user("more")) if _1.id == "msg_1" } }
    between_steps = lambda do |thread, runner|
      runner.next_message
      thread.append(user("more"))
      runner.next_message
    end
    after_the_results = [[user_wire("add")], [result_wire("msg_1"), user_wire("more")]]
    {
      before_the_run => [[user_wire("add"), user_wire("more")], [result_wire("msg_1")]],
      in_a_block => after_the_results,
      between_steps => after_the_results
    }.each do |run, sent|
      start_over
      serve(call_tool("msg_1"), text("msg_2"))
      thread = new_thread(user("add"))

      run.call(thread, thread.tool_runner)

      assert_equal(sent, bodies.map { _1[:messages] })
      assert_equal([{type: "create"}, continue_from("msg_1")], threads)
      assert_equal(1, thread.messages.count { _1[:content] == "more" })
    end
  end

  def paused(id) = text(id, "wait", stop_reason: "pause_turn")

  def paused_events(id) = text_events(id, "wait", stop_reason: "pause_turn")

  # Each way to run a runner and append a message to its thread once the reply with the given id
  # is there, with whether the replies are streamed.
  def ways_to_append(texts)
    append = ->(thread, reply) { thread.append(user(texts.fetch(reply.id))) if texts.key?(reply.id) }
    {
      ->(thread, runner) { runner.each_message { append.call(thread, _1) } } => false,
      ->(thread, runner) { runner.each_streaming { append.call(thread, _1.accumulated_message) } } => true,
      lambda do |thread, runner|
        while (reply = runner.next_message)
          append.call(thread, reply)
        end
      end => false
    }
  end

  def test_a_message_appended_to_the_thread_on_a_paused_reply_goes_out_with_the_request_that_resumes_it
    replies = {
      false => [paused("msg_1"), call_tool("msg_2"), text("msg_3")],
      true => [sse(*paused_events("msg_1")), sse(*tool_events("msg_2")), sse(*text_events("msg_3"))]
    }
    ways_to_append("msg_1" => "more", "msg_2" => "again").each do |run, streaming|
      start_over
      serve(*replies.fetch(streaming))
      thread = new_thread(user("add"))

      run.call(thread, thread.tool_runner)

      assert_equal([{type: "create"}, continue_from("msg_1"), continue_from("msg_2")], threads)
      assert_equal(
        [[user_wire("add")], [user_wire("more")], [result_wire("msg_2"), user_wire("again")]],
        bodies.map { _1[:messages] }
      )
    end
  end

  def test_a_message_appended_to_the_thread_on_a_paused_reply_stays_staged_when_the_run_stops_there
    serve(paused("msg_1"))
    thread = new_thread(user("add"))

    thread.tool_runner(max_iterations: 1).each_message { thread.append(user("more")) }

    assert_equal([1, [user_wire("add"), text_wire("wait"), user_wire("more")]], [@requests.length, held_by(thread)])
  end

  def test_params_set_replace_the_earlier_ones
    serve(call_tool("msg_1"), text("msg_2"))
    runner = new_runner(inference_geo: "us", request_options: {extra_headers: {"X-One" => "1"}})

    runner.each_message do
      next unless _1.id == "msg_1"
      runner.params = {**runner.params.except(:inference_geo, :request_options), max_tokens: 32}
    end

    assert_equal([32, false, nil], [bodies[1][:max_tokens], bodies[1].key?(:inference_geo), @requests[1][:headers]["X-One"]])
    assert_equal([continue_from("msg_1"), [result_wire("msg_1")]], bodies[1].values_at(:thread, :messages))
  end

  def test_a_typed_message_set_again_as_a_hash_keeps_the_thread
    serve(call_tool("msg_1"), text("msg_2"))
    runner = new_runner(messages: [Anthropic::Beta::BetaUserMessageParam.new(content: "add")])

    runner.each_message do
      next unless _1.id == "msg_1"
      runner.params = {**runner.params, messages: [user("add"), turn(_1), own_result("msg_1")]}
    end

    assert_equal([continue_from("msg_1"), [own_result_wire("msg_1")]], bodies[1].values_at(:thread, :messages))
  end

  def test_changed_system_or_tools_is_refused_before_a_tool_runs
    {system_: "two", tools: [@adder, {name: "other", input_schema: {type: "object"}}]}.each do |field, changed|
      start_over
      serve(call_tool("msg_1"))
      runner = new_runner(system_: "one")

      error = assert_raises(Anthropic::Errors::Error) do
        runner.each_message { runner.params = {**runner.params, field => changed} }
      end

      assert_includes(error.message, "Cannot change `#{field}` on a thread")
      assert_equal(field == :tools, error.message.end_with?("send `tool_addition` or `tool_removal` blocks in a `system` message."))
      assert_equal([1, []], [@requests.length, @adder.calls])
    end
  end

  # Each way to replace the messages of a runner while it handles a reply, with what it leaves.
  def ways_to_replace_the_messages
    {
      ->(runner, _) { runner.feed_messages(user("more")) } => [user_wire("add"), user_wire("more")],
      ->(runner, _) { runner.feed_messages } => [user_wire("add")],
      ->(runner, _) { runner.params[:messages] = [user("over")] } => [user_wire("over")],
      ->(runner, reply) { runner.feed_messages(turn(reply), own_result("msg_1")) } =>
        [user_wire("add"), tool_use_wire("msg_1"), own_result_wire("msg_1")]
    }
  end

  def changed_fields = {system_: "two", tools: [@adder, {name: "other", input_schema: {type: "object"}}]}

  def test_changed_system_or_tools_is_refused_when_the_messages_are_replaced_too
    ways_to_replace_the_messages.keys.product(changed_fields.to_a, [false, true]) do |replace, (field, changed), streaming|
      start_over
      serve(served("msg_1", *calls("msg_1"), streaming:))
      runner = new_runner(system_: "one")
      handle = lambda do |reply|
        replace.call(runner, reply)
        runner.params[field] = changed
      end

      error = assert_raises(Anthropic::Errors::Error) do
        streaming ? runner.each_streaming { handle.call(_1.accumulated_message) } : runner.each_message(&handle)
      end

      assert_includes(error.message, "Cannot change `#{field}` on a thread")
      assert_equal([1, []], [@requests.length, @adder.calls])
    end
  end

  def test_changed_system_or_tools_is_refused_when_the_messages_are_replaced_between_steps
    serve(call_tool("msg_1"))
    runner = new_runner(system_: "one")
    runner.next_message
    runner.params = {**runner.params, messages: [user("over")], system_: "two"}

    error = assert_raises(Anthropic::Errors::Error) { runner.next_message }

    assert_includes(error.message, "Cannot change `system_` on a thread")
    assert_equal(1, @requests.length)
  end

  def test_system_and_tools_change_with_the_messages_on_a_runner_that_sends_the_whole_history
    ways_to_replace_the_messages.to_a.product(changed_fields.to_a) do |(replace, conversation), (field, changed)|
      change = lambda do |runner, reply|
        replace.call(runner, reply)
        runner.params[field] = changed
      end

      in_every_mode([calls("msg_1"), final], change, modes: runner_modes.except(:default), system_: "one") do |_, _, requests|
        assert_empty(@adder.calls)
        assert_equal(conversation, requests[1][:messages])
        sent = [requests[1][:system], requests[1][:tools].map { _1[:name] }]
        assert_equal(field == :system_ ? ["two", %w[adder]] : ["one", %w[adder other]], sent)
      end
    end
  end

  def compaction_reply(id) = json(reply_body(id, [{type: "compaction", content: "summary"}], "compaction"))

  def test_a_compaction_costs_one_rejected_request_and_stops_the_runner_threading
    serve(call_tool("msg_1"), api_error(400, "thread_unsupported_request"), compaction_reply("msg_c"), text("msg_2"))
    runner = new_runner(betas: ["compact-2026-09-04"])

    runner.each_message { runner.compact_before_next_turn if _1.id == "msg_1" }

    assert_equal([{type: "create"}, {type: "create"}, nil, nil], threads)
    assert_equal([false, true, true, false], bodies.map { _1.key?(:compaction) })
    assert_equal([user_wire("add"), tool_use_wire("msg_1"), result_wire("msg_1")], bodies[1][:messages])
    assert_equal(bodies[1].except(:thread), bodies[2])
    assert_equal([{role: "assistant", content: [{type: "compaction", content: "summary"}]}], bodies[3][:messages])
    assert_equal([true, true, false, false], (0..3).map { betas(_1).include?(THREADS_BETA) })
  end

  def test_a_rejected_compaction_is_raised_on_a_thread_that_raises
    serve(call_tool("msg_1"), api_error(400, "thread_unsupported_request"), text("msg_2"))
    thread = new_thread(user("add"), betas: ["compact-2026-09-04"])
    runner = thread.tool_runner

    assert_raises(Anthropic::Errors::BadRequestError) { runner.each_message { runner.compact_before_next_turn } }
    thread.send_message

    assert_equal([3, false], [bodies[2][:messages].length, bodies[2].key?(:compaction)])
  end

  COMPACTED = {role: "assistant", content: [{type: "compaction", content: "summary"}]}.freeze

  def compaction_events(id) = stream_events(id, {type: "compaction", content: "summary"}, "compaction", [])

  # Compacts after the first reply and appends to the thread while handling the compaction response.
  def append_while_compacting(thread, streaming:)
    runner = thread.tool_runner
    handle = lambda do |reply|
      runner.compact_before_next_turn if reply.id == "msg_1"
      next unless reply.id == "msg_c"

      assert_raises(ArgumentError) { runner.feed_messages(user("refused")) }
      thread.append(user("more"))
    end
    streaming ? runner.each_streaming { handle.call(_1.accumulated_message) } : runner.each_message(&handle)
  end

  def test_a_message_appended_to_the_thread_during_a_compaction_follows_the_compaction_response
    unsupported = api_error(400, "thread_unsupported_request")
    [
      [{streaming: false}, {}, [call_tool("msg_1"), compaction_reply("msg_c"), text("msg_2")]],
      [
        {streaming: true},
        {},
        [sse(*tool_events("msg_1")), sse(*compaction_events("msg_c")), sse(*text_events("msg_2"))]
      ],
      [
        {streaming: false},
        {unsupported_request_behavior: :continue_unthreaded},
        [call_tool("msg_1"), unsupported, compaction_reply("msg_c"), text("msg_2")]
      ]
    ].each do |run, options, replies|
      start_over
      serve(*replies)
      thread = new_thread(user("add"), betas: ["compact-2026-09-04"], **options)

      append_while_compacting(thread, **run)

      assert_equal(replies.length, @requests.length)
      assert_equal([COMPACTED, user_wire("more")], bodies.last[:messages])
      held = held_by(thread)
      assert_equal([COMPACTED, user_wire("more"), text_wire], held)
    end
  end

  def test_a_message_appended_to_the_thread_between_steps_follows_the_compaction_response
    serve(call_tool("msg_1"), compaction_reply("msg_c"), text("msg_2"))
    thread = new_thread(user("add"), betas: ["compact-2026-09-04"])
    runner = thread.tool_runner

    runner.next_message
    runner.compact_before_next_turn
    assert_equal("msg_c", runner.next_message.id)
    runner.feed_messages(user("fed"))
    thread.append(user("more"))
    runner.next_message

    assert_equal([COMPACTED, user_wire("fed"), user_wire("more")], bodies[2][:messages])
    held = held_by(thread)
    assert_equal([COMPACTED, user_wire("fed"), user_wire("more"), text_wire], held)
  end

  def test_a_message_appended_to_the_thread_during_a_compaction_after_the_final_turn_is_kept
    {
      false => [text("msg_1"), compaction_reply("msg_c"), text("msg_2")],
      true => [sse(*text_events("msg_1")), sse(*compaction_events("msg_c")), text("msg_2")]
    }.each do |streaming, replies|
      start_over
      serve(*replies)
      thread = new_thread(user("add"), betas: ["compact-2026-09-04"])

      append_while_compacting(thread, streaming:)
      staged = [@requests.length, held_by(thread)]
      thread.send_message

      assert_equal([2, [COMPACTED, user_wire("more")]], staged)
      assert_equal([COMPACTED, user_wire("more")], bodies[2][:messages])
    end
  end

  def test_a_message_appended_to_the_thread_on_a_reply_that_stopped_after_a_compaction_goes_out_with_the_next_request
    serve(compaction_reply("msg_1"), text("msg_2"))
    thread = new_thread(user("add"))

    thread.tool_runner.each_message { thread.append(user("more")) if _1.id == "msg_1" }

    assert_equal([continue_from("msg_1"), [user_wire("more")]], bodies[1].values_at(:thread, :messages))
  end

  def test_a_reply_appended_to_the_thread_again_is_kept_once
    in_a_block = ->(runner, &handle) { runner.each_message(&handle) }
    between_steps = lambda do |runner, &handle|
      while (reply = runner.next_message)
        handle.call(reply)
      end
    end
    [in_a_block, between_steps].each do |run|
      start_over
      serve(call_tool("msg_1"), compaction_reply("msg_c"), text("msg_2"))
      thread = new_thread(user("add"), betas: ["compact-2026-09-04"])
      runner = thread.tool_runner

      run.call(runner) do
        runner.compact_before_next_turn if _1.id == "msg_1"
        thread.append(_1)
      end

      assert_equal([user_wire("add"), tool_use_wire("msg_1"), result_wire("msg_1")], bodies[1][:messages])
      assert_equal([COMPACTED], bodies[2][:messages])
    end
  end

  def test_a_message_appended_to_the_thread_during_a_compaction_without_a_summary_follows_the_history
    serve(call_tool("msg_1"), json(reply_body("msg_c", [], "max_tokens")), text("msg_2"))
    thread = new_thread(user("add"), betas: ["compact-2026-09-04"])

    capture_io { append_while_compacting(thread, streaming: false) }

    assert_equal(
      [user_wire("add"), tool_use_wire("msg_1"), result_wire("msg_1"), user_wire("more")],
      bodies[2][:messages]
    )
  end

  def test_streaming_runner_threads_by_default
    paused = text_events("msg_2", "wait", stop_reason: "pause_turn")
    serve(sse(*tool_events("msg_1")), sse(*paused), sse(*text_events("msg_3")))
    ids = []

    new_runner.each_streaming { ids << _1.accumulated_message.id }

    assert_equal(%w[msg_1 msg_2 msg_3], ids)
    assert_equal([true] * 3, bodies.map { _1[:stream] })
    assert_equal([{type: "create"}, continue_from("msg_1"), continue_from("msg_2")], threads)
    assert_equal([[user_wire("add")], [result_wire("msg_1")], []], bodies.map { _1[:messages] })
    assert_equal([[1, 2]], @adder.calls)
  end

  def test_an_interrupted_stream_ends_the_run_with_the_partial_reply
    serve(sse(*tool_events("msg_1")), sse(*text_events("msg_2", "par").first(3)), text("msg_3"))
    thread = new_thread(user("add"))

    replies = thread.tool_runner.run_until_finished
    thread.send_message(user("more"))

    assert_equal(%w[msg_1 msg_2], replies.map(&:id))
    assert_equal("par", replies.last.content.first.text)
    assert_equal({type: "create"}, bodies[2][:thread])
    assert_equal(
      [user_wire("add"), tool_use_wire("msg_1"), result_wire("msg_1"), text_wire("par"), user_wire("more")],
      bodies[2][:messages]
    )
  end

  def test_a_call_with_the_id_of_a_call_in_the_history_is_answered_at_the_end
    serve(call_tool("msg_1"), text("msg_2"))
    runner = new_runner(messages: [user("add"), tool_use_wire("msg_1"), result_wire("msg_1"), user("again")])

    run_all(runner)

    assert_equal([{type: "create"}, continue_from("msg_1")], threads)
    assert_equal([result_wire("msg_1")], bodies[1][:messages])
    assert_equal(%w[user assistant user user assistant user], runner.params[:messages].map { _1[:role].to_s })
  end

  def test_toolset_member_call_is_answered_and_kept_with_its_toolset_name
    start, *, delta, stop = tool_events("msg_1")
    blocks = [{toolset_name: "fake_toolset"}, {}].each_with_index.flat_map do |toolset_name, index|
      [
        {
          type: "content_block_start",
          index: index,
          content_block: {type: "tool_use", id: "t#{index}", name: "adder", input: {}, **toolset_name}
        },
        {type: "content_block_delta", index: index, delta: {type: "input_json_delta", partial_json: "{\"lhs\":1,\"rhs\":2}"}},
        {type: "content_block_stop", index: index}
      ]
    end
    serve(sse(start, *blocks, delta, stop), api_error(404, "thread_not_found"), sse(*text_events("msg_2")))

    new_runner.run_until_finished

    assert_equal([{type: "create"}, continue_from("msg_1"), {type: "create"}], threads)
    results = {
      role: "user",
      content: [
        {type: "tool_result", tool_use_id: "t0", toolset_name: "fake_toolset", content: "3", is_error: false},
        {type: "tool_result", tool_use_id: "t1", content: "3", is_error: false}
      ]
    }
    assert_equal([results], bodies[1][:messages])
    # The thread holds the call as it came, which the whole history shows.
    assert_pattern do
      bodies[2][:messages] => [
        {role: "user"},
        {
          role: "assistant",
          content: [{type: "tool_use", id: "t0", toolset_name: "fake_toolset"}, {type: "tool_use", id: "t1"}]
        },
        ^results
      ]
    end
    refute_operator(bodies[2][:messages][1][:content].last, :key?, :toolset_name)
  end

  def test_a_stream_that_ends_before_the_reply_starts_ends_the_run
    serve(sse(*tool_events("msg_1")), sse({type: "ping"}))
    runner = new_runner

    replies = runner.run_until_finished

    assert_equal([["msg_1"], 2, false], [replies.map(&:id), @requests.length, runner.finished?])
  end

  # The options of a runner on each client whose platform has no message threads.
  def clients_without_threads
    aws = {aws_region: "us-east-1", api_key: "k", base_url: "http://localhost"}
    vertex = Anthropic::VertexClient.new(region: "us-east5", project_id: "p", base_url: "http://localhost")
    {
      "Bedrock" => {client: Anthropic::BedrockClient.new(**aws)},
      "Bedrock Mantle" => {client: Anthropic::BedrockMantleClient.new(**aws)},
      "Vertex" => {client: vertex, request_options: {extra_headers: {"authorization" => "Bearer t"}}}
    }
  end

  def test_runner_never_threads_on_providers_without_threads
    clients_without_threads.each do |name, options|
      start_over
      serve(call_tool("msg_1"), text("msg_2"), url: ANY_PATH)

      run_all(new_runner(**options))

      assert_equal([nil, nil], threads, name)
      assert_equal([1, 3], bodies.map { _1[:messages].length }, name)
      refute(@requests.any? { [_1[:headers]["Anthropic-Beta"], *_1[:body][:anthropic_beta]].join.include?(THREADS_BETA) }, name)
    end
  end

  def test_runner_threads_on_providers_that_pass_through
    client = Anthropic::AWSClient.new(aws_region: "us-east-1", api_key: "k", workspace_id: "w", base_url: "http://localhost")
    serve(call_tool("msg_1"), text("msg_2"))

    run_all(new_runner(client: client))

    assert_equal([{type: "create"}, continue_from("msg_1")], threads)
  end

  def test_container_of_the_reply_is_sent_on_later_turns
    serve(call_tool("msg_1", container: {id: "cont_1", expires_at: "2026-01-01T00:00:00Z"}), text("msg_2"))

    run_all(new_runner)

    assert_equal([nil, "cont_1"], bodies.map { _1[:container] })
  end

  def test_a_tool_change_travels_in_the_continue
    serve(call_tool("msg_1"), text("msg_2"))
    runner = new_runner(betas: ["inline-tools-2026-09-15"])

    runner.each_message { runner.remove_tools("adder") if _1.id == "msg_1" }

    assert_equal(continue_from("msg_1"), bodies[1][:thread])
    assert_equal(%w[user system], bodies[1][:messages].map { _1[:role] })
    refute(bodies[1].key?(:tools))
    assert_empty(@adder.calls)
  end

  class Lookup < Adder
    doc "Looks up two numbers"

    input_schema AdderInput
  end

  INLINE_TOOLS_BETA = "inline-tools-2026-09-15"

  LOOKUP_DEFINITION = {
    name: "lookup",
    description: "Looks up two numbers",
    input_schema: {
      type: "object",
      properties: {lhs: {type: "integer"}, rhs: {type: "integer"}},
      required: %w[lhs rhs],
      additionalProperties: false
    }
  }.freeze

  TOOL_ADDITION = {
    role: "system",
    content: [{type: "tool_addition", tool: {type: "tool_definition", definition: LOOKUP_DEFINITION}}]
  }.freeze

  TOOL_REMOVAL = {
    role: "system",
    content: [{type: "tool_removal", tool: {type: "tool_reference", name: "adder"}}]
  }.freeze

  # The replies of a run that calls the adder, the lookup that was added, and the adder that was removed.
  def replies_to_tool_changes
    [call_tool("msg_1"), call_tool("msg_2", name: "lookup"), call_tool("msg_3"), text("msg_4")]
  end

  def change_tools_during(runner, lookup)
    runner.each_message do
      runner.add_tools(lookup) if _1.id == "msg_1"
      runner.remove_tools(@adder) if _1.id == "msg_2"
    end
  end

  def assert_tool_changes_sent(requests)
    not_found = {type: "tool_result", tool_use_id: "toolu_msg_3", content: "Error: parsed 'adder' not found", is_error: true}

    assert_equal(%w[msg_1 msg_2 msg_3].map { continue_from(_1) }, requests.drop(1).map { _1[:thread] })
    assert_equal(
      [
        [user_wire("add")],
        [result_wire("msg_1"), TOOL_ADDITION],
        [result_wire("msg_2"), TOOL_REMOVAL],
        [{role: "user", content: [not_found]}]
      ],
      requests.map { _1[:messages] }
    )
    assert_equal([false] * 3, requests.drop(1).map { _1.key?(:tools) })
  end

  def test_tools_are_added_and_removed_on_the_default_thread
    serve(*replies_to_tool_changes)
    lookup = Lookup.new

    change_tools_during(new_runner(betas: [INLINE_TOOLS_BETA]), lookup)

    assert_equal(4, @requests.length)
    assert_tool_changes_sent(bodies)
    assert_equal([{type: "create"}, ["adder"]], [bodies[0][:thread], bodies[0][:tools].map { _1[:name] }])
    assert_equal([[INLINE_TOOLS_BETA, THREADS_BETA]] * 4, (0..3).map { betas(_1) })
    assert_equal([[[1, 2]], [[1, 2]]], [@adder.calls, lookup.calls])
  end

  def test_tools_are_added_and_removed_by_a_runner_over_a_thread
    serve(text("msg_0", "hello"), *replies_to_tool_changes, text("msg_5"))
    lookup = Lookup.new
    thread = new_thread(betas: [INLINE_TOOLS_BETA])
    thread.send_message(user("hi"))
    thread.append(user("add"))

    change_tools_during(thread.tool_runner, lookup)
    thread.send_message(user("thanks"))

    assert_equal(6, @requests.length)
    assert_equal([continue_from("msg_0"), false], [bodies[1][:thread], bodies[1].key?(:tools)])
    assert_tool_changes_sent(bodies[1..4])
    assert_equal([continue_from("msg_4"), [user_wire("thanks")], false], [*bodies[5].values_at(:thread, :messages), bodies[5].key?(:tools)])
    assert_equal([[[1, 2]], [[1, 2]]], [@adder.calls, lookup.calls])
    held = held_by(thread)
    assert_equal([TOOL_ADDITION, TOOL_REMOVAL], held.select { _1[:role] == "system" })
  end
end
