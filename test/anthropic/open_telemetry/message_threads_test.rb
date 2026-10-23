# frozen_string_literal: true

require_relative "support"

class Anthropic::Test::OpenTelemetryMessageThreadsTest < Anthropic::Test::OpenTelemetryTestCase
  THREADS_BETA = "message-threads-2026-08-12"
  REQUEST = "anthropic.messages.create"
  TOOL_RUNNER = "anthropic.messages.tool_runner"
  TOOL_USE = "anthropic.custom_tool_use get_weather"

  class GetWeather < Anthropic::BaseTool
    class Input < Anthropic::BaseModel
      required :city, String
    end

    doc "Gets the weather"
    input_schema Input

    def call(_input) = "sunny"
  end

  def tool_use_message(id)
    MESSAGE.merge(
      id: id,
      content: [{type: "tool_use", id: "toolu_#{id}", name: "get_weather", input: {city: "Paris"}}],
      stop_reason: "tool_use"
    )
  end

  def message_events(message)
    blocks = message[:content].each_with_index.flat_map do |block, index|
      [{type: "content_block_start", index: index, content_block: block}, {type: "content_block_stop", index: index}]
    end
    delta = {stop_reason: message[:stop_reason], stop_sequence: nil}
    [
      {type: "message_start", message: message.merge(content: [], stop_reason: nil)},
      *blocks,
      {type: "message_delta", delta: delta, usage: {output_tokens: 5}},
      {type: "message_stop"}
    ]
  end

  def thread_not_found
    error = {type: "not_found_error", message: "no", details: {error_code: "thread_not_found"}}
    {status: 404, body: {type: "error", error: error}.to_json, headers: {"content-type" => "application/json"}}
  end

  # Serves each Message as the request asks for it, streamed or not, and any other response as it
  # is. Forgets the requests and the spans of the case before.
  def serve(*responses)
    WebMock.reset!
    @exporter.reset
    @requests = []
    stub_request(:post, MESSAGES_URL).to_return do |request|
      body = JSON.parse(request.body, symbolize_names: true)
      @requests << {body: body, headers: request.headers.transform_keys(&:downcase)}
      response = responses.fetch(@requests.length - 1)
      next response if response.key?(:status)
      next stream_response(message_events(response)) if body[:stream]

      {status: 200, body: response.to_json, headers: {"content-type" => "application/json"}}
    end
  end

  def params(**overrides)
    {
      **PARAMS,
      messages: [{role: :user, content: "Hi"}],
      system_: "Be brief.",
      tools: [GetWeather.new],
      request_options: {open_telemetry: {conversation_id: "conv_1"}, extra_headers: {"x-caller" => "yes"}},
      **overrides
    }
  end

  # What creates a tool runner, for each relation that a runner can have to a message thread.
  def runners(client = self.client, **)
    {
      unthreaded: -> { client.beta.messages.tool_runner(**params(**), thread: false) },
      own_thread: -> { client.beta.messages.tool_runner(**params(**)) },
      given_thread: -> { client.beta.messages.thread(**params(**)).tool_runner }
    }
  end

  DRIVES = {
    run_until_finished: :run_until_finished.to_proc,
    each_message: ->(runner) { runner.each_message { nil } },
    each_streaming: ->(runner) { runner.each_streaming(&:until_done) }
  }.freeze

  def request_spans = spans.select { _1.name == REQUEST }

  # Each span's name, parent, status and attributes, without the two attributes that cannot be alike.
  def trace
    names = spans.to_h { [_1.span_id, _1.name] }
    spans.map do |span|
      attributes = span.attributes.to_h.except("anthropic.beta", "gen_ai.response.time_to_first_chunk")
      [span.name, names[span.parent_span_id], span.status.code, attributes]
    end
  end

  def test_a_tool_runner_on_a_thread_is_traced_as_one_without
    DRIVES.each do |drive, run|
      traces = runners.transform_values do |runner|
        serve(tool_use_message("msg_1"), MESSAGE.merge(id: "msg_2"))
        run.call(runner.call)
        trace
      end

      assert_equal(
        [[REQUEST, TOOL_RUNNER, OK], [TOOL_USE, TOOL_RUNNER, OK], [REQUEST, TOOL_RUNNER, OK], [TOOL_RUNNER, nil, OK]],
        traces.fetch(:unthreaded).map { _1.first(3) },
        drive
      )
      assert_equal(["conv_1"], traces.fetch(:unthreaded).map { _1.last["gen_ai.conversation.id"] }.uniq, drive)
      assert_equal(traces.fetch(:unthreaded), traces.fetch(:own_thread), drive)
      assert_equal(traces.fetch(:unthreaded), traces.fetch(:given_thread), drive)
    end
  end

  def test_the_request_options_of_a_tool_runner_reach_each_request_of_its_thread
    compacted = MESSAGE.merge(
      id: "msg_compacted",
      content: [{type: "compaction", content: "Summary so far.", signature: "sig_01"}],
      stop_reason: "compaction"
    )
    runners.each do |name, runner|
      serve(tool_use_message("msg_1"), tool_use_message("msg_2"), compacted, MESSAGE.merge(id: "msg_3"))
      runner = runner.call
      runner.each_message { runner.compact_before_next_turn if _1.id == "msg_2" }

      assert_equal(4, @requests.length, name)
      assert_equal(["yes"] * 4, @requests.map { _1[:headers]["x-caller"] }, name)
      assert_equal(["conv_1"] * 4, request_spans.map { _1.attributes["gen_ai.conversation.id"] }, name)
      # Each request carries the context of its own span.
      assert_equal(request_spans.map(&:hex_span_id), @requests.map { _1[:headers]["traceparent"].split("-")[2] }, name)
    end
  end

  def test_the_spans_of_a_tool_runner_on_a_thread_start_with_their_attributes_for_a_sampler_to_read
    schema = {type: "object", properties: {summary: {type: "string"}}, required: ["summary"]}
    output_config = {format: {type: :json_schema, schema: schema}}
    started = runners(output_config: output_config, betas: %w[beta-a]).transform_values do |runner|
      serve(tool_use_message("msg_1"), MESSAGE.merge(id: "msg_2"))
      sampler = recording_sampler
      runner.call.run_until_finished
      sampler.started
    end

    unthreaded = started.fetch(:unthreaded)
    assert_equal([TOOL_RUNNER, REQUEST, TOOL_USE, REQUEST], unthreaded.map(&:first))
    assert_equal([nil, %w[beta-a], nil, %w[beta-a]], unthreaded.map { _2["anthropic.beta"] })
    # The beta of message threads is the one difference, as it is in the requests.
    threaded = unthreaded.map do |name, attributes|
      [name, name == REQUEST ? {**attributes, "anthropic.beta" => ["beta-a", THREADS_BETA]} : attributes]
    end
    assert_equal(threaded, started.fetch(:own_thread))
    assert_equal(threaded, started.fetch(:given_thread))
  end

  def test_the_content_of_a_request_span_is_that_of_the_request_that_was_sent
    first = {"role" => "user", "parts" => [{"type" => "text", "content" => "Hi"}]}
    response = {"type" => "tool_call_response", "id" => "toolu_msg_1", "response" => [{"type" => "text", "text" => "sunny"}]}
    sent = {unthreaded: [1, 3], own_thread: [1, 1], given_thread: [1, 1]}

    DRIVES.each do |drive, run|
      runners(content_client).each do |name, runner|
        serve(tool_use_message("msg_1"), MESSAGE.merge(id: "msg_2"))
        run.call(runner.call)

        bodies = @requests.map { _1[:body] }
        inputs = request_spans.map { json_attribute(_1, "gen_ai.input.messages") }
        assert_equal(sent.fetch(name), bodies.map { _1[:messages].length }, [drive, name])
        assert_equal(bodies.map { |body| body[:messages].map { _1[:role] } }, inputs.map { |input| input.map { _1["role"] } })
        assert_equal([first], inputs.first, [drive, name])
        assert_equal({"role" => "user", "parts" => [response]}, inputs.last.last, [drive, name])
        assert_equal(
          bodies.map { _1.key?(:system) },
          request_spans.map { _1.attributes.key?("gen_ai.system_instructions") },
          [drive, name]
        )
      end
    end
  end

  def test_a_turn_that_the_thread_sends_again_has_a_span_for_each_request
    DRIVES.each do |drive, run|
      serve(tool_use_message("msg_1"), thread_not_found, MESSAGE.merge(id: "msg_2"))
      run.call(runners.fetch(:own_thread).call)

      tool_runner_span = only_span(TOOL_RUNNER)
      assert_equal(OK, tool_runner_span.status.code, drive)
      assert_equal([OK, ERROR, OK], request_spans.map { _1.status.code }, drive)
      assert_equal([nil, "not_found_error", nil], request_spans.map { _1.attributes["error.type"] }, drive)
      assert_equal([tool_runner_span.span_id] * 3, request_spans.map(&:parent_span_id), drive)
      assert_equal(["conv_1"] * 3, request_spans.map { _1.attributes["gen_ai.conversation.id"] }, drive)
      assert_equal(["yes"] * 3, @requests.map { _1[:headers]["x-caller"] }, drive)
    end
  end

  def test_a_stream_that_ends_before_the_reply_starts_fails_its_span_and_not_the_tool_runner_on_a_thread
    serve(stream_response([{type: "ping"}]))

    assert_empty(runners.fetch(:own_thread).call.run_until_finished)
    assert_equal(ERROR, only_span(REQUEST).status.code)
    assert_equal(OK, only_span(TOOL_RUNNER).status.code)
  end

  def test_a_tool_runner_on_a_thread_with_spans_disabled_emits_none
    runners(client(open_telemetry: false)).each do |name, runner|
      serve(tool_use_message("msg_1"), MESSAGE.merge(id: "msg_2"))

      assert_equal(%w[msg_1 msg_2], runner.call.run_until_finished.map(&:id), name)
      assert_empty(spans, name)
    end
  end

  def test_each_turn_of_a_thread_has_the_span_of_its_request
    serve(MESSAGE, MESSAGE.merge(id: "msg_2"))
    thread = client.beta.messages.thread(**params)

    thread.send_message
    thread.stream({role: :user, content: "More"}).until_done

    assert_equal([[REQUEST, nil, OK]] * 2, trace.map { _1.first(3) })
    assert_equal(%w[msg_1 msg_2], spans.map { _1.attributes["gen_ai.response.id"] })
    assert_equal(["conv_1"] * 2, spans.map { _1.attributes["gen_ai.conversation.id"] })
    assert_equal([[THREADS_BETA]] * 2, spans.map { _1.attributes["anthropic.beta"] })
  end
end
