# frozen_string_literal: true

require_relative "support"

# The tests stop reading streams early on purpose.
# rubocop:disable Lint/EmptyBlock
class Anthropic::Test::OpenTelemetryApiCallTest < Anthropic::Test::OpenTelemetryTestCase
  def test_messages_create_emits_a_client_span_with_the_request_and_response_attributes
    stub_messages(
      {
        status: 200,
        body: MESSAGE.to_json,
        headers: {
          "request-id" => "req_1",
          "anthropic-organization-id" => "org_1",
          "anthropic-workspace-id" => "wrk_1"
        }
      }
    )

    client.messages.create(
      **PARAMS,
      temperature: 1,
      top_p: 0.5,
      top_k: 3,
      service_tier: :auto,
      thinking: {type: :enabled, budget_tokens: 1024},
      output_config: {effort: :high},
      request_options: {open_telemetry: {conversation_id: "conv_1"}}
    )

    span = only_span
    assert_equal("anthropic.messages.create", span.name)
    assert_equal(:client, span.kind)
    assert_equal(OK, span.status.code)
    assert_equal("com.anthropic.sdk.ruby", scope(span).name)
    assert_equal(Anthropic::VERSION, scope(span).version)
    assert_equal(
      {
        "server.address" => "localhost",
        "server.port" => 4010,
        "http.request.method" => "POST",
        "http.route" => "/v1/messages",
        "url.scheme" => "http",
        "url.path" => "/v1/messages",
        "url.full" => "http://localhost:4010/v1/messages",
        "http.response.status_code" => 200,
        "anthropic.request.id" => "req_1",
        "anthropic.organization.id" => "org_1",
        "anthropic.workspace.id" => "wrk_1",
        "gen_ai.provider.name" => "anthropic",
        "gen_ai.conversation.id" => "conv_1",
        "gen_ai.operation.name" => "chat",
        "gen_ai.request.model" => "claude-sonnet-4-5",
        "gen_ai.request.max_tokens" => 100,
        "gen_ai.request.temperature" => 1.0,
        "gen_ai.request.top_p" => 0.5,
        "gen_ai.request.top_k" => 3,
        "gen_ai.request.reasoning.level" => "high",
        "anthropic.request.service_tier" => "auto",
        "anthropic.thinking.type" => "enabled",
        "anthropic.thinking.budget_tokens" => 1024,
        "gen_ai.response.id" => "msg_1",
        "gen_ai.response.model" => "claude-sonnet-4-5-20250929",
        "anthropic.message.stop_reason" => "end_turn",
        "gen_ai.usage.input_tokens" => 15,
        "gen_ai.usage.output_tokens" => 5,
        "gen_ai.usage.cache_write.input_tokens" => 3,
        "gen_ai.usage.cache_read.input_tokens" => 2,
        "anthropic.usage.cache_creation.ephemeral_5m_input_tokens" => 1,
        "anthropic.usage.cache_creation.ephemeral_1h_input_tokens" => 2,
        "anthropic.response.service_tier" => "standard"
      },
      span.attributes.to_h
    )
  end

  class Forecast < Anthropic::BaseModel
    required :summary, String
  end

  def test_a_request_with_a_json_output_format_has_the_json_output_type
    schema = {type: "object", properties: {summary: {type: "string"}}, required: ["summary"]}
    message = {status: 200, body: MESSAGE.to_json, headers: {"content-type" => "application/json"}}
    stub_request(:post, MESSAGES_URL).to_return(message, message, stream_response, message)
    stub_request(:post, "#{MESSAGES_URL}?beta=true").to_return(stream_response)
    c = client
    c.messages.create(**PARAMS, output_config: {format: {type: :json_schema, schema: schema}})
    c.messages.create(**PARAMS, output_config: {"format" => {"type" => "json_schema", "schema" => schema}})
    # The structured output helper turns the model class into `output_config.format` before the request.
    c.messages.stream(**PARAMS, output_config: {format: Forecast}).until_done
    c.beta.messages.stream_raw(**PARAMS, output_format: {type: :json_schema, schema: schema}).each {}
    c.messages.create(**PARAMS, output_config: {format: {type: :text}})
    c.messages.create(**PARAMS, output_config: {effort: :high})

    assert_equal(["json", "json", "json", "json", nil, nil], spans.map { _1.attributes["gen_ai.output.type"] })
    spans.last(2).each { refute_includes(_1.attributes.keys, "gen_ai.output.type") }
  end

  def test_typed_params_are_recorded_like_a_hash_of_them
    schema = {type: "object", properties: {summary: {type: "string"}}, required: ["summary"]}
    stub_messages
    stub_messages(url: "#{MESSAGES_URL}?beta=true")
    output_config = {effort: :high, format: {type: :json_schema, schema: schema}}
    thinking = {type: :enabled, budget_tokens: 1024}
    c = client
    c.messages.create(
      Anthropic::MessageCreateParams.new(
        **PARAMS,
        output_config: Anthropic::OutputConfig.new(**output_config),
        thinking: Anthropic::ThinkingConfigEnabled.new(**thinking)
      )
    )
    c.beta.messages.create(
      Anthropic::Beta::MessageCreateParams.new(
        **PARAMS,
        output_config: Anthropic::Beta::BetaOutputConfig.new(**output_config),
        thinking: Anthropic::Beta::BetaThinkingConfigEnabled.new(**thinking)
      )
    )

    assert_equal(2, spans.length)
    spans.each do |span|
      assert_equal(OK, span.status.code)
      assert_equal("json", span.attributes["gen_ai.output.type"])
      assert_equal("high", span.attributes["gen_ai.request.reasoning.level"])
      assert_equal("enabled", span.attributes["anthropic.thinking.type"])
      assert_equal(1024, span.attributes["anthropic.thinking.budget_tokens"])
      assert_equal("claude-sonnet-4-5", span.attributes["gen_ai.request.model"])
    end
  end

  def test_the_conversation_id_is_not_sent
    stub_messages
    client.messages.create(**PARAMS, request_options: {open_telemetry: {conversation_id: "conv_1"}})

    assert_requested(:post, MESSAGES_URL) do
      !_1.body.include?("conv_1") && !_1.body.include?("open_telemetry")
    end
    assert_equal("conv_1", only_span.attributes["gen_ai.conversation.id"])
  end

  def test_the_span_is_a_child_of_the_current_span_and_its_context_replaces_the_trace_headers
    stub_messages
    parent = nil
    @provider.tracer("test").in_span("parent") do |span|
      parent = span
      client.messages.create(**PARAMS, request_options: {extra_headers: {"traceparent" => "00-stale-01"}})
    end

    span = only_span("anthropic.messages.create")
    assert_equal(parent.context.span_id, span.parent_span_id)
    assert_equal("00-#{span.hex_trace_id}-#{span.hex_span_id}-01", @requests.first["traceparent"])
  end

  def test_the_span_is_current_while_the_request_is_sent_and_not_after_the_call_returns
    # Stands for an HTTP instrumentation: it starts a span of its own while the request is sent.
    stub_request(:post, MESSAGES_URL).to_return(
      lambda do |_request|
        @provider.tracer("http").start_span("POST").finish
        {status: 200, body: MESSAGE.to_json, headers: {"content-type" => "application/json"}}
      end
    )
    client.messages.create(**PARAMS)

    call = only_span("anthropic.messages.create")
    assert_equal(call.span_id, only_span("POST").parent_span_id)
    assert_equal(call.trace_id, only_span("POST").trace_id)
    refute(OpenTelemetry::Trace.current_span.context.valid?)
  end

  def test_callbacks_the_application_passes_to_the_client_run_with_the_span_current
    stub_messages
    provider = @provider
    # The client calls both during the API call, so a span that either starts is a child of the call's.
    middleware = lambda do |req, nxt|
      provider.tracer("app").start_span("in middleware").finish
      nxt.call(req)
    end
    credentials = lambda do |**|
      provider.tracer("app").start_span("in credentials").finish
      Anthropic::Credentials::AccessToken.new(token: "token", expires_at: nil)
    end
    Anthropic::Client.new(
      base_url: BASE_URL,
      credentials: credentials,
      middleware: [middleware],
      open_telemetry: {tracer_provider: @provider}
    )
                     .messages.create(**PARAMS)

    call = only_span("anthropic.messages.create")
    assert_equal(call.span_id, only_span("in middleware").parent_span_id)
    assert_equal(call.span_id, only_span("in credentials").parent_span_id)
    refute(OpenTelemetry::Trace.current_span.context.valid?)
  end

  def test_concurrent_calls_that_share_request_options_each_send_their_own_trace_context
    stub_messages
    options = {extra_headers: {"x-shared" => "1"}}
    c = client
    threads = Array.new(2) do
      Thread.new { c.messages.create(**PARAMS, request_options: options) }
    end
    threads.each(&:join)

    spans_by_id = spans.to_h { ["00-#{_1.hex_trace_id}-#{_1.hex_span_id}-01", _1] }
    assert_equal(2, spans_by_id.length)
    assert_equal(spans_by_id.keys.sort, @requests.map { _1["traceparent"] }.sort)
    assert_equal({extra_headers: {"x-shared" => "1"}}, options)
  end

  def test_trace_context_replaces_only_the_headers_the_propagator_writes
    stub_messages
    @provider.tracer("test").in_span("parent") do
      client.messages.create(
        **PARAMS,
        request_options: {extra_headers: {"baggage" => "user=1", "tracestate" => "a=b"}}
      )
    end

    assert_equal("user=1", @requests.first["baggage"])
    # The trace-context propagator writes `tracestate` only when the span has one.
    assert_equal("a=b", @requests.first["tracestate"])
    refute_nil(@requests.first["traceparent"])
  end

  def test_a_redirect_to_another_origin_does_not_carry_the_trace_context
    stub_messages({status: 307, body: "", headers: {"location" => "https://example.com/elsewhere"}})
    redirected = []
    stub_request(:post, "https://example.com/elsewhere").to_return(
      lambda do |request|
        redirected << request.headers.transform_keys(&:downcase)
        {status: 200, body: MESSAGE.to_json, headers: {"content-type" => "application/json"}}
      end
    )
    OpenTelemetry.propagation = OpenTelemetry::Context::Propagation::CompositeTextMapPropagator.compose_propagators(
      [
        OpenTelemetry::Trace::Propagation::TraceContext.text_map_propagator,
        OpenTelemetry::Baggage::Propagation.text_map_propagator
      ]
    )
    OpenTelemetry::Context.with_current(OpenTelemetry::Baggage.set_value("tenant", "1")) do
      client.messages.create(**PARAMS)
    end

    assert_equal(%w[baggage traceparent], (@requests.first.keys & %w[baggage traceparent tracestate]).sort)
    assert_empty(redirected.first.keys & %w[baggage traceparent tracestate])
    # The server is that of the client's base URL, whatever origin an attempt goes to.
    assert_equal(["localhost", 4010], only_span.attributes.values_at("server.address", "server.port"))
  end

  def test_a_redirect_to_another_origin_does_not_carry_trace_headers_the_propagator_does_not_list
    stub_messages({status: 307, body: "", headers: {"location" => "https://example.com/elsewhere"}})
    redirected = []
    stub_request(:post, "https://example.com/elsewhere").to_return(
      lambda do |request|
        redirected << request.headers.transform_keys(&:downcase)
        {status: 200, body: MESSAGE.to_json, headers: {"content-type" => "application/json"}}
      end
    )
    OpenTelemetry.propagation = HeaderPerEntryPropagator.new
    OpenTelemetry::Context.with_current(OpenTelemetry::Baggage.set_value("tenant", "1")) do
      client.messages.create(**PARAMS)
    end

    names = %w[uber-trace-id uberctx-tenant]
    assert_equal(names, (@requests.first.keys & names).sort)
    assert_empty(redirected.first.keys & names)
  end

  def test_beta_names_come_from_the_anthropic_beta_header
    stub_messages(url: "#{MESSAGES_URL}?beta=true")
    client.beta.messages.create(**PARAMS, betas: %w[beta-a beta-b])

    span = only_span
    assert_equal("anthropic.messages.create", span.name)
    assert_equal(%w[beta-a beta-b], span.attributes["anthropic.beta"])
  end

  def test_one_span_covers_every_attempt
    stub_messages(
      {status: 500, body: {type: "error", error: {type: "api_error", message: "x"}}.to_json},
      {status: 200, body: MESSAGE.to_json, headers: {"request-id" => "req_2"}}
    )
    client(max_retries: 1).messages.create(**PARAMS)

    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal(200, span.attributes["http.response.status_code"])
    assert_equal("req_2", span.attributes["anthropic.request.id"])
    assert_equal(2, @requests.length)
    assert_equal(@requests.first["traceparent"], @requests.last["traceparent"])
  end

  def test_a_retried_streaming_call_measures_time_to_first_chunk_from_the_start_of_the_call
    stub_messages(
      {status: 529, body: {type: "error", error: {type: "overloaded_error", message: "x"}}.to_json},
      stream_response
    )
    client(max_retries: 1).messages.stream_raw(**PARAMS).each {}

    span = only_span
    assert_equal(2, @requests.length)
    assert_operator(span.attributes["gen_ai.response.time_to_first_chunk"], :>, 0.0)
    assert_equal(OK, span.status.code)
  end

  def test_an_error_response_sets_the_error_type_from_its_envelope
    stub_messages(
      {
        status: 429,
        body: {type: "error", error: {type: "rate_limit_error", message: "x"}}.to_json,
        headers: {"request-id" => "req_1"}
      }
    )
    assert_raises(Anthropic::Errors::RateLimitError) { client(max_retries: 0).messages.create(**PARAMS) }

    span = only_span
    assert_equal(ERROR, span.status.code)
    assert_equal("rate_limit_error", span.attributes["error.type"])
    assert_equal(429, span.attributes["http.response.status_code"])
    assert_equal("req_1", span.attributes["anthropic.request.id"])
    assert_nil(span.attributes["gen_ai.response.id"])
    assert_nil(span.attributes["anthropic.message.stop_reason"])
  end

  def test_the_stop_reason_is_the_responses_own_in_the_metadata_only_mode
    stub_messages(
      {status: 200, body: MESSAGE.merge(stop_reason: "pause_turn").to_json},
      {status: 200, body: MESSAGE.merge(stop_reason: "a_new_reason").to_json},
      {status: 200, body: MESSAGE.merge(stop_reason: nil).to_json}
    )
    3.times { client.messages.create(**PARAMS) }

    # The value is not mapped, so one that this SDK does not know is recorded too.
    stop_reasons = spans.map { _1.attributes["anthropic.message.stop_reason"] }
    assert_equal(["pause_turn", "a_new_reason", nil], stop_reasons)
    spans.each { refute_includes(_1.attributes.keys, "gen_ai.response.finish_reasons") }
  end

  def message_with_iterations(iterations, **usage)
    {status: 200, body: MESSAGE.merge(usage: {**MESSAGE[:usage], **usage, iterations: iterations}).to_json}
  end

  def test_the_tokens_of_compactions_are_counted_apart_from_those_of_the_usage
    sampling = {**COMPACTION, type: "message", input_tokens: 10, output_tokens: 5}
    iterations = [COMPACTION, sampling, {**COMPACTION, input_tokens: 1, output_tokens: 2}]
    response = message_with_iterations(iterations)
    stub_messages(response, response, url: "#{MESSAGES_URL}?beta=true")

    [client, content_client].each { _1.beta.messages.create(**PARAMS) }

    usage = ["gen_ai.usage.input_tokens", "gen_ai.usage.output_tokens", *COMPACTION_TOKENS]
    assert_equal([[15, 5, 147, 42]] * 2, spans.map { _1.attributes.values_at(*usage) })
  end

  def test_a_response_without_a_compaction_has_no_compaction_tokens
    sampling = {**COMPACTION, type: "message"}
    stub_messages(
      message_with_iterations([COMPACTION], input_tokens: 0, output_tokens: 0),
      message_with_iterations([sampling]),
      message_with_iterations([]),
      message_with_iterations(nil),
      {status: 200, body: MESSAGE.to_json},
      url: "#{MESSAGES_URL}?beta=true"
    )

    5.times { client.beta.messages.create(**PARAMS) }

    assert_equal([[123, 40], *[[nil, nil]] * 4], spans.map { _1.attributes.values_at(*COMPACTION_TOKENS) })
  end

  def test_an_error_response_without_an_envelope_sets_the_status_code_as_the_error_type
    stub_messages({status: 502, body: "bad gateway", headers: {"content-type" => "text/plain"}})
    assert_raises(Anthropic::Errors::InternalServerError) { client(max_retries: 0).messages.create(**PARAMS) }

    assert_equal("502", only_span.attributes["error.type"])
  end

  def test_a_response_body_that_cannot_be_decoded_fails_the_span_with_its_status_code
    stub_messages({status: 200, body: "{not json", headers: {"request-id" => "req_1"}})
    assert_raises(JSON::ParserError) { client.messages.create(**PARAMS) }

    span = only_span
    assert_equal(ERROR, span.status.code)
    assert_equal("client_error", span.attributes["error.type"])
    assert_equal(200, span.attributes["http.response.status_code"])
    assert_equal("req_1", span.attributes["anthropic.request.id"])
  end

  def test_a_connection_failure_sets_connection_error_and_no_status_code
    stub_request(:post, MESSAGES_URL).to_raise(Errno::ECONNREFUSED)
    assert_raises(Anthropic::Errors::APIConnectionError) { client(max_retries: 0).messages.create(**PARAMS) }

    span = only_span
    assert_equal(ERROR, span.status.code)
    assert_equal("connection_error", span.attributes["error.type"])
    assert_nil(span.attributes["http.response.status_code"])
    assert_equal(["localhost", 4010], span.attributes.values_at("server.address", "server.port"))
  end

  def test_a_timeout_sets_client_timeout_error
    stub_request(:post, MESSAGES_URL).to_timeout
    assert_raises(Anthropic::Errors::APITimeoutError) { client(max_retries: 0).messages.create(**PARAMS) }

    assert_equal("client_timeout_error", only_span.attributes["error.type"])
  end

  def test_a_call_with_an_invalid_argument_emits_no_span
    assert_raises(ArgumentError) do
      client.messages.create(**PARAMS, request_options: {not_an_option: true})
    end

    assert_empty(spans)
  end

  def test_an_error_raised_while_the_request_is_sent_ends_the_span_with_an_error
    stub_messages
    failing = ->(_req, _nxt) { raise "middleware failed" }
    assert_raises(RuntimeError) { client(middleware: failing).messages.create(**PARAMS) }

    span = only_span
    assert_equal(ERROR, span.status.code)
    assert_equal("client_error", span.attributes["error.type"])
    assert_empty(@requests)
  end

  def test_a_call_the_application_interrupts_leaves_the_status_unset
    stub_request(:post, MESSAGES_URL).to_raise(Interrupt)
    assert_raises(Interrupt) { client(max_retries: 0).messages.create(**PARAMS) }

    span = only_span
    assert_equal(UNSET, span.status.code)
    assert_nil(span.attributes["error.type"])
  end

  def test_count_tokens_reports_its_count_and_no_operation
    stub_request(:post, "#{MESSAGES_URL}/count_tokens").to_return_json(body: {input_tokens: 42})
    client.messages.count_tokens(messages: PARAMS[:messages], model: "claude-sonnet-4-5")

    span = only_span
    assert_equal("anthropic.messages.count_tokens", span.name)
    assert_equal(42, span.attributes["anthropic.message.count_tokens.input_tokens"])
    assert_equal("claude-sonnet-4-5", span.attributes["gen_ai.request.model"])
    assert_nil(span.attributes["gen_ai.operation.name"])
    assert_nil(span.attributes["gen_ai.usage.input_tokens"])
  end

  def test_batch_methods_report_the_batch_id
    batch = {
      id: "batch_1",
      type: "message_batch",
      processing_status: "in_progress",
      request_counts: {canceled: 0, errored: 0, expired: 0, processing: 1, succeeded: 0},
      created_at: "2026-01-01T00:00:00Z",
      expires_at: "2026-01-02T00:00:00Z",
      archived_at: nil,
      cancel_initiated_at: nil,
      ended_at: nil,
      results_url: nil
    }
    stub_request(:post, "#{MESSAGES_URL}/batches").to_return_json(body: batch)
    stub_request(:get, "#{MESSAGES_URL}/batches/batch_2").to_return_json(body: batch.merge(id: "batch_2"))
    stub_request(:get, "#{MESSAGES_URL}/batches").to_return_json(body: {data: [batch], has_more: false})

    c = client
    c.messages.batches.create(requests: [{custom_id: "a", params: PARAMS}])
    c.messages.batches.retrieve("batch_2")
    c.messages.batches.list

    ids = spans.to_h { [_1.name, _1.attributes["anthropic.message.batch.id"]] }
    assert_equal(
      {
        "anthropic.messages.batches.create" => "batch_1",
        "anthropic.messages.batches.retrieve" => "batch_2",
        "anthropic.messages.batches.list" => nil
      },
      ids
    )
  end

  def test_beta_batch_methods_report_the_batch_id
    url = "#{MESSAGES_URL}/batches"
    stub_request(:post, "#{url}?beta=true").to_return_json(body: {id: "batch_1", type: "message_batch"})
    stub_request(:post, "#{url}/batch_2/cancel?beta=true").to_return_json(body: {id: "batch_2"})
    stub_request(:delete, "#{url}/batch_3?beta=true").to_return_json(body: {id: "batch_3"})

    c = client
    c.beta.messages.batches.create(requests: [{custom_id: "a", params: PARAMS}])
    c.beta.messages.batches.cancel("batch_2")
    c.beta.messages.batches.delete("batch_3")

    assert_equal(
      {
        "anthropic.messages.batches.create" => "batch_1",
        "anthropic.messages.batches.cancel" => "batch_2",
        "anthropic.messages.batches.delete" => "batch_3"
      },
      spans.to_h { [_1.name, _1.attributes["anthropic.message.batch.id"]] }
    )
  end

  RESOURCE_IDS = %w[
    anthropic.session.id
    anthropic.session.thread.id
    anthropic.session.event.id
    gen_ai.agent.id
    anthropic.agent.version.id
    anthropic.message.batch.id
  ].freeze

  def resource_ids(span) = span.attributes.slice(*RESOURCE_IDS)

  def test_a_method_reports_the_ids_in_its_path
    # The ID in a response is not the one in the path, so that the attributes show where they come from.
    stub_request(:any, /#{BASE_URL}/).to_return_json(body: {id: "other"})

    c = client
    c.beta.sessions.retrieve("sess_1")
    c.beta.sessions.update("sess_1", title: "t")
    c.beta.sessions.archive("sess_1")
    c.beta.sessions.delete("sess_1")
    c.beta.sessions.events.send_("sess_1", events: [])
    c.beta.sessions.threads.retrieve("thread_1", session_id: "sess_1")
    c.beta.sessions.threads.archive("thread_1", session_id: "sess_1")
    c.beta.agents.retrieve("agent_1")
    c.beta.agents.update("agent_1", version: 1)
    c.beta.agents.archive("agent_1")

    session = {"anthropic.session.id" => "sess_1"}
    thread = {**session, "anthropic.session.thread.id" => "thread_1"}
    agent = {"gen_ai.agent.id" => "agent_1"}
    assert_equal(
      [
        ["anthropic.sessions.retrieve", session],
        ["anthropic.sessions.update", session],
        ["anthropic.sessions.archive", session],
        ["anthropic.sessions.delete", session],
        # A method that creates several objects has no ID for them.
        ["anthropic.sessions.events.send", session],
        ["anthropic.sessions.threads.retrieve", thread],
        ["anthropic.sessions.threads.archive", thread],
        ["anthropic.agents.retrieve", agent],
        ["anthropic.agents.update", agent],
        ["anthropic.agents.archive", agent]
      ],
      spans.map { [_1.name, resource_ids(_1)] }
    )
  end

  def test_a_value_in_the_path_that_is_no_id_is_reported_as_it_is
    stub_request(:any, /#{BASE_URL}/).to_return_json(body: {id: "other"})

    client.messages.batches.retrieve("latest")
    client.beta.sessions.threads.retrieve("not an id", session_id: "latest")

    assert_equal(
      [
        {"anthropic.message.batch.id" => "latest"},
        {"anthropic.session.id" => "latest", "anthropic.session.thread.id" => "not an id"}
      ],
      spans.map { resource_ids(_1) }
    )
  end

  def test_an_event_stream_reports_the_ids_in_its_path
    body = sse({type: "session.status_idle", id: "evt_1"})
    stub_request(:get, %r{#{BASE_URL}/v1/sessions/sess_1/})
      .to_return(status: 200, body: body, headers: {"content-type" => "text/event-stream"})

    client.beta.sessions.events.stream_events("sess_1").each {}
    client.beta.sessions.threads.events.stream_events("thread_1", session_id: "sess_1").each {}

    assert_equal(
      [
        ["anthropic.sessions.events.stream", {"anthropic.session.id" => "sess_1"}],
        [
          "anthropic.sessions.threads.events.stream",
          {"anthropic.session.id" => "sess_1", "anthropic.session.thread.id" => "thread_1"}
        ]
      ],
      spans.map { [_1.name, resource_ids(_1)] }
    )
  end

  def test_a_request_to_a_session_thread_has_the_thread_as_its_conversation_unless_the_call_names_one
    page = {id: "other", data: [], next_page: nil}
    stub_request(:any, %r{#{BASE_URL}/v1/sessions/sess_1}).to_return_json(body: page)
    stub_request(:get, %r{#{BASE_URL}/v1/sessions/sess_1/threads/thread_1/stream}).to_return(
      status: 200,
      body: sse({type: "session.status_idle", id: "evt_1"}),
      headers: {"content-type" => "text/event-stream"}
    )
    sampler = recording_sampler
    own = {open_telemetry: {conversation_id: "conv_1"}}

    c = client
    c.beta.sessions.threads.retrieve("thread_1", session_id: "sess_1")
    c.beta.sessions.threads.archive("thread_1", session_id: "sess_1")
    c.beta.sessions.threads.events.list("thread_1", session_id: "sess_1").to_enum.to_a
    c.beta.sessions.threads.events.stream_events("thread_1", session_id: "sess_1").each {}
    c.beta.sessions.threads.retrieve("thread_1", session_id: "sess_1", request_options: own)
    # Neither path has a thread: the list is of the Session's threads.
    c.beta.sessions.threads.list("sess_1").to_enum.to_a
    c.beta.sessions.retrieve("sess_1")

    conversations = [
      ["anthropic.sessions.threads.retrieve", "thread_1", "thread_1"],
      ["anthropic.sessions.threads.archive", "thread_1", "thread_1"],
      ["anthropic.sessions.threads.events.list", "thread_1", "thread_1"],
      ["anthropic.sessions.threads.events.stream", "thread_1", "thread_1"],
      ["anthropic.sessions.threads.retrieve", "thread_1", "conv_1"],
      ["anthropic.sessions.threads.list", nil, nil],
      ["anthropic.sessions.retrieve", nil, nil]
    ]
    ids = %w[anthropic.session.thread.id gen_ai.conversation.id]
    assert_equal(conversations, spans.map { [_1.name, *_1.attributes.values_at(*ids)] })
    # A sampler reads the conversation with the thread.
    assert_equal(conversations, sampler.started.map { [_1, *_2.values_at(*ids)] })
  end

  def test_a_create_reports_the_id_of_the_object_it_created
    stub_request(
      :post,
      "#{BASE_URL}/v1/sessions?beta=true"
    ).to_return_json(body: {id: "sess_1", type: "session"})
    stub_request(
      :post,
      "#{BASE_URL}/v1/agents?beta=true"
    ).to_return_json(body: {id: "agent_1", type: "agent"})

    client.beta.sessions.create(agent: "agent_0", environment_id: "env_1")
    client.beta.agents.create(model: "claude-sonnet-4-5", name: "a")

    # The agent that the session runs is in the request's body, and not in its path.
    assert_equal(
      [
        ["anthropic.sessions.create", {"anthropic.session.id" => "sess_1", "gen_ai.agent.id" => "agent_0"}],
        ["anthropic.agents.create", {"gen_ai.agent.id" => "agent_1"}]
      ],
      spans.map { [_1.name, resource_ids(_1)] }
    )
  end

  SESSION = {
    id: "sess_1",
    type: "session",
    environment_id: "env_1",
    agent: {id: "agent_1", type: "agent", version: 2, name: "Researcher", model: {id: "claude-sonnet-4-5"}}
  }.freeze

  SESSION_ATTRIBUTES = %w[
    anthropic.session.id
    gen_ai.agent.id
    gen_ai.agent.name
    gen_ai.request.model
    anthropic.session.environment.id
  ].freeze

  def test_a_session_create_reports_the_agent_the_environment_and_the_model_of_the_session
    stub_request(:post, "#{BASE_URL}/v1/sessions?beta=true").to_return_json(body: SESSION)

    [
      "agent_1",
      {type: :agent, id: "agent_1", version: 2},
      Anthropic::Beta::BetaManagedAgentsAgentParams.new(type: :agent, id: "agent_1"),
      # The model is the session's own, and not the one the request overrides the agent's with.
      {type: :agent_with_overrides, id: "agent_1", model: "claude-haiku-4-5"}
    ].each { client.beta.sessions.create(agent: _1, environment_id: "env_1") }

    expected = {
      "anthropic.session.id" => "sess_1",
      "gen_ai.agent.id" => "agent_1",
      "gen_ai.agent.name" => "Researcher",
      "gen_ai.request.model" => "claude-sonnet-4-5",
      "anthropic.session.environment.id" => "env_1"
    }
    assert_equal([expected] * 4, spans.map { _1.attributes.slice(*SESSION_ATTRIBUTES) })
  end

  def test_other_session_methods_report_only_the_session_id
    stub_request(:any, %r{#{BASE_URL}/v1/sessions/sess_1}).to_return_json(body: SESSION)

    c = client
    c.beta.sessions.retrieve("sess_1")
    c.beta.sessions.update("sess_1", title: "t")

    assert_equal(
      [{"anthropic.session.id" => "sess_1"}] * 2,
      spans.map { _1.attributes.slice(*SESSION_ATTRIBUTES) }
    )
  end

  def test_a_create_that_fails_has_no_created_id
    error = {type: "error", error: {type: "invalid_request_error", message: "bad"}}
    stub_request(:post, "#{BASE_URL}/v1/sessions?beta=true").to_return_json(status: 400, body: error)
    stub_request(:post, "#{MESSAGES_URL}/batches").to_return_json(status: 400, body: error)
    # A response with no ID, and one that is not an object, have none either.
    stub_request(:post, "#{BASE_URL}/v1/agents?beta=true").to_return_json({body: {type: "agent"}}, {body: []})

    c = client(max_retries: 0)
    assert_raises(Anthropic::Errors::BadRequestError) do
      c.beta.sessions.create(agent: "agent_0", environment_id: "env_1")
    end
    assert_raises(Anthropic::Errors::BadRequestError) do
      c.messages.batches.create(requests: [{custom_id: "a", params: PARAMS}])
    end
    c.beta.agents.create(model: "claude-sonnet-4-5", name: "a")
    c.beta.agents.create(model: "claude-sonnet-4-5", name: "a")

    assert_equal([ERROR, ERROR, OK, OK], spans.map { _1.status.code })
    assert_equal(
      {"gen_ai.agent.id" => "agent_0", "anthropic.session.environment.id" => "env_1"},
      spans.first.attributes.slice(*SESSION_ATTRIBUTES)
    )
    spans.drop(1).each { assert_empty(resource_ids(_1)) }
  end

  def test_a_list_has_the_ids_in_its_path_on_every_page_and_none_for_what_it_lists
    first = {data: [{id: "listed_1"}], next_page: "p2"}
    last = {data: [{id: "listed_2"}], next_page: nil}
    [
      "#{BASE_URL}/v1/sessions/sess_1/events",
      "#{BASE_URL}/v1/sessions/sess_1/threads",
      "#{BASE_URL}/v1/sessions/sess_1/threads/thread_1/events",
      "#{BASE_URL}/v1/agents/agent_1/versions",
      "#{BASE_URL}/v1/sessions"
    ].each do |url|
      stub_request(:get, "#{url}?beta=true").to_return_json(body: first)
      stub_request(:get, "#{url}?beta=true&page=p2").to_return_json(body: last)
    end

    c = client
    pages = [
      c.beta.sessions.events.list("sess_1"),
      c.beta.sessions.threads.list("sess_1"),
      c.beta.sessions.threads.events.list("thread_1", session_id: "sess_1"),
      c.beta.agents.versions.list("agent_1"),
      c.beta.sessions.list
    ]
    pages.each { assert_equal(2, _1.to_enum.to_a.length) }

    session = {"anthropic.session.id" => "sess_1"}
    thread = {**session, "anthropic.session.thread.id" => "thread_1"}
    assert_equal(
      [
        ["anthropic.sessions.events.list", session],
        ["anthropic.sessions.threads.list", session],
        ["anthropic.sessions.threads.events.list", thread],
        ["anthropic.agents.versions.list", {"gen_ai.agent.id" => "agent_1"}],
        ["anthropic.sessions.list", {}]
      ] * 2,
      spans.map { [_1.name, resource_ids(_1)] }
    )
  end

  BATCH_RESULT = {
    custom_id: "a",
    result: {type: "succeeded", message: MESSAGE}
  }.freeze

  def stub_batch_results(body)
    stub_request(:get, "#{MESSAGES_URL}/batches/batch_1/results").to_return(
      status: 200,
      body: body,
      headers: {"content-type" => "application/x-jsonl", "request-id" => "req_1"}
    )
  end

  def test_the_span_of_batch_results_covers_the_download
    stub_batch_results("#{BATCH_RESULT.to_json}\n#{BATCH_RESULT.merge(custom_id: 'b').to_json}\n")
    results = client.messages.batches.results_streaming("batch_1")
    assert_empty(spans)

    assert_equal(%w[a b], results.map(&:custom_id))
    span = only_span("anthropic.messages.batches.results")
    assert_equal(OK, span.status.code)
    assert_equal("batch_1", span.attributes["anthropic.message.batch.id"])
    assert_equal("req_1", span.attributes["anthropic.request.id"])
  end

  def test_traced_batch_results_read_as_the_untraced_ones_do
    stub_batch_results("#{BATCH_RESULT.to_json}\n")
    traced = client.messages.batches.results_streaming("batch_1")
    untraced = client(open_telemetry: false).messages.batches.results_streaming("batch_1")

    assert_instance_of(Anthropic::Internal::TracedStream, traced)
    assert_instance_of(Anthropic::Internal::JsonLStream, untraced)
    assert_equal(200, traced.status)
    assert_equal("req_1", traced.request_id)
    assert_equal(untraced.map(&:to_h), traced.map(&:to_h))
  end

  def test_a_failure_while_reading_batch_results_fails_the_span
    stub_batch_results("#{BATCH_RESULT.to_json}\n{not json\n")
    results = client.messages.batches.results_streaming("batch_1")
    read = []
    assert_raises(JSON::ParserError) { results.each { read << _1.custom_id } }

    assert_equal(["a"], read)
    span = only_span("anthropic.messages.batches.results")
    assert_equal(ERROR, span.status.code)
    assert_equal("client_error", span.attributes["error.type"])
  end

  def test_closing_batch_results_before_reading_them_leaves_the_status_unset
    stub_batch_results("#{BATCH_RESULT.to_json}\n")
    client.messages.batches.results_streaming("batch_1").close

    span = only_span("anthropic.messages.batches.results")
    assert_equal(UNSET, span.status.code)
    assert_equal(200, span.attributes["http.response.status_code"])
  end

  def test_a_binary_download_ends_its_span_once_the_body_has_been_read
    stub_request(:get, "#{BASE_URL}/v1/files/file_1/content?beta=true").to_return(
      status: 200,
      body: "%PDF",
      headers: {"content-type" => "application/pdf", "request-id" => "req_1"}
    )
    file = client.beta.files.download("file_1")

    assert_equal("%PDF", file.read)
    span = only_span("anthropic.files.download")
    assert_equal(OK, span.status.code)
    assert_equal("req_1", span.attributes["anthropic.request.id"])
  end

  def test_other_methods_are_named_after_their_path_without_beta
    stub_request(
      :get,
      "#{BASE_URL}/v1/models/m"
    ).to_return_json(body: {
                       id: "m",
                       type: "model",
                       display_name: "M",
                       created_at: "2026-01-01T00:00:00Z"
                     })
    stub_request(
      :get,
      "#{BASE_URL}/v1/models/m?beta=true"
    ).to_return_json(body: {
                       id: "m",
                       type: "model",
                       display_name: "M",
                       created_at: "2026-01-01T00:00:00Z"
                     })

    c = client
    c.models.retrieve("m")
    c.beta.models.retrieve("m")

    assert_equal(["anthropic.models.retrieve", "anthropic.models.retrieve"], spans.map(&:name))
    assert_equal(["anthropic"], spans.map { _1.attributes["gen_ai.provider.name"] }.uniq)
  end

  def test_each_page_of_a_list_has_its_own_span_a_child_of_the_span_current_when_it_is_fetched
    model = {type: "model", display_name: "M", created_at: "2026-01-01T00:00:00Z"}
    stub_request(:get, "#{BASE_URL}/v1/models")
      .to_return_json(body: {data: [model.merge(id: "a")], has_more: true, first_id: "a", last_id: "a"})
    stub_request(:get, "#{BASE_URL}/v1/models?after_id=a")
      .to_return_json(body: {data: [model.merge(id: "b")], has_more: false, first_id: "b", last_id: "b"})

    page = client.models.list
    parent = nil
    @provider.tracer("test").in_span("next") do |span|
      parent = span
      page.next_page
    end

    first, second = spans.select { _1.name == "anthropic.models.list" }
    assert_equal(OpenTelemetry::Trace::INVALID_SPAN_ID, first.parent_span_id)
    assert_equal(parent.context.span_id, second.parent_span_id)
  end

  def test_a_later_page_does_not_replay_the_trace_headers_of_the_first
    model = {type: "model", display_name: "M", created_at: "2026-01-01T00:00:00Z"}
    requests = []
    record = lambda do |body|
      lambda do |request|
        requests << request.headers.transform_keys(&:downcase)
        {status: 200, body: body.to_json, headers: {"content-type" => "application/json"}}
      end
    end
    stub_request(:get, "#{BASE_URL}/v1/models")
      .to_return(record.call({data: [model.merge(id: "a")], has_more: true, first_id: "a", last_id: "a"}))
    stub_request(:get, "#{BASE_URL}/v1/models?after_id=a")
      .to_return(record.call({data: [model.merge(id: "b")], has_more: false, first_id: "b", last_id: "b"}))
    OpenTelemetry.propagation = OpenTelemetry::Context::Propagation::CompositeTextMapPropagator.compose_propagators(
      [
        OpenTelemetry::Trace::Propagation::TraceContext.text_map_propagator,
        OpenTelemetry::Baggage::Propagation.text_map_propagator
      ]
    )
    remote = OpenTelemetry::Trace::SpanContext.new(
      trace_id: "\x01" * 16,
      span_id: "\x02" * 8,
      trace_flags: OpenTelemetry::Trace::TraceFlags::SAMPLED,
      tracestate: OpenTelemetry::Trace::Tracestate.from_string("vendor=x"),
      remote: true
    )
    parent = OpenTelemetry::Trace.context_with_span(OpenTelemetry::Trace.non_recording_span(remote))
    first = OpenTelemetry::Baggage.set_value("user", "1", context: parent)

    page = OpenTelemetry::Context.with_current(first) { client.models.list }
    OpenTelemetry::Context.with_current(OpenTelemetry::Context.empty) { page.next_page }

    assert_equal("vendor=x", requests.first["tracestate"])
    assert_equal("user=1", requests.first["baggage"])
    assert_nil(requests.last["tracestate"])
    assert_nil(requests.last["baggage"])
    refute_equal(requests.first["traceparent"], requests.last["traceparent"])
  end

  def test_a_response_that_cannot_be_recorded_does_not_fail_the_call
    # A usage value of the wrong type makes recording it raise.
    body = MESSAGE.merge(usage: MESSAGE[:usage].merge(cache_read_input_tokens: [1]))
    stub_messages({status: 200, body: body.to_json, headers: {"request-id" => "req_1"}})
    message = client.messages.create(**PARAMS)

    assert_equal("msg_1", message.id)
    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal("req_1", span.attributes["anthropic.request.id"])
  end
end
# rubocop:enable Lint/EmptyBlock
