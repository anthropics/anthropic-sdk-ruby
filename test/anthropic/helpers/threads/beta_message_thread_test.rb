# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../support/served_messages"

class Anthropic::Test::Helpers::Threads::BetaMessageThreadTest < Minitest::Test
  extend Minitest::Serial
  include Anthropic::Test::ServedMessages

  TOOLS = [{name: "lookup", input_schema: {type: "object"}}].freeze
  OTHER_TOOLS = [{name: "other", input_schema: {type: "object"}}].freeze
  CREATE_ONLY_FIELDS = {system_: [[{type: :text, text: "one"}], [{type: :text, text: "two"}]], tools: [TOOLS, OTHER_TOOLS]}.freeze

  def reply(id, text: "ok", stop_reason: "end_turn", content: nil, **)
    json(reply_body(id, content || [{type: "text", text: text}], stop_reason, **))
  end

  def api_error(status, code: nil, type: "invalid_request_error", unsupported: nil)
    error = {type: type, message: "thread_not_found thread_unsupported_request"}
    error[:details] = {error_code: code, unsupported: unsupported}.compact unless code.nil?
    {status: status, headers: {"Content-Type" => "application/json"}, body: {type: "error", error: error}.to_json}
  end

  def assistant_wire(text) = {role: "assistant", content: [{text: text, type: "text"}]}

  def marked(text) = {role: :user, content: [{type: :text, text: text, cache_control: {type: :ephemeral}}]}

  def marked_wire(text) = {role: "user", content: [{type: "text", text: text, cache_control: {type: "ephemeral"}}]}

  def unmarked_wire(text) = {role: "user", content: [{type: "text", text: text}]}

  def new_thread(client: @client, **params)
    client.beta.messages.thread(model: "claude-sonnet-4-5", max_tokens: 16, **params)
  end

  def test_factory_sends_nothing
    serve
    thread = new_thread(messages: [user("seed")])

    assert_nil(thread.previous_message_id)
    assert_equal([user("seed")], thread.messages)
    assert_predicate(thread.messages, :frozen?)
    assert_empty(@requests)
  end

  def test_create_then_continue
    serve(reply("msg_1", text: "one"), reply("msg_2", text: "two"))
    thread = new_thread(system_: "be brief", tools: TOOLS)

    first = thread.send_message(user("a"))
    assert_equal("msg_1", first.id)
    assert_equal("msg_1", thread.previous_message_id)
    thread.send_message(user("b"))

    assert_equal(
      {
        model: "claude-sonnet-4-5",
        max_tokens: 16,
        system: "be brief",
        tools: [{name: "lookup", input_schema: {type: "object"}}],
        messages: [user_wire("a")],
        thread: {type: "create"}
      },
      bodies[0]
    )
    assert_equal(
      {
        model: "claude-sonnet-4-5",
        max_tokens: 16,
        messages: [user_wire("b")],
        thread: {type: "continue", previous_message_id: "msg_1"}
      },
      bodies[1]
    )
    assert_equal([[THREADS_BETA], [THREADS_BETA]], [betas(0), betas(1)])
    assert_equal("msg_2", thread.previous_message_id)
    assert_equal(4, thread.messages.length)
  end

  def test_send_with_nothing_staged_goes_out
    serve(reply("msg_1"), api_error(400))
    thread = new_thread
    thread.send_message(user("a"))

    assert_raises(Anthropic::Errors::BadRequestError) { thread.send_message }

    assert_equal([[], continue_from("msg_1")], bodies[1].values_at(:messages, :thread))
  end

  def test_rejects_the_fields_the_thread_sets
    serve
    assert_raises(ArgumentError) { new_thread(stream: true) }
    assert_raises(ArgumentError) { new_thread(unsupported_request_behavior: :ignore) }
    thread = new_thread
    assert_raises(ArgumentError) { thread.update(messages: [user("a")]) }
    assert_raises(ArgumentError) { thread.send_message(messages: [user("a")]) }
    assert_empty(thread.messages)
    assert_empty(@requests)
  end

  def test_rejects_a_thread_value_of_the_caller
    serve
    typed = Anthropic::Beta::BetaThreadContinueParams.new(previous_message_id: "msg_0")
    [{type: :create}, continue_from("msg_0"), typed].each do |value|
      thread = new_thread
      [
        -> { new_thread(thread: value) },
        -> { new_thread("thread" => value) },
        -> { thread.update(thread: value) },
        -> { thread.send_message(user("a"), thread: value) },
        -> { thread.stream(user("a"), thread: value) }
      ].each do |route|
        error = assert_raises(ArgumentError, &route)
        assert_equal("`thread` cannot be given here. The message thread sets `thread` for each request itself.", error.message)
      end
      assert_empty(thread.messages)
    end
    assert_empty(@requests)
  end

  def test_staging_the_reply_again_is_a_no_op
    serve(reply("msg_1", text: "one"), reply("msg_2"))
    thread = new_thread
    first = thread.send_message(user("a"))

    thread.append(first)
    thread.append({role: :assistant, content: first.content})
    thread.append(Anthropic::Beta::BetaAssistantMessageParam.new(content: first.content))
    assert_equal(2, thread.messages.length)
    thread.send_message(user("b"))

    assert_equal([user_wire("b")], bodies[1][:messages])
  end

  def test_staging_the_reply_again_with_its_keys_in_another_order_is_a_no_op
    serve(reply("msg_1", text: "one"), reply("msg_2"))
    thread = new_thread
    thread.send_message(user("a"))

    thread.append({content: [{text: "one", type: :text}], role: :assistant})
    thread.append({role: :assistant, content: [{type: :text, text: "one"}]})
    assert_equal(2, thread.messages.length)
    thread.send_message(user("b"))

    assert_equal([user_wire("b")], bodies[1][:messages])
  end

  def test_a_different_assistant_message_is_staged
    serve(reply("msg_1", text: "one"), reply("msg_2"))
    thread = new_thread
    thread.send_message(user("a"))

    thread.append({role: :assistant, content: [{type: :text, text: "other"}]})
    thread.send_message(user("b"))

    assert_equal([assistant_wire("other"), user_wire("b")], bodies[1][:messages])
  end

  def test_failed_send_takes_its_messages_back
    overloaded = api_error(529, type: "overloaded_error")
    serve(reply("msg_1"), api_error(400), reply("msg_2"), overloaded, :drop, reply("msg_3"))
    thread = new_thread
    thread.send_message(user("a"))
    before = thread.messages

    assert_raises(Anthropic::Errors::BadRequestError) { thread.send_message(user("bad")) }
    assert_equal(["msg_1", before], [thread.previous_message_id, thread.messages])
    thread.send_message(user("good"))
    assert_raises(Anthropic::Errors::InternalServerError) { thread.send_message(user("q")) }
    assert_raises(Anthropic::Errors::APIConnectionError) { thread.send_message(user("q")) }
    thread.send_message(user("q"))

    assert_equal([continue_from("msg_1"), [user_wire("good")]], bodies[2].values_at(:thread, :messages))
    assert_equal([continue_from("msg_2"), [user_wire("q")]], bodies[5].values_at(:thread, :messages))
    assert_equal([bodies[5]] * 2, bodies[3..4])
  end

  def test_failed_send_keeps_the_messages_that_append_staged
    serve(reply("msg_1"), api_error(400), reply("msg_2"))
    thread = new_thread
    thread.send_message(user("a"))

    thread.append(user("b"))
    assert_raises(Anthropic::Errors::BadRequestError) { thread.send_message(user("c")) }
    thread.send_message

    assert_equal([continue_from("msg_1"), [user_wire("b")]], bodies[2].values_at(:thread, :messages))
  end

  def test_failed_send_takes_back_only_the_messages_it_added
    serve(reply("msg_1"), api_error(400))
    thread = new_thread
    first = thread.send_message(user("a"))
    before = thread.messages

    assert_raises(Anthropic::Errors::BadRequestError) { thread.send_message(first, user("b")) }

    assert_equal(before, thread.messages)
  end

  def test_interrupted_send_takes_its_messages_back
    stub_request(:post, URL).to_return { raise(Interrupt) }
    thread = new_thread(messages: [user("a")])

    assert_raises(Interrupt) { thread.send_message(user("b")) }

    assert_equal([user("a")], thread.messages)
  end

  def test_refused_turn_is_not_recorded_and_the_next_turn_starts_a_new_thread
    refusals = [
      [reply("msg_2", text: "no", stop_reason: "refusal"), ->(thread, message) { thread.send_message(message) }],
      [streamed("msg_2", "no", stop_reason: "refusal"), ->(thread, message) { thread.stream(message).accumulated_message }]
    ]
    refusals.each do |refusal, send|
      start_over
      serve(reply("msg_1", text: "one"), refusal, reply("msg_3"), reply("msg_4"))
      thread = new_thread(system_: "s", tools: TOOLS)
      thread.send_message(user("a"))
      before = thread.messages

      refused = send.call(thread, user("bad"))
      assert_equal(["msg_2", :refusal, "no"], [refused.id, refused.stop_reason, refused.content.first.text])
      assert_equal([nil, before], [thread.previous_message_id, thread.messages])
      thread.send_message(user("good"))
      thread.send_message(user("c"))

      assert_equal([continue_from("msg_1"), [user_wire("bad")]], bodies[1].values_at(:thread, :messages))
      assert_equal({type: "create"}, bodies[2][:thread])
      assert_equal([user_wire("a"), assistant_wire("one"), user_wire("good")], bodies[2][:messages])
      assert_equal(["s", 1], [bodies[2][:system], bodies[2][:tools].length])
      assert_equal(continue_from("msg_3"), bodies[3][:thread])
    end
  end

  def test_refused_first_turn_keeps_the_seed_and_not_its_own_system_and_tools
    serve(reply("msg_1", stop_reason: "refusal"), reply("msg_2"))
    thread = new_thread(messages: [user("seed")])

    thread.send_message(user("bad"), system_: "once", tools: TOOLS)
    assert_equal([user("seed")], thread.messages)
    thread.send_message(user("good"))

    assert_equal(["once", 1], [bodies[0][:system], bodies[0][:tools].length])
    assert_equal([{type: "create"}, [user_wire("seed"), user_wire("good")]], bodies[1].values_at(:thread, :messages))
    assert_empty(bodies[1].keys & [:system, :tools])
  end

  def test_refused_turn_keeps_the_messages_that_append_staged
    serve(reply("msg_1", text: "one"), reply("msg_2", stop_reason: "refusal"), reply("msg_3"))
    thread = new_thread
    thread.send_message(user("a"))

    thread.append(user("b"))
    thread.send_message(user("bad"))
    thread.send_message(user("good"))

    assert_equal({type: "create"}, bodies[2][:thread])
    assert_equal([user_wire("a"), assistant_wire("one"), user_wire("b"), user_wire("good")], bodies[2][:messages])
  end

  def test_refused_turn_is_not_recorded_without_a_thread
    serve(
      api_error(400, code: "thread_unsupported_request"),
      reply("msg_1", text: "one"),
      reply("msg_2", stop_reason: "refusal"),
      reply("msg_3")
    )
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded)
    thread.send_message(user("a"))

    thread.send_message(user("bad"))
    thread.send_message(user("good"))

    refute(bodies[3].key?(:thread))
    assert_equal([user_wire("a"), assistant_wire("one"), user_wire("good")], bodies[3][:messages])
  end

  FALLBACK_BETA = "server-side-fallback-2026-07-01"

  def test_reply_of_a_fallback_model_starts_a_new_thread_and_changes_no_field
    iterations = written_by_fallback("claude-b")
    hop = {from: {model: "claude-sonnet-4-5"}, to: {model: "claude-b"}, trigger: {category: nil, type: "refusal"}, type: "fallback"}
    replies = [
      [reply("msg_1", content: [hop, {text: "one", type: "text"}], iterations:), ->(thread) { thread.send_message(user("a")) }],
      [
        sse(
          message_start("msg_1"),
          block_start(0, hop),
          block_stop(0),
          block_start(1, {type: "text", text: ""}),
          text_delta(1, "one"),
          block_stop(1),
          message_delta(iterations:),
          {type: "message_stop"}
        ),
        ->(thread) { thread.stream(user("a")).until_done }
      ]
    ]
    fallbacks = [[{model: "claude-b"}], "default"]
    replies.product(fallbacks).each do |(served, send), given|
      start_over
      serve(served, reply("msg_2", text: "two", iterations:), reply("msg_3", text: "three"), reply("msg_4"))
      thread = new_thread(system_: "s", tools: TOOLS, fallbacks: given, betas: [FALLBACK_BETA])
      fields = thread.params.except(:messages)

      send.call(thread)
      assert_nil(thread.previous_message_id)
      %w[b c d].each { thread.send_message(user(_1)) }

      assert_equal([*[{type: "create"}] * 3, continue_from("msg_3")], bodies.map { _1[:thread] })
      assert_equal([["claude-sonnet-4-5", given]] * 4, bodies.map { _1.values_at(:model, :fallbacks) })
      assert_equal([["s", TOOLS]] * 3, bodies.first(3).map { _1.values_at(:system, :tools) })
      written = {role: "assistant", content: [hop, {text: "one", type: "text"}]}
      assert_equal([user_wire("a"), written, user_wire("b")], bodies[1][:messages])
      assert_equal([*bodies[1][:messages], assistant_wire("two"), user_wire("c")], bodies[2][:messages])
      assert_equal([user_wire("d")], bodies[3][:messages])
      assert_equal([[FALLBACK_BETA, THREADS_BETA]] * 4, (0..3).map { betas(_1) })
      assert_equal(fields, thread.params.except(:messages))
    end
  end

  def test_refused_reply_of_a_fallback_model_is_not_recorded
    serve(reply("msg_1", stop_reason: "refusal", iterations: written_by_fallback("claude-b")), reply("msg_2"))
    thread = new_thread(fallbacks: [{model: "claude-b"}], betas: [FALLBACK_BETA])

    thread.send_message(user("bad"))
    thread.send_message(user("good"))

    assert_equal([{type: "create"}, "claude-sonnet-4-5", [{model: "claude-b"}]], bodies[1].values_at(:thread, :model, :fallbacks))
    assert_equal([user_wire("good")], bodies[1][:messages])
  end

  def test_reply_of_the_requested_model_continues_the_thread
    serve(reply("msg_1", iterations: written_by_fallback("claude-b").values_at(0, 2)), reply("msg_2"))
    thread = new_thread(fallbacks: [{model: "claude-b"}], betas: [FALLBACK_BETA])

    thread.send_message(user("a"))
    thread.send_message(user("b"))

    expected = [continue_from("msg_1"), "claude-sonnet-4-5", [{model: "claude-b"}]]
    assert_equal(expected, bodies[1].values_at(:thread, :model, :fallbacks))
  end

  def test_reply_of_a_fallback_model_changes_nothing_without_a_thread
    serve(
      api_error(400, code: "thread_unsupported_request"),
      reply("msg_1", iterations: written_by_fallback("claude-b")),
      reply("msg_2")
    )
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded, fallbacks: [{model: "claude-b"}], betas: [FALLBACK_BETA])

    thread.send_message(user("a"))
    thread.send_message(user("b"))

    assert_equal([nil, "claude-sonnet-4-5", [{model: "claude-b"}]], bodies[2].values_at(:thread, :model, :fallbacks))
  end

  def test_thread_not_found_after_the_new_thread_of_a_fallback_reply_replays
    not_found = api_error(404, code: "thread_not_found", type: "not_found_error")
    serve(reply("msg_1", iterations: written_by_fallback("claude-b")), reply("msg_2"), not_found, reply("msg_3"))
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded, fallbacks: [{model: "claude-b"}], betas: [FALLBACK_BETA])

    %w[a b c].each { thread.send_message(user(_1)) }

    assert_equal([{type: "create"}, {type: "create"}, continue_from("msg_2"), {type: "create"}], bodies.map { _1[:thread] })
  end

  def test_rejected_continue_replays_under_create
    %w[thread_not_found thread_already_continued thread_continue_in_flight].each do |code|
      start_over
      serve(reply("msg_1", text: "one"), api_error(code == "thread_not_found" ? 404 : 409, code: code), reply("msg_2"), reply("msg_3"))
      thread = new_thread(system_: "s", tools: TOOLS)
      thread.send_message(user("a"))

      replayed = thread.send_message(user("b"))
      thread.send_message(user("c"))

      assert_equal("msg_2", replayed.id)
      assert_equal(continue_from("msg_1"), bodies[1][:thread])
      assert_equal({type: "create"}, bodies[2][:thread])
      assert_equal([user_wire("a"), assistant_wire("one"), user_wire("b")], bodies[2][:messages])
      assert_equal(["s", 1], [bodies[2][:system], bodies[2][:tools].length])
      assert_equal(continue_from("msg_2"), bodies[3][:thread])
      assert_equal([THREADS_BETA], betas(2))
    end
  end

  def test_replay_drops_the_cache_markers_of_the_recorded_messages
    serve(*(1..5).map { reply("msg_#{_1}", text: "r") }, api_error(404, code: "thread_not_found"), reply("msg_6"))
    thread = new_thread
    given = (1..6).map { marked("m#{_1}") }
    before = copy(given)

    given.each { thread.send_message(_1) }

    recorded = (1..5).flat_map { [unmarked_wire("m#{_1}"), assistant_wire("r")] }
    assert_equal([continue_from("msg_5"), [marked_wire("m6")]], bodies[5].values_at(:thread, :messages))
    assert_equal([{type: "create"}, [*recorded, marked_wire("m6")]], bodies[6].values_at(:thread, :messages))
    assert_equal(before, given)
    assert_equal(given, thread.messages.reject { _1[:role] == :assistant })
    assert_equal(given, thread.params[:messages].reject { _1[:role] == :assistant })
  end

  def test_first_request_keeps_the_cache_markers_of_its_messages
    serve(reply("msg_1"))
    thread = new_thread(messages: [marked("seed"), {role: :assistant, content: "mine"}])
    thread.append(marked("a"))

    thread.send_message(marked("b"))

    sent = [marked_wire("seed"), {role: "assistant", content: "mine"}, marked_wire("a"), marked_wire("b")]
    assert_equal([{type: "create"}, sent], bodies[0].values_at(:thread, :messages))
  end

  def test_fork_drops_the_cache_markers_of_the_recorded_messages_only
    marker = {type: "ephemeral"}
    fields = {system: [{type: "text", text: "s", cache_control: marker}], tools: [{**TOOLS.first, cache_control: marker}]}
    serve(reply("msg_1", text: "one"), reply("msg_2"))
    thread = new_thread(**fields, cache_control: marker)
    thread.send_message(marked("a"))

    fork = thread.fork
    fork.append(marked("b"))
    fork.send_message(marked("c"))

    sent = [unmarked_wire("a"), assistant_wire("one"), marked_wire("b"), marked_wire("c")]
    assert_equal([{type: "create"}, sent], bodies[1].values_at(:thread, :messages))
    assert_equal({**fields, cache_control: marker}, bodies[1].slice(:system, :tools, :cache_control))
  end

  def test_unthreaded_turns_drop_the_cache_markers_of_the_recorded_messages
    serve(api_error(400, code: "thread_unsupported_request"), reply("msg_1", text: "one"), reply("msg_2", text: "two"), reply("msg_3"))
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded)

    %w[a b c].each { thread.send_message(marked(_1)) }

    assert_equal([nil, [marked_wire("a")]], bodies[1].values_at(:thread, :messages))
    assert_equal([unmarked_wire("a"), assistant_wire("one"), marked_wire("b")], bodies[2][:messages])
    sent = [unmarked_wire("a"), assistant_wire("one"), unmarked_wire("b"), assistant_wire("two"), marked_wire("c")]
    assert_equal([nil, sent], bodies[3].values_at(:thread, :messages))
  end

  def test_replay_drops_nested_cache_markers_and_keeps_free_form_values_whole
    marker = {type: "ephemeral"}
    tool_use = {type: "tool_use", id: "toolu_1", name: "lookup", input: {cache_control: "mine"}}
    text = {type: "text", text: "found"}
    result = {type: "tool_result", tool_use_id: "toolu_1"}
    source = {type: "content"}
    definition = {
      name: "other",
      input_schema: {type: "object", properties: {cache_control: {type: "string"}}},
      input_examples: [{cache_control: "no-store"}]
    }
    addition = ->(**mark) { {type: "tool_addition", tool: {type: "tool_definition", definition: {**definition, **mark}}, **mark} }
    marked_addition = addition.call(cache_control: marker)
    compaction = {type: "compaction", content: "summary", tool_changes: [marked_addition]}
    search = lambda do |**mark|
      found = {type: "tool_search_tool_search_result", tool_references: [{type: "tool_reference", tool_name: "lookup", **mark}]}
      {type: "tool_search_tool_result", tool_use_id: "srvtoolu_1", content: found, **mark}
    end
    seed = {role: :assistant, content: [{**compaction, cache_control: marker}, search.call(cache_control: marker)]}
    serve(reply("msg_1", content: [tool_use], stop_reason: "tool_use"), reply("msg_2"), reply("msg_3"))
    thread = new_thread(tools: TOOLS, messages: [seed])
    thread.send_message(user("a"))
    thread.send_message(
      {
        role: :user,
        content: [
          {**result, content: [{**text, cache_control: marker}], cache_control: marker},
          {"type" => "document", "source" => {**source, content: [{**text, "cache_control" => marker}]}}
        ]
      },
      {role: :system, content: [marked_addition]}
    )

    thread.fork.send_message(user("b"))

    assert_equal(
      [
        [compaction, search.call],
        "a",
        [tool_use],
        [{**result, content: [text]}, {type: "document", source: {**source, content: [text]}}],
        [addition.call]
      ],
      bodies[2][:messages].first(5).map { _1[:content] }
    )
  end

  def test_thread_error_on_create_is_raised
    serve(api_error(404, code: "thread_not_found", type: "not_found_error"))
    thread = new_thread

    assert_raises(Anthropic::Errors::NotFoundError) { thread.send_message(user("a")) }
    assert_equal(1, @requests.length)
    assert_empty(thread.messages)
  end

  def test_errors_without_a_thread_code_are_raised
    responses = [
      api_error(404, type: "not_found_error"),
      api_error(400),
      api_error(400, code: "thread_fingerprint_mismatch"),
      api_error(400, code: "thread_something_new")
    ]
    serve(reply("msg_1"), *responses)
    thread = new_thread
    thread.send_message(user("a"))

    thread.append(user("b"))
    responses.each { assert_raises(Anthropic::Errors::APIStatusError) { thread.send_message } }

    assert_equal(5, @requests.length)
    assert_equal("msg_1", thread.previous_message_id)
    assert_equal(user("b"), thread.messages.last)
  end

  def test_failed_replay_then_create
    serve(reply("msg_1", text: "one"), api_error(404, code: "thread_not_found"), api_error(500, type: "api_error"), reply("msg_2"))
    thread = new_thread
    thread.send_message(user("a"))

    assert_raises(Anthropic::Errors::InternalServerError) { thread.send_message(user("b")) }
    assert_nil(thread.previous_message_id)
    thread.send_message(user("b"))

    assert_equal({type: "create"}, bodies[3][:thread])
    assert_equal([user_wire("a"), assistant_wire("one"), user_wire("b")], bodies[3][:messages])
  end

  def test_unsupported_request_is_known_by_its_error_code_whatever_the_status
    serve(api_error(422, code: "thread_unsupported_request"), reply("msg_1"))
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded)

    thread.send_message(user("a"))

    assert_equal([true, false], bodies.map { _1.key?(:thread) })
  end

  def test_continue_unthreaded_after_unsupported_request
    serve(
      api_error(400, code: "thread_unsupported_request", unsupported: %w[something_new another]),
      reply("msg_1", text: "one"),
      reply("msg_2")
    )
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded, betas: ["other-beta"], system_: "s")

    thread.send_message(user("a"))
    assert_nil(thread.previous_message_id)
    thread.send_message(user("b"))

    assert_equal({type: "create"}, bodies[0][:thread])
    refute(bodies[1].key?(:thread))
    refute(bodies[2].key?(:thread))
    assert_equal([user_wire("a"), assistant_wire("one"), user_wire("b")], bodies[2][:messages])
    assert_equal("s", bodies[2][:system])
    assert_equal([%w[other-beta], %w[other-beta]], [betas(1), betas(2)])
  end

  def test_thread_not_found_right_after_a_replay_stops_threading
    not_found = api_error(404, code: "thread_not_found", type: "not_found_error")
    serve(reply("msg_1", text: "one"), not_found, reply("msg_2", text: "two"), not_found, reply("msg_3", text: "three"), reply("msg_4"))
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded, system_: "s")

    %w[a b c d].each { thread.send_message(user(_1)) }

    history = [user_wire("a"), assistant_wire("one"), user_wire("b"), assistant_wire("two"), user_wire("c")]
    assert_equal(
      [{type: "create"}, continue_from("msg_1"), {type: "create"}, continue_from("msg_2"), nil, nil],
      bodies.map { _1[:thread] }
    )
    assert_equal([history, "s"], bodies[4].values_at(:messages, :system))
    assert_equal([*history, assistant_wire("three"), user_wire("d")], bodies[5][:messages])
    assert_nil(thread.previous_message_id)
  end

  def test_thread_not_found_right_after_a_replay_that_failed_at_first_stops_threading
    not_found = api_error(404, code: "thread_not_found", type: "not_found_error")
    serve(reply("msg_1"), not_found, api_error(500, type: "api_error"), reply("msg_2"), not_found, reply("msg_3"))
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded)
    thread.send_message(user("a"))

    assert_raises(Anthropic::Errors::InternalServerError) { thread.send_message(user("b")) }
    thread.send_message(user("b"))
    thread.send_message(user("c"))

    assert_equal([{type: "create"}, {type: "create"}, continue_from("msg_2"), nil], bodies.drop(2).map { _1[:thread] })
  end

  def test_thread_not_found_right_after_a_replay_replays_again_on_a_thread_that_raises
    not_found = api_error(404, code: "thread_not_found", type: "not_found_error")
    serve(reply("msg_1"), not_found, reply("msg_2"), not_found, reply("msg_3"), reply("msg_4"))
    thread = new_thread

    %w[a b c d].each { thread.send_message(user(_1)) }

    assert_equal(
      [{type: "create"}, continue_from("msg_1"), {type: "create"}, continue_from("msg_2"), {type: "create"}, continue_from("msg_3")],
      bodies.map { _1[:thread] }
    )
  end

  def test_only_thread_not_found_on_the_first_continue_after_such_a_replay_stops_threading
    not_found = api_error(404, code: "thread_not_found", type: "not_found_error")
    continued = api_error(409, code: "thread_already_continued")
    in_flight = api_error(409, code: "thread_continue_in_flight")
    cases = [
      [not_found, reply("msg_2"), reply("msg_3"), not_found],
      [not_found, reply("msg_2"), continued],
      [not_found, reply("msg_2"), in_flight],
      [continued, reply("msg_2"), not_found],
      [in_flight, reply("msg_2"), not_found]
    ]
    cases.each do |served|
      start_over
      serve(reply("msg_1"), *served, reply("msg_9"), reply("msg_10"))
      thread = new_thread(unsupported_request_behavior: :continue_unthreaded)

      (served.length + 1).times { thread.send_message(user("m")) }

      assert_equal([{type: "create"}, continue_from("msg_9")], bodies.last(2).map { _1[:thread] })
    end
  end

  def test_unfinished_turn_resumes_with_no_messages
    %w[pause_turn compaction].each do |stop_reason|
      start_over
      serve(reply("msg_1", stop_reason: stop_reason), reply("msg_2", stop_reason: stop_reason), reply("msg_3"), reply("msg_4"))
      thread = new_thread
      thread.send_message(user("a"))

      thread.send_message
      thread.send_message
      thread.send_message(user("b"))

      assert_equal([], bodies[1][:messages])
      assert_equal(continue_from("msg_1"), bodies[1][:thread])
      assert_equal([[], continue_from("msg_2")], bodies[2].values_at(:messages, :thread))
      assert_equal(continue_from("msg_3"), bodies[3][:thread])
    end
  end

  def test_overrides
    serve(reply("msg_1"), reply("msg_2"), reply("msg_3"), reply("msg_4"))
    thread = new_thread(inference_geo: "us", metadata: {user_id: "u"})

    thread.send_message(user("a"), max_tokens: 32, metadata: nil)
    thread.update(max_tokens: 64, inference_geo: nil)
    thread.send_message(user("b"))
    thread.send_message(user("c"), max_tokens: 128)
    thread.send_message(user("d"))

    assert_equal([32, "us", false], [bodies[0][:max_tokens], bodies[0][:inference_geo], bodies[0].key?(:metadata)])
    assert_equal([64, false, {user_id: "u"}], [bodies[1][:max_tokens], bodies[1].key?(:inference_geo), bodies[1][:metadata]])
    assert_equal(128, bodies[2][:max_tokens])
    assert_equal(64, bodies[3][:max_tokens])
    assert_equal(continue_from("msg_3"), bodies[3][:thread])
  end

  def test_a_later_request_option_replaces_the_threads_as_a_whole
    serve(reply("msg_1"), reply("msg_2"), reply("msg_3"), reply("msg_4"), url: %r{\Ahttp://localhost/v1/messages})
    given = {extra_headers: {"x-a" => "1", "x-b" => "1"}, extra_query: {"a" => "1", "b" => "1"}, extra_body: {a: 1, b: 1}}
    thread = new_thread(request_options: given)

    thread.send_message(
      user("a"),
      request_options: {extra_headers: {"x-b" => "2"}, extra_query: {"b" => "2"}, extra_body: {b: 2}}
    )
    thread.send_message(user("b"), request_options: {timeout: 5})
    thread.update(request_options: {extra_headers: {"x-c" => "3"}})
    thread.send_message(user("c"))
    thread.send_message(user("d"), request_options: {extra_headers: nil})

    sent = @requests.map do |request|
      [request[:headers].values_at("X-A", "X-B", "X-C"), request[:query].values_at("a", "b"), request[:body].values_at(:a, :b)]
    end
    assert_equal(
      [
        [[nil, "2", nil], [nil, "2"], [nil, 2]],
        [["1", "1", nil], %w[1 1], [1, 1]],
        [[nil, nil, "3"], %w[1 1], [1, 1]],
        [[nil, nil, nil], %w[1 1], [1, 1]]
      ],
      sent
    )
    assert_equal([[THREADS_BETA]] * 4, (0..3).map { betas(_1) })
    assert_equal(["message-thread"] * 4, helper_headers)
    assert_equal({**given, extra_headers: {"x-c" => "3"}}, thread.params[:request_options])
  end

  def copy(value) = Marshal.load(Marshal.dump(value))

  def test_changed_system_or_tools_is_refused
    CREATE_ONLY_FIELDS.each do |field, (before, after)|
      start_over
      serve(reply("msg_1"), reply("msg_2"))
      thread = new_thread(field => before)
      thread.send_message(user("a"))

      thread.update(field => after)
      error = assert_raises(Anthropic::Errors::Error) { thread.send_message(user("b")) }
      assert_raises(Anthropic::Errors::Error) { thread.stream(user("b")) }

      assert_includes(error.message, "Cannot change `#{field}` on a thread")
      assert_equal(field == :tools, error.message.end_with?("send `tool_addition` or `tool_removal` blocks in a `system` message."))
      assert_equal([1, "msg_1", 2], [@requests.length, thread.previous_message_id, thread.messages.length])

      thread.update(field => before)
      thread.send_message(user("b"))

      assert_equal([continue_from("msg_1"), [user_wire("b")]], bodies[1].values_at(:thread, :messages))
    end
  end

  def test_an_equal_system_or_tools_continues_the_thread
    serve(reply("msg_1"), reply("msg_2"), reply("msg_3"))
    fields = CREATE_ONLY_FIELDS.transform_values(&:first)
    thread = new_thread(**fields)
    thread.send_message(user("a"))

    thread.update(**copy(fields))
    thread.send_message(user("b"))
    thread.send_message(user("c"), **copy(fields))

    assert_equal([{type: "create"}, *%w[msg_1 msg_2].map { continue_from(_1) }], bodies.map { _1[:thread] })
  end

  def test_the_turn_that_creates_the_thread_sets_its_system_and_tools
    serve(reply("msg_1"), reply("msg_2"))
    thread = new_thread
    thread.send_message(user("a"), system_: "one", tools: TOOLS)

    thread.send_message(user("b"))

    assert_equal(continue_from("msg_1"), bodies[1][:thread])
    assert_equal(["one", TOOLS], thread.params.values_at(:system_, :tools))
  end

  def test_system_and_tools_can_change_when_the_next_turn_starts_a_new_thread
    serve(reply("msg_1"), reply("msg_2"))
    thread = new_thread(**CREATE_ONLY_FIELDS.transform_values(&:first))
    thread.send_message(user("a"))

    fork = thread.fork
    fork.update(system_: "two")
    fork.send_message(user("b"), tools: OTHER_TOOLS)

    assert_equal([{type: "create"}, "two", "other"], [bodies[1][:thread], bodies[1][:system], bodies[1][:tools].first[:name]])
  end

  def test_a_tool_change_appended_by_hand_goes_out_on_the_continue
    serve(reply("msg_1"), reply("msg_2"))
    thread = new_thread(tools: TOOLS, betas: ["inline-tools-2026-09-15"])
    thread.send_message(user("a"))

    thread.append({role: :system, content: [{type: :tool_removal, tool: {type: :tool_reference, name: "lookup"}}]})
    thread.send_message(user("b"))

    removal = {role: "system", content: [{type: "tool_removal", tool: {type: "tool_reference", name: "lookup"}}]}
    assert_equal([continue_from("msg_1"), [removal, user_wire("b")]], bodies[1].values_at(:thread, :messages))
    refute(bodies[1].key?(:tools))
  end

  def test_container_of_the_reply_is_sent_on_later_turns
    container = {id: "cont_1", expires_at: "2026-01-01T00:00:00Z"}
    [[{}, "cont_1"], [{container: "mine"}, "mine"], [{container: {skills: []}}, {skills: [], id: "cont_1"}]].each do |params, expected|
      start_over
      serve(reply("msg_1", container: container), reply("msg_2"))
      thread = new_thread(**params)

      thread.send_message(user("a"))
      thread.send_message(user("b"))

      assert_equal(expected, bodies.last[:container])
    end
  end

  def test_threads_beta_joins_the_caller_betas
    serve(reply("msg_1"), reply("msg_2"))
    thread = new_thread(betas: [THREADS_BETA.to_sym, "other-beta"])

    thread.send_message(user("a"))
    thread.send_message(user("b"))

    assert_equal([[THREADS_BETA, "other-beta"]] * 2, [betas(0), betas(1)])
  end

  def test_params_rebuild_a_thread
    serve(reply("msg_1", text: "one"), reply("msg_2"))
    tool = Lookup.new
    thread = new_thread(system_: "s", tools: [tool], request_options: {extra_headers: {"x-a" => "1"}})
    thread.send_message(user("a"))
    thread.update(inference_geo: "us")
    thread.append(user("b"))

    params = thread.params
    assert_raises(FrozenError) { params[:request_options][:extra_headers]["x-a"] = "2" }
    assert_same(tool, params[:tools].first)
    @client.beta.messages.thread(params).send_message

    assert_equal({type: "create"}, bodies[1][:thread])
    assert_equal([user_wire("a"), assistant_wire("one"), user_wire("b")], bodies[1][:messages])
    assert_equal(bodies[0].except(:messages, :thread), bodies[1].except(:messages, :thread, :inference_geo))
    assert_equal("us", bodies[1][:inference_geo])
    assert_equal("1", @requests[1][:headers]["X-A"])
  end

  def test_params_rebuild_the_unsupported_request_behavior
    unsupported = api_error(400, code: "thread_unsupported_request")
    serve(unsupported, reply("msg_1"), unsupported)
    lenient = new_thread(unsupported_request_behavior: :continue_unthreaded)

    @client.beta.messages.thread(**lenient.params).send_message(user("a"))
    assert_raises(Anthropic::Errors::BadRequestError) do
      @client.beta.messages.thread(**new_thread.params).send_message(user("b"))
    end

    assert_equal([{type: "create"}, nil, {type: "create"}], bodies.map { _1[:thread] })
    assert_equal([false] * 3, bodies.map { _1.key?(:unsupported_request_behavior) })
  end

  def test_the_thread_signatures_track_the_params_of_create
    rbi, rbs = %w[rbi/anthropic/resources/beta/messages.rbi sig/anthropic/resources/beta/messages.rbs].map do
      File.read(File.expand_path("../../../../#{_1}", __dir__))
    end
    keywords = (Anthropic::Models::Beta::MessageCreateParams.fields.keys - [:thread]) | [:unsupported_request_behavior, :request_options]
    types = ->(name) { rbi[/sig do\s+params\((?:(?!sig do).)*?def #{name}\(/m].scan(/Anthropic::Beta::(\w+)::OrHash/).flatten.uniq.sort }
    update = "Update `thread` in rbi/anthropic/resources/beta/messages.rbi and sig/anthropic/resources/beta/messages.rbs"

    assert_equal(keywords.sort, rbi[/def thread\((.*?)^        \)$/m, 1].scan(/^          (\w+):/).flatten.map(&:to_sym).sort, update)
    assert_equal(keywords.sort, rbs[/def thread: \((.*?)^        \) ->/m, 1].scan(/^          \??(\w+):/).flatten.map(&:to_sym).sort, update)
    assert_equal(types.call("create") - %w[BetaThreadCreateParams BetaThreadContinueParams], types.call("thread"), update)
  end

  def test_fork_is_independent
    serve(reply("msg_1", text: "one"), reply("msg_2", text: "two"), reply("msg_3"), reply("msg_4"))
    thread = new_thread(system_: "s", request_options: {extra_headers: {"x-a" => "1"}})
    thread.send_message(user("a"))
    thread.append(user("staged"))

    fork = thread.fork
    assert_nil(fork.previous_message_id)
    assert_equal(thread.messages, fork.messages)
    assert_equal(1, @requests.length)
    fork.update(inference_geo: "us")
    fork.send_message(user("b"))
    thread.send_message(user("c"))
    fork.send_message(user("d"))

    assert_equal({type: "create"}, bodies[1][:thread])
    assert_equal([user_wire("a"), assistant_wire("one"), user_wire("staged"), user_wire("b")], bodies[1][:messages])
    assert_equal(%w[s 1], [bodies[1][:system], @requests[1][:headers]["X-A"]])
    assert_equal(continue_from("msg_1"), bodies[2][:thread])
    assert_equal([user_wire("staged"), user_wire("c")], bodies[2][:messages])
    refute(bodies[2].key?(:inference_geo))
    assert_equal(continue_from("msg_2"), bodies[3][:thread])
    assert_equal(5, thread.messages.length)
    assert_equal(7, fork.messages.length)
  end

  def test_fork_keeps_the_unsupported_request_behavior
    unsupported = api_error(400, code: "thread_unsupported_request")
    serve(unsupported, reply("msg_1"), reply("msg_2"), unsupported)
    unthreaded = new_thread(unsupported_request_behavior: :continue_unthreaded)
    unthreaded.send_message(user("a"))

    unthreaded.fork.send_message(user("b"))
    assert_raises(Anthropic::Errors::BadRequestError) { new_thread.fork.send_message(user("c")) }

    assert_equal([{type: "create"}, nil, nil, {type: "create"}], bodies.map { _1[:thread] })
  end

  def test_an_output_format_given_as_a_schema_is_sent_as_given
    format_ = {type: :json_schema, schema: {type: "object"}}
    serve(reply("msg_1"), reply("msg_2"))
    thread = new_thread(output_format: format_)

    2.times { thread.send_message(user("a")) }

    assert_equal([{type: "json_schema", schema: {type: "object"}}] * 2, bodies.map { _1[:output_format] })
    assert_equal([false, false], bodies.map { _1.key?(:output_config) })
  end

  def test_a_model_class_output_format_is_parsed_and_names_no_other_beta
    serve(reply("msg_1", text: "{\"name\":\"n\"}"), streamed("msg_2", "{\"name\":\"m\"}"))
    thread = new_thread(output_config: {format: Answer, effort: :low})

    first = thread.send_message(user("a"))
    second = thread.stream(user("b")).accumulated_message

    assert_equal(%w[n m], [first.parsed_output.name, second.parsed_output.name])
    assert_equal([[THREADS_BETA]] * 2, [betas(0), betas(1)])
    assert_equal(bodies[0][:output_config], bodies[1][:output_config])
    assert_equal(%w[json_schema low], [bodies[0][:output_config][:format][:type], bodies[0][:output_config][:effort]])
  end

  def test_tool_inputs_are_parsed_on_a_continue
    tool_use = [{type: "tool_use", id: "toolu_1", name: "lookup", input: {query: "q"}}]
    serve(reply("msg_1"), reply("msg_2", content: tool_use, stop_reason: "tool_use"))
    thread = new_thread(tools: [Lookup.new])
    thread.send_message(user("a"))

    message = thread.send_message(user("b"))

    refute(bodies[1].key?(:tools))
    assert_equal("q", message.content.first.parsed.query)
    assert_equal({query: "q"}, message.content.first.input)
  end

  def test_thread_is_refused_on_providers_without_threads
    clients = [
      Anthropic::BedrockClient.new(aws_region: "us-east-1", api_key: "k"),
      Anthropic::BedrockMantleClient.new(aws_region: "us-east-1", api_key: "k"),
      Anthropic::VertexClient.new(region: "us-east5", project_id: "p")
    ]
    serve

    clients.each do |client|
      assert_raises(NotImplementedError) { new_thread(client: client) }
    end
    assert_empty(@requests)
  end

  def test_thread_creates_on_providers_that_pass_through
    clients = [
      Anthropic::AWSClient.new(aws_region: "us-east-1", api_key: "k", workspace_id: "w", base_url: "http://localhost"),
      Anthropic::GoogleCloudClient.new(project: "p", skip_auth: true, base_url: "http://localhost")
    ]
    serve(reply("msg_1"), reply("msg_2"))

    clients.each { new_thread(client: _1).send_message(user("a")) }

    assert_equal([{type: "create"}] * 2, bodies.map { _1[:thread] })
    assert_equal([THREADS_BETA], betas(0))
  end

  def message_start(id) = {type: "message_start", message: reply_body(id, [], nil)}

  def block_start(index, block) = {type: "content_block_start", index: index, content_block: block}

  def text_delta(index, text)
    {type: "content_block_delta", index: index, delta: {type: "text_delta", text: text}}
  end

  def json_delta(index, json)
    {type: "content_block_delta", index: index, delta: {type: "input_json_delta", partial_json: json}}
  end

  def block_stop(index) = {type: "content_block_stop", index: index}

  def message_delta(stop_reason = "end_turn", **usage)
    {type: "message_delta", delta: {stop_reason: stop_reason, stop_sequence: nil}, usage: {output_tokens: 2, **usage}}
  end

  def text_events(id, text, stop_reason: "end_turn", **)
    [
      message_start(id),
      block_start(0, {type: "text", text: ""}),
      text_delta(0, text),
      block_stop(0),
      message_delta(stop_reason, **),
      {type: "message_stop"}
    ]
  end

  def streamed(id, text = "ok", **) = sse(*text_events(id, text, **))

  # A stream whose body ends after the given number of events, before `message_stop`.
  def cut_off(id, text, events: 3) = sse(*text_events(id, text).first(events))

  def test_streamed_turn_creates_then_continues
    serve(streamed("msg_1", "one"), streamed("msg_2", "two"), reply("msg_3"))
    thread = new_thread(system_: "s")

    stream = thread.stream(user("a"))
    assert_kind_of(Anthropic::Streaming::MessageStream, stream)
    seen = stream.map { [_1.type, thread.previous_message_id] }
    assert_equal("two", thread.stream(user("b")).accumulated_text)
    thread.send_message(user("c"))

    assert_equal([:message_stop, "msg_1"], seen.last)
    assert_equal([nil], seen[0..-2].map(&:last).uniq)
    assert_equal("one", stream.accumulated_message.content.first.text)
    assert_equal([true, {type: "create"}, "s"], bodies[0].values_at(:stream, :thread, :system))
    assert_equal([true, continue_from("msg_1")], bodies[1].values_at(:stream, :thread))
    assert_equal([user_wire("b")], bodies[1][:messages])
    refute(bodies[1].key?(:system))
    assert_equal([false, continue_from("msg_2")], [bodies[2].key?(:stream), bodies[2][:thread]])
    assert_equal([THREADS_BETA], betas(1))
  end

  def test_every_request_names_the_helper
    serve(
      reply("msg_1"),
      api_error(404, code: "thread_not_found"),
      streamed("msg_2"),
      api_error(400, code: "thread_unsupported_request"),
      reply("msg_3"),
      reply("msg_4")
    )
    thread = new_thread(unsupported_request_behavior: :continue_unthreaded)

    thread.send_message(user("a"))
    thread.stream(user("b")).until_done
    thread.send_message(user("c"))
    thread.send_message(user("d"), request_options: {extra_headers: {"X-Stainless-Helper" => "mine, message-thread"}})

    assert_equal(
      [{type: "create"}, continue_from("msg_1"), {type: "create"}, continue_from("msg_2"), nil, nil],
      bodies.map { _1[:thread] }
    )
    assert_equal([*["message-thread"] * 5, "mine, message-thread"], helper_headers)
    refute(thread.params.key?(:request_options))
  end

  def test_stream_that_fails_before_message_start_takes_its_messages_back
    error = {type: "error", error: {type: "overloaded_error", message: "overloaded"}}
    [api_error(400), :drop, sse(error)].each do |failure|
      start_over
      serve(reply("msg_1"), failure, streamed("msg_2"))
      thread = new_thread
      thread.send_message(user("a"))
      before = thread.messages

      assert_raises(Anthropic::Errors::APIError) { thread.stream(user("b")).until_done }
      assert_equal(["msg_1", before], [thread.previous_message_id, thread.messages])
      thread.stream(user("b")).until_done

      assert_equal([continue_from("msg_1"), [user_wire("b")]], bodies[2].values_at(:thread, :messages))
    end
  end

  def test_stream_closed_before_message_start_takes_its_messages_back
    serve(reply("msg_1"), streamed("msg_2"), reply("msg_3"))
    thread = new_thread
    thread.send_message(user("a"))

    stream = thread.stream(user("b"))
    thread.append(user("c"))
    stream.close
    thread.send_message

    assert_equal([continue_from("msg_1"), [user_wire("c")]], bodies[2].values_at(:thread, :messages))
  end

  def test_stream_cut_after_message_start_keeps_its_messages
    [[1, []], [3, [assistant_wire("par")]]].each do |events, partial|
      start_over
      serve(reply("msg_1", text: "one"), cut_off("msg_2", "par", events: events), reply("msg_3"))
      thread = new_thread
      thread.send_message(user("a"))

      thread.stream(user("b")).until_done
      thread.send_message(user("c"))

      history = [user_wire("a"), assistant_wire("one"), user_wire("b"), *partial, user_wire("c")]
      assert_equal([{type: "create"}, history], bodies[2].values_at(:thread, :messages))
    end
  end

  def test_an_interrupt_while_the_stream_opens_ends_the_turn
    stub_request(:post, URL).to_return { raise(Interrupt) }
    thread = new_thread
    thread.append(user("a"))

    assert_raises(Interrupt) { thread.stream }
    start_over
    serve(reply("msg_1"))
    thread.send_message

    assert_equal([{type: "create"}, [user_wire("a")]], bodies[0].values_at(:thread, :messages))
  end

  def test_partial_reply_keeps_the_finished_blocks_and_unfinished_text
    tool_use = {type: "tool_use", id: "toolu_1", name: "lookup", input: {}}
    events = [
      *text_events("msg_1", "one").first(4),
      block_start(1, tool_use),
      json_delta(1, "{\"query\":\"q\"}"),
      block_stop(1),
      block_start(2, {type: "text", text: ""}),
      text_delta(2, "cut")
    ]
    [[events, %w[text tool_use text]], [events.first(6), %w[text]]].each do |served, recorded|
      start_over
      serve(sse(*served), reply("msg_2"))
      thread = new_thread(tools: TOOLS)

      thread.stream(user("a")).until_done
      assert_nil(thread.previous_message_id)
      assert_equal(recorded, thread.messages.last[:content].map { _1[:type].to_s })
      thread.send_message(user("b"))

      assert_equal({type: "create"}, bodies[1][:thread])
      assert_equal(%w[user assistant user], bodies[1][:messages].map { _1[:role] })
      assert_equal(recorded, bodies[1][:messages][1][:content].map { _1[:type] })
    end
  end

  def test_caller_stops_the_stream_early
    [->(stream) { stream.text.first }, ->(stream) { stream.first(3).then { stream.close } }].each do |stop|
      start_over
      serve(streamed("msg_1", "one"), reply("msg_2"))
      thread = new_thread

      stop.call(thread.stream(user("a")))
      assert_nil(thread.previous_message_id)
      thread.send_message(user("b"))

      assert_equal({type: "create"}, bodies[1][:thread])
      assert_equal([user_wire("a"), assistant_wire("one"), user_wire("b")], bodies[1][:messages])
    end
  end

  def test_stream_left_after_the_refusal_arrived_is_not_recorded
    refusal = text_events("msg_2", "no", stop_reason: "refusal")
    routes = [
      [refusal.first(5), :until_done.to_proc],
      [refusal, ->(stream) { stream.find { _1.type == :message_delta }.then { stream.close } }]
    ]
    routes.each do |events, leave|
      start_over
      serve(reply("msg_1", text: "one"), sse(*events), reply("msg_3"))
      thread = new_thread(system_: "s")
      thread.send_message(user("a"))
      thread.append(user("b"))
      before = thread.messages

      leave.call(thread.stream(user("bad")))
      assert_equal([nil, before], [thread.previous_message_id, thread.messages])
      thread.send_message(user("good"))

      assert_equal([continue_from("msg_1"), [user_wire("b"), user_wire("bad")]], bodies[1].values_at(:thread, :messages))
      sent = [user_wire("a"), assistant_wire("one"), user_wire("b"), user_wire("good")]
      assert_equal([{type: "create"}, sent, "s"], bodies[2].values_at(:thread, :messages, :system))
    end
  end

  def test_send_after_a_partial_reply_sends_the_turn_again
    serve(reply("msg_1", text: "one"), cut_off("msg_2", "par"), reply("msg_3", text: "three"), reply("msg_4"))
    thread = new_thread
    thread.send_message(user("a"))
    thread.append(user("b1"))
    thread.stream(user("b2")).until_done

    thread.send_message
    thread.send_message(user("c"))

    assert_equal({type: "create"}, bodies[2][:thread])
    assert_equal([user_wire("a"), assistant_wire("one"), user_wire("b1"), user_wire("b2")], bodies[2][:messages])
    assert_equal(continue_from("msg_3"), bodies[3][:thread])
    assert_equal(7, thread.messages.length)
  end

  def test_turn_sent_again_after_its_stream_was_cut_keeps_its_cache_markers
    serve(reply("msg_1", text: "one"), cut_off("msg_2", "par", events: 1), reply("msg_3"))
    thread = new_thread
    thread.send_message(marked("a"))
    thread.stream(marked("b")).until_done

    thread.send_message

    sent = [unmarked_wire("a"), assistant_wire("one"), marked_wire("b")]
    assert_equal([{type: "create"}, sent], bodies[2].values_at(:thread, :messages))
  end

  def test_messages_after_the_last_reply_keep_their_cache_markers
    blocks = %w[b1 b2].map { marked_wire(_1)[:content].first }
    serve(reply("msg_1", text: "one"), cut_off("msg_2", "par", events: 1), reply("msg_3"))
    thread = new_thread
    thread.send_message(marked("a"))
    thread.stream({role: :user, content: blocks}).until_done

    thread.send_message(marked("c"))

    sent = [unmarked_wire("a"), assistant_wire("one"), {role: "user", content: blocks}, marked_wire("c")]
    assert_equal([{type: "create"}, sent], bodies[2].values_at(:thread, :messages))
  end

  def test_rejected_send_after_a_partial_reply_leaves_the_thread_as_the_partial_reply_left_it
    serve(reply("msg_1", text: "one"), cut_off("msg_2", "par"), api_error(400), reply("msg_3"))
    thread = new_thread
    thread.send_message(user("a"))
    thread.stream(user("b")).until_done
    before = thread.messages

    assert_raises(Anthropic::Errors::BadRequestError) { thread.send_message(user("c")) }
    assert_equal(before, thread.messages)
    thread.send_message

    assert_equal({type: "create"}, bodies[3][:thread])
    assert_equal([user_wire("a"), assistant_wire("one"), user_wire("b")], bodies[3][:messages])
  end

  def test_send_during_a_stream_is_refused
    serve(streamed("msg_1", "one"), reply("msg_2"))
    thread = new_thread
    stream = thread.stream(user("a"))

    assert_raises(Anthropic::Errors::Error) { thread.send_message(user("x")) }
    assert_raises(Anthropic::Errors::Error) { thread.stream(user("x")) }
    assert_equal(1, @requests.length)
    stream.until_done
    thread.send_message(user("b"))

    assert_equal([continue_from("msg_1"), [user_wire("b")]], bodies[1].values_at(:thread, :messages))
  end

  def test_a_message_appended_during_a_stream_follows_the_reply
    serve(streamed("msg_1", "one"), reply("msg_2"))
    thread = new_thread
    stream = thread.stream(user("a"))

    thread.append(user("b"))
    stream.until_done
    thread.send_message

    assert_equal(%w[user assistant user assistant], thread.messages.map { _1[:role].to_s })
    assert_equal([continue_from("msg_1"), [user_wire("b")]], bodies[1].values_at(:thread, :messages))
  end

  def test_tool_inputs_are_parsed_on_a_streamed_continue
    events = [
      message_start("msg_2"),
      block_start(0, {type: "tool_use", id: "toolu_1", name: "lookup", input: {}}),
      json_delta(0, "{\"query\":"),
      json_delta(0, "\"q\"}"),
      block_stop(0),
      message_delta("tool_use"),
      {type: "message_stop"}
    ]
    serve(reply("msg_1"), sse(*events), reply("msg_3"))
    thread = new_thread(tools: [Lookup.new])
    thread.send_message(user("a"))

    message = thread.stream(user("b")).accumulated_message
    thread.fork.send_message(user("c"))

    refute(bodies[1].key?(:tools))
    assert_equal("q", message.content.first.parsed.query)
    assert_equal({type: "tool_use", id: "toolu_1", name: "lookup", input: {query: "q"}}, bodies[2][:messages][3][:content].first)
  end

  class LookupInput < Anthropic::BaseModel
    required :query, String
  end

  class Lookup < Anthropic::BaseTool
    doc "Looks something up"

    input_schema LookupInput

    def call(input) = "found #{input.query}"
  end

  class Answer < Anthropic::BaseModel
    required :name, String
  end
end
