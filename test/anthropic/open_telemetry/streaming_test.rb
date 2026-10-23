# frozen_string_literal: true

require_relative "support"

# The tests stop reading streams early on purpose.
# rubocop:disable Lint/EmptyBlock, Lint/UnreachableLoop
class Anthropic::Test::OpenTelemetryStreamingTest < Anthropic::Test::OpenTelemetryTestCase
  RESOURCES = {messages: MESSAGES_URL, beta_messages: MESSAGES_URL}.freeze

  def messages_resource(c, name) = name == :beta_messages ? c.beta.messages : c.messages

  def test_a_streaming_call_ends_its_span_when_the_stream_has_been_read
    stub_messages(stream_response)
    stream = client.messages.stream_raw(**PARAMS)
    assert_empty(spans)

    stream.each {}

    span = only_span
    assert_equal("anthropic.messages.create", span.name)
    assert_equal(OK, span.status.code)
    assert_equal(true, span.attributes["gen_ai.request.stream"])
    assert_equal("msg_1", span.attributes["gen_ai.response.id"])
    assert_equal(15, span.attributes["gen_ai.usage.input_tokens"])
    assert_equal(5, span.attributes["gen_ai.usage.output_tokens"])
    assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
    assert_kind_of(Float, span.attributes["gen_ai.response.time_to_first_chunk"])
  end

  RESOURCES.each do |name, url|
    define_method(:"test_a_traced_#{name}_stream_reads_as_the_untraced_one_does") do
      response = stream_response
      response = {**response, headers: {**response[:headers], "anthropic-workspace-id" => "wrkspc_1"}}
      stub_messages(response, response, url: url)
      traced = messages_resource(client, name).stream_raw(**PARAMS)
      untraced = messages_resource(client(open_telemetry: false), name).stream_raw(**PARAMS)

      assert_instance_of(Anthropic::Internal::TracedStream, traced)
      assert_equal(200, traced.status)
      assert_equal(untraced.headers, traced.headers)
      assert_equal("req_1", traced.request_id)
      assert_equal("wrkspc_1", traced.workspace_id)
      assert_includes(traced.inspect, "RawMessageStreamEvent")
      assert_equal(untraced.map(&:to_h), traced.map(&:to_h))
    end

    define_method(:"test_the_#{name}_stream_helper_of_a_traced_call_has_what_its_raw_stream_has") do
      stub_messages(stream_response, url: url)
      stream = messages_resource(client, name).stream(**PARAMS)

      assert_equal(200, stream.status)
      assert_equal("req_1", stream.request_id)
      assert_includes(stream.inspect, "RawMessageStreamEvent")
      stream.close
    end
  end

  def test_a_traced_stream_adds_no_writer_to_the_methods_of_the_untraced_one
    stub_messages(stream_response, stream_response)
    traced = client.messages.stream_raw(**PARAMS)
    untraced = client(open_telemetry: false).messages.stream_raw(**PARAMS)

    assert_instance_of(Anthropic::Internal::Stream, untraced)
    assert_empty(untraced.public_methods - traced.public_methods)
    assert_equal([:streamed_message], traced.public_methods - untraced.public_methods)
    assert_empty(traced.public_methods.grep(/=\z/) - Object.instance_methods)
    [traced, untraced].each(&:close)
  end

  def test_a_call_without_a_recording_span_returns_the_stream_itself
    stub_messages(stream_response, stream_response, stream_response)
    @provider.sampler = OpenTelemetry::SDK::Trace::Samplers::ALWAYS_OFF
    unregistered = with_global_provider(OpenTelemetry::Trace::TracerProvider.new) do
      Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key").messages.stream_raw(**PARAMS)
    end
    streams = [
      client.messages.stream_raw(**PARAMS),
      client(open_telemetry: false).messages.stream_raw(**PARAMS),
      unregistered
    ]

    streams.each do |stream|
      assert_instance_of(Anthropic::Internal::Stream, stream)
      assert_equal(STREAM_EVENTS.length, stream.count)
    end
    assert_empty(spans)
  end

  def test_the_span_is_not_current_while_the_application_reads_the_stream
    stub_messages(stream_response)
    stream = client.messages.stream_raw(**PARAMS)

    current = nil
    stream.each { current = OpenTelemetry::Trace.current_span }
    refute_equal(only_span.span_id, current.context.span_id)
  end

  def test_the_stream_helper_emits_the_same_span
    stub_messages(stream_response)
    client.messages.stream(**PARAMS).until_done

    span = only_span
    assert_equal("anthropic.messages.create", span.name)
    assert_equal(OK, span.status.code)
    assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
  end

  def test_a_stream_a_fallback_model_takes_over_reports_that_model
    fallback = {
      type: "fallback",
      from: {model: "claude-sonnet-4-5-20250929"},
      to: {model: "claude-haiku-4-5-20251001"},
      trigger: {type: "refusal", category: "cyber"}
    }
    events = [
      STREAM_EVENTS.first,
      {type: "content_block_start", index: 0, content_block: fallback},
      {type: "content_block_stop", index: 0},
      {type: "content_block_start", index: 1, content_block: {type: "text", text: ""}},
      {type: "content_block_delta", index: 1, delta: {type: "text_delta", text: "Hi"}},
      {type: "content_block_stop", index: 1},
      *STREAM_EVENTS.last(2)
    ]
    stub_messages(stream_response(events), stream_response(events), url: MESSAGES_URL)
    c = client
    c.beta.messages.stream_raw(**PARAMS).each {}
    message = c.beta.messages.stream(**PARAMS).accumulated_message

    assert_equal("claude-haiku-4-5-20251001", message.model.to_s)
    assert_equal(2, spans.length)
    spans.each do |span|
      assert_equal("claude-sonnet-4-5", span.attributes["gen_ai.request.model"])
      assert_equal("claude-haiku-4-5-20251001", span.attributes["gen_ai.response.model"])
      assert_equal(OK, span.status.code)
    end
  end

  def test_a_stream_reports_the_tokens_of_compactions_once_it_has_read_them
    sampling = {**COMPACTION, type: "message"}
    iterations = [COMPACTION, sampling, {**COMPACTION, input_tokens: 1, output_tokens: 2}]
    delta = STREAM_EVENTS[4]
    delta = {**delta, usage: {**delta[:usage], iterations: iterations}}
    events = [*STREAM_EVENTS[0..3], delta, STREAM_EVENTS.last]
    responses = [events, events, events, events[0..4]].map { stream_response(_1) }
    stub_messages(*responses, url: MESSAGES_URL)

    client.beta.messages.stream_raw(**PARAMS).each {}
    client.beta.messages.stream(**PARAMS).until_done
    content_client.beta.messages.stream(**PARAMS).until_done
    client.beta.messages.stream_raw(**PARAMS).each {}

    # The last stream ends before `message_stop`, after the `message_delta` that has the final counts.
    assert_equal([OK, OK, OK, ERROR], spans.map { _1.status.code })
    assert_equal([[147, 42]] * 4, spans.map { _1.attributes.values_at(*COMPACTION_TOKENS) })
    assert_equal([5, 5, 5, 5], spans.map { _1.attributes["gen_ai.usage.output_tokens"] })
  end

  def test_a_stream_the_application_closes_early_leaves_the_status_unset
    stub_messages(stream_response)
    stream = client.messages.stream_raw(**PARAMS)
    stream.each { break }

    span = only_span
    assert_equal(UNSET, span.status.code)
    assert_equal("msg_1", span.attributes["gen_ai.response.id"])
    assert_equal(15, span.attributes["gen_ai.usage.input_tokens"])
    assert_nil(span.attributes["gen_ai.usage.output_tokens"])
    assert_nil(span.attributes["anthropic.message.stop_reason"])
    assert_nil(span.attributes["gen_ai.response.time_to_first_chunk"])
  end

  def test_closing_a_stream_before_reading_it_ends_its_span
    stub_messages(stream_response)
    client.messages.stream_raw(**PARAMS).close

    assert_equal(UNSET, only_span.status.code)
  end

  def test_closing_the_stream_helper_before_reading_it_ends_its_span
    stub_messages(stream_response)
    client.messages.stream(**PARAMS).close

    assert_equal(UNSET, only_span.status.code)
  end

  def test_closing_a_stream_after_its_last_event_and_before_the_server_ends_it_leaves_the_status_unset
    RESOURCES.each do |name, url|
      stub_messages(stream_response, stream_response, url: url)
      c = client
      enum = messages_resource(c, name).stream_raw(**PARAMS).to_enum
      STREAM_EVENTS.length.times { enum.next }
      enum.rewind
      messages_resource(c, name).stream_raw(**PARAMS).each { break if _1.type == :message_stop }
    end

    assert_equal(4, spans.length)
    spans.each do |span|
      assert_equal(UNSET, span.status.code)
      assert_nil(span.attributes["error.type"])
      assert_equal("msg_1", span.attributes["gen_ai.response.id"])
      assert_equal(5, span.attributes["gen_ai.usage.output_tokens"])
      assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
      assert_kind_of(Float, span.attributes["gen_ai.response.time_to_first_chunk"])
    end
  end

  def test_reading_a_stream_until_the_server_ends_it_is_reading_all_of_it
    RESOURCES.each do |name, url|
      stub_messages(stream_response, url: url)
      enum = messages_resource(client, name).stream_raw(**PARAMS).to_enum
      ended = spans.length
      STREAM_EVENTS.length.times { enum.next }
      assert_equal(ended, spans.length)
      assert_raises(StopIteration) { enum.next }
    end

    assert_equal([OK, OK], spans.map { _1.status.code })
  end

  def test_an_error_the_application_raises_while_reading_a_stream_leaves_the_status_unset
    stub_messages(stream_response)
    stream = client.messages.stream_raw(**PARAMS)
    assert_raises(RuntimeError) { stream.each { raise "stop" } }

    span = only_span
    assert_equal(UNSET, span.status.code)
    assert_nil(span.attributes["error.type"])
  end

  def test_a_stream_the_server_ends_before_message_stop_fails_the_span_but_not_the_read
    stub_messages(stream_response(STREAM_EVENTS[0..3]))
    events = client.messages.stream_raw(**PARAMS).map(&:type)

    assert_equal([:message_start, :content_block_start, :content_block_delta, :content_block_stop], events)
    span = only_span
    assert_equal(ERROR, span.status.code)
    assert_equal("api_error", span.attributes["error.type"])
    assert_equal("msg_1", span.attributes["gen_ai.response.id"])
    assert_nil(span.attributes["anthropic.message.stop_reason"])
  end

  def test_a_stream_that_ends_before_message_stop_has_the_final_counts_once_it_has_read_message_delta
    delta = STREAM_EVENTS[4]
    usage = {**delta[:usage], output_tokens_details: {thinking_tokens: 3}, iterations: [COMPACTION]}
    final = [
      "anthropic.message.stop_reason",
      "gen_ai.usage.output_tokens",
      "gen_ai.usage.reasoning.output_tokens",
      *COMPACTION_TOKENS
    ]

    RESOURCES.each do |name, url|
      @exporter.reset
      stub_messages(
        stream_response([*STREAM_EVENTS[0..3], {**delta, usage: usage}]),
        stream_response(STREAM_EVENTS[0..3]),
        url: url
      )
      2.times { messages_resource(client, name).stream_raw(**PARAMS).each {} }

      # Both streams fail the same way, and both have what `message_start` gave them.
      started = %w[error.type gen_ai.usage.input_tokens]
      assert_equal([["api_error", 15]] * 2, spans.map { _1.attributes.values_at(*started) })
      assert_equal(["end_turn", 5, 3, 123, 40], spans.first.attributes.values_at(*final))
      assert_equal([nil] * 5, spans.last.attributes.values_at(*final))
    end
  end

  def test_a_read_that_fails_after_message_stop_fails_the_span
    stub_messages(stream_response)
    events = []
    # The read fails once the whole body, `message_stop` included, has been read.
    stream = client(middleware: [DROPPED_CONNECTION]).messages.stream_raw(**PARAMS)
    assert_raises(IOError) { stream.each { events << _1.type } }

    assert_equal(:message_stop, events.last)
    span = only_span
    # Reading `message_stop` alone does not make the span `OK`: `error.type` never goes with `OK`.
    assert_equal(ERROR, span.status.code)
    assert_equal("client_error", span.attributes["error.type"])
    assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
  end

  def test_a_request_that_cannot_be_recorded_does_not_change_how_the_span_of_a_stream_ends
    stub_messages(stream_response, stream_response)
    # A model that serializes for the API, but whose string form the span cannot take.
    model = Object.new
    def model.to_s = raise("unreadable")
    def model.to_json(*) = '"claude-sonnet-4-5"'
    c = client
    c.messages.stream_raw(**PARAMS, model: model).each {}
    c.messages.stream(**PARAMS, model: model).until_done

    assert_equal(2, spans.length)
    spans.each do |span|
      assert_nil(span.attributes["gen_ai.request.model"])
      assert_equal(OK, span.status.code)
      assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
    end
  end

  def test_content_that_cannot_be_recorded_does_not_change_how_the_span_of_a_stream_ends
    stub_messages(stream_response, stream_response)
    # A text that serializes for the API, but whose string form the span cannot take.
    text = Object.new
    def text.to_s = raise("unreadable")
    def text.to_json(*) = '"Hi"'
    messages = [{role: :user, content: [{type: :text, text: text}]}]
    c = content_client
    c.messages.stream_raw(**PARAMS, messages: messages).each {}
    c.messages.stream(**PARAMS, messages: messages).until_done

    assert_equal(2, spans.length)
    spans.each do |span|
      assert_nil(span.attributes["gen_ai.input.messages"])
      assert_equal(OK, span.status.code)
      assert_equal("msg_1", span.attributes["gen_ai.response.id"])
      assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
    end
  end

  # The start of a stream, up to its first `content_block_delta`: a `ping` comes before it too.
  UNTIL_FIRST_DELTA = <<~SSE
    event: message_start
    data: {"type":"message_start","message":{"id":"msg_1","type":"message","role":"assistant","model":"claude-sonnet-4-5-20250929","content":[],"stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

    event: ping
    data: {"type":"ping"}

    event: content_block_start
    data: {"type":"content_block_start","index":0,"content_block":{"type":"text","text":""}}

  SSE

  FIRST_DELTA = <<~SSE
    event: content_block_delta
    data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"H"}}

  SSE

  AFTER_FIRST_DELTA = <<~SSE
    event: content_block_delta
    data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"i"}}

    event: content_block_stop
    data: {"type":"content_block_stop","index":0}

    event: message_delta
    data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":5}}

    event: message_stop
    data: {"type":"message_stop"}

  SSE

  # A whole stream whose one content block arrives in its `content_block_start`, so without a delta.
  WITHOUT_A_DELTA = <<~SSE
    event: message_start
    data: {"type":"message_start","message":{"id":"msg_1","type":"message","role":"assistant","model":"claude-sonnet-4-5-20250929","content":[],"stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":10,"output_tokens":1}}}

    event: ping
    data: {"type":"ping"}

    event: content_block_start
    data: {"type":"content_block_start","index":0,"content_block":{"type":"redacted_thinking","data":"abc"}}

    event: content_block_stop
    data: {"type":"content_block_stop","index":0}

    event: message_delta
    data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":5}}

    event: message_stop
    data: {"type":"message_stop"}

  SSE

  PAUSE = 0.05

  # A middleware that answers with `chunks` as the body of the response, with a pause before each
  # one but the first, as from a server that takes its time.
  def pausing(*chunks)
    lambda do |req, nxt|
      res = nxt.call(req)
      body = Enumerator.new do |y|
        # Reading the stubbed body to its end frees its connection.
        res.body.each {}
        chunks.each_with_index do |chunk, index|
          # The real `sleep`: the one that the tests have only counts.
          _sleep(PAUSE) if index.positive?
          y << chunk
        end
      end
      Anthropic::APIResponse.new(
        status: res.status,
        headers: res.headers,
        body: body,
        raw: res.raw,
        streaming: true,
        request: res.request
      )
    end
  end

  def test_the_time_to_first_chunk_runs_to_the_first_content_block_delta
    # For each stream, the longest that its first delta can have taken: from before the call to the
    # application having the event.
    longest = RESOURCES.map do |name, url|
      stub_messages(stream_response, url: url)
      c = client(middleware: [pausing(UNTIL_FIRST_DELTA, FIRST_DELTA, AFTER_FIRST_DELTA)])
      start = Anthropic::Internal::Util.monotonic_secs
      first_delta = nil
      events = messages_resource(c, name).stream_raw(**PARAMS).map do |event|
        first_delta ||= Anthropic::Internal::Util.monotonic_secs if event.type == :content_block_delta
        event.type
      end

      deltas = [:content_block_delta, :content_block_delta]
      assert_equal([:message_start, :content_block_start, *deltas, :content_block_stop], events[0..4])
      first_delta - start
    end

    assert_equal([OK, OK], spans.map { _1.status.code })
    spans.zip(longest) do |span, most|
      time = span.attributes["gen_ai.response.time_to_first_chunk"]
      # `message_start`, the `ping` and `content_block_start` came at once, and the first delta a pause later.
      assert_operator(time, :>=, PAUSE)
      # The second delta came another pause later.
      assert_operator(time, :<=, most)
    end
  end

  def test_a_stream_without_a_content_block_delta_has_no_time_to_first_chunk
    RESOURCES.each do |name, url|
      stub_messages(stream_response, url: url)
      c = client(middleware: [pausing(WITHOUT_A_DELTA)])
      events = messages_resource(c, name).stream_raw(**PARAMS).map(&:type)
      assert_equal(
        [:message_start, :content_block_start, :content_block_stop, :message_delta, :message_stop],
        events
      )
    end

    assert_equal(2, spans.length)
    spans.each do |span|
      assert_equal(OK, span.status.code)
      assert_equal("msg_1", span.attributes["gen_ai.response.id"])
      assert_equal("end_turn", span.attributes["anthropic.message.stop_reason"])
      assert_nil(span.attributes["gen_ai.response.time_to_first_chunk"])
    end
  end

  def test_a_content_block_delta_of_any_type_sets_the_time_to_first_chunk
    tool_use = {type: "tool_use", id: "toolu_1", name: "get_weather", input: {}}
    thinking = {type: "thinking", thinking: "", signature: ""}
    citation = {
      type: "char_location",
      cited_text: "Hi",
      document_index: 0,
      document_title: nil,
      start_char_index: 0,
      end_char_index: 2
    }
    blocks = [
      [tool_use, {type: "input_json_delta", partial_json: "{}"}],
      [thinking, {type: "thinking_delta", thinking: "Hm"}],
      [thinking, {type: "signature_delta", signature: "abc"}],
      [{type: "text", text: "Hi"}, {type: "citations_delta", citation: citation}],
      # A delta that this version of the SDK does not know.
      [{type: "text", text: ""}, {type: "later_delta", value: "x"}]
    ]
    streams = blocks.map do |content_block, delta|
      [
        STREAM_EVENTS.first,
        {type: "content_block_start", index: 0, content_block: content_block},
        {type: "content_block_delta", index: 0, delta: delta},
        *STREAM_EVENTS.last(3)
      ]
    end
    RESOURCES.each do |name, url|
      stub_messages(*streams.map { stream_response(_1) }, url: url)
      c = client
      streams.each do |events|
        read = messages_resource(c, name).stream_raw(**PARAMS).map(&:type)
        assert_equal(events.map { _1[:type].to_sym }, read)
      end
    end

    assert_equal(2 * streams.length, spans.length)
    spans.each do |span|
      assert_equal(OK, span.status.code)
      assert_kind_of(Float, span.attributes["gen_ai.response.time_to_first_chunk"])
    end
  end

  def test_an_error_event_fails_the_span_with_its_type
    events = [STREAM_EVENTS.first, {type: "error", error: {type: "overloaded_error", message: "x"}}]
    stub_messages(stream_response(events))
    stream = client.messages.stream_raw(**PARAMS)
    assert_raises(Anthropic::Errors::APIStatusError) { stream.each {} }

    span = only_span
    assert_equal(ERROR, span.status.code)
    assert_equal("overloaded_error", span.attributes["error.type"])
  end

  def test_the_stream_keeps_its_enumerator_protocol
    stub_messages(stream_response)
    enum = client.messages.stream_raw(**PARAMS).to_enum

    assert_equal(:message_start, enum.next.type)
    assert_equal(:content_block_start, enum.peek.type)
    assert_equal(:content_block_start, enum.next.type)
  end

  def test_a_second_iteration_of_a_stream_does_not_end_the_span_of_the_first
    stub_messages(stream_response)
    stream = client.messages.stream_raw(**PARAMS)
    enum = stream.to_enum
    enum.next

    stream.each {}
    assert_empty(spans)
  end

  def stub_session_events(*events)
    url = "#{BASE_URL}/v1/sessions/sess_1/events/stream"
    stub_request(:get, url).to_return(
      status: 200,
      body: sse(*events),
      headers: {"content-type" => "text/event-stream"}
    )
  end

  SESSION_EVENT = {type: "session.status_idle", id: "evt_1", processed_at: "2026-01-01T00:00:00Z"}.freeze

  def test_closing_a_session_event_stream_leaves_the_status_unset
    stub_session_events(SESSION_EVENT, SESSION_EVENT)
    client.beta.sessions.events.stream_events("sess_1").each { break }
    client.beta.sessions.events.stream_events("sess_1").close

    assert_equal(["anthropic.sessions.events.stream"] * 2, spans.map(&:name))
    assert_equal([UNSET, UNSET], spans.map { _1.status.code })
    assert_equal([nil, nil], spans.map { _1.attributes["error.type"] })
  end

  def test_a_session_event_stream_the_server_ends_leaves_the_status_unset
    stub_session_events(SESSION_EVENT)
    assert_equal(1, client.beta.sessions.events.stream_events("sess_1").to_a.length)

    # An event stream has no end event, so it is never read to the end: the server ending it sets no status.
    span = only_span("anthropic.sessions.events.stream")
    refute_nil(span.end_timestamp)
    assert_equal(UNSET, span.status.code)
    assert_nil(span.attributes["error.type"])
    assert_equal(200, span.attributes["http.response.status_code"])
    assert_equal("anthropic", span.attributes["gen_ai.provider.name"])
  end
end
# rubocop:enable Lint/EmptyBlock, Lint/UnreachableLoop
