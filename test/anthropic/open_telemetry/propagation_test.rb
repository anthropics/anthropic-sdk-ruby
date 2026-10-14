# frozen_string_literal: true

require_relative "support"

class Anthropic::Test::OpenTelemetryPropagationTest < Anthropic::Test::OpenTelemetryTestCase
  TRACE_HEADERS = %w[baggage traceparent tracestate].freeze
  PROPAGATION_OFF = {"ANTHROPIC_OPEN_TELEMETRY_PROPAGATION" => "false"}.freeze

  # Counts the calls of `inject`, and writes what the W3C trace context and baggage propagators do.
  class CountingPropagator
    attr_reader :injections

    def initialize
      @injections = 0
      @propagator = OpenTelemetry::Context::Propagation::CompositeTextMapPropagator.compose_propagators(
        [
          OpenTelemetry::Trace::Propagation::TraceContext.text_map_propagator,
          OpenTelemetry::Baggage::Propagation.text_map_propagator
        ]
      )
    end

    def inject(carrier, **)
      @injections += 1
      @propagator.inject(carrier, **)
    end

    def extract(carrier, **) = @propagator.extract(carrier, **)

    def fields = @propagator.fields
  end

  # Its tracers start spans that have valid IDs and are neither sampled nor recording, as a
  # sampler that drops a span leaves them, and keeps the spans they started.
  class DroppingProvider
    attr_reader :started

    def initialize = @started = []

    def tracer(*) = Tracer.new(@started)

    class Tracer < OpenTelemetry::Trace::Tracer
      def initialize(started)
        super()
        @started = started
      end

      def start_span(*, **)
        OpenTelemetry::Trace.non_recording_span(OpenTelemetry::Trace::SpanContext.new).tap { @started << _1 }
      end
    end
  end

  def setup
    super
    @propagator = OpenTelemetry.propagation = CountingPropagator.new
  end

  def stub_a_failed_and_a_successful_attempt
    stub_messages(
      {status: 503, body: {type: "error", error: {type: "api_error", message: "x"}}.to_json},
      {status: 200, body: MESSAGE.to_json}
    )
  end

  # A remote parent that has a trace state, and a baggage entry, so that the propagator writes
  # every one of {TRACE_HEADERS}.
  def with_trace_context(&)
    remote = OpenTelemetry::Trace::SpanContext.new(
      trace_id: "\x01" * 16,
      span_id: "\x02" * 8,
      trace_flags: OpenTelemetry::Trace::TraceFlags::SAMPLED,
      tracestate: OpenTelemetry::Trace::Tracestate.from_string("vendor=x"),
      remote: true
    )
    parent = OpenTelemetry::Trace.context_with_span(OpenTelemetry::Trace.non_recording_span(remote))
    OpenTelemetry::Context.with_current(OpenTelemetry::Baggage.set_value("tenant", "1", context: parent), &)
  end

  def sent_trace_headers = @requests.map { (_1.keys & TRACE_HEADERS).sort }

  def test_propagation_false_sends_no_trace_context_header_and_the_span_is_as_before
    stub_messages
    c = client(open_telemetry: {tracer_provider: @provider, propagation: false})
    with_trace_context { c.messages.create(**PARAMS) }

    assert_requested(:post, MESSAGES_URL, times: 1) do |request|
      !request.headers.keys.map(&:downcase).intersect?(TRACE_HEADERS)
    end
    assert_equal([[]], sent_trace_headers)
    assert_equal(0, @propagator.injections)
    span = only_span("anthropic.messages.create")
    assert_equal(OK, span.status.code)
    assert_equal("01" * 16, span.hex_trace_id)
    assert_equal("\x02" * 8, span.parent_span_id)
    assert_operator(span.end_timestamp, :>=, span.start_timestamp)
    assert_equal("msg_1", span.attributes["gen_ai.response.id"])
  end

  # `propagation: true` is the default.
  {the_default: {}, true: {propagation: true}, nil: {propagation: nil}}.each do |name, option|
    define_method(:"test_a_client_with_propagation_of_#{name}_sends_what_the_propagator_writes_for_its_span") do
      stub_messages
      c = client(open_telemetry: {tracer_provider: @provider, **option})
      with_trace_context { c.messages.create(**PARAMS) }

      span = only_span
      assert_requested(:post, MESSAGES_URL, times: 1) do |request|
        request.headers.transform_keys(&:downcase).slice(*TRACE_HEADERS) == {
          "traceparent" => "00-#{span.hex_trace_id}-#{span.hex_span_id}-01",
          "tracestate" => "vendor=x",
          "baggage" => "tenant=1"
        }
      end
      assert_equal([TRACE_HEADERS], sent_trace_headers)
    end
  end

  def test_the_environment_variable_turns_propagation_off_for_a_client_that_is_given_no_option
    stub_messages
    with_env("ANTHROPIC_OPEN_TELEMETRY_PROPAGATION" => "FALSE") do
      with_global_provider(@provider) do
        with_trace_context do
          Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key").messages.create(**PARAMS)
          client(open_telemetry: nil).messages.create(**PARAMS)
        end
      end
    end

    assert_requested(:post, MESSAGES_URL, times: 2)
    assert_equal([[], []], sent_trace_headers)
    assert_equal(0, @propagator.injections)
    assert_equal([OK] * 2, spans.map { _1.status.code })
  end

  def test_a_client_option_that_leaves_propagation_unset_has_it_on_whatever_the_environment_says
    stub_messages
    with_env(PROPAGATION_OFF) do
      with_global_provider(@provider) do
        with_trace_context do
          [true, {}, {tracer_provider: @provider}, {"propagation" => nil}, {traces: true}].each do |option|
            client(open_telemetry: option).messages.create(**PARAMS)
          end
        end
      end
    end

    assert_requested(:post, MESSAGES_URL, times: 5)
    assert_equal([TRACE_HEADERS] * 5, sent_trace_headers)
  end

  # A client that is given the option does not read the environment, as for the other settings.
  {
    true_over_false: [PROPAGATION_OFF, {propagation: true}, TRACE_HEADERS],
    a_string_key_over_false: [PROPAGATION_OFF, {"propagation" => true}, TRACE_HEADERS],
    false_over_true: [{"ANTHROPIC_OPEN_TELEMETRY_PROPAGATION" => "true"}, {propagation: false}, []],
    false_over_unset: [{"ANTHROPIC_OPEN_TELEMETRY_PROPAGATION" => nil}, {propagation: false}, []]
  }.each do |name, (env, option, sent)|
    define_method(:"test_the_client_option_wins_over_the_environment_for_#{name}") do
      stub_messages
      c = with_env(env) { client(open_telemetry: {tracer_provider: @provider, **option}) }
      with_trace_context { c.messages.create(**PARAMS) }

      assert_requested(:post, MESSAGES_URL, times: 1)
      assert_equal([sent], sent_trace_headers)
      assert_equal(1, spans.length)
    end
  end

  # Only `false`, in any case, turns propagation off, as for `ANTHROPIC_OPEN_TELEMETRY`.
  {true: "true", zero: "0", no: "no", off: "off", empty: "", padded_false: " false"}.each do |name, value|
    define_method(:"test_an_environment_value_of_#{name}_leaves_propagation_on") do
      stub_messages
      with_global_provider(@provider) do
        c = with_env("ANTHROPIC_OPEN_TELEMETRY_PROPAGATION" => value) { client(open_telemetry: nil) }
        with_trace_context { c.messages.create(**PARAMS) }
      end

      assert_requested(:post, MESSAGES_URL, times: 1)
      assert_equal([TRACE_HEADERS], sent_trace_headers)
    end
  end

  def test_the_environment_is_read_when_the_client_is_made
    stub_messages
    with_global_provider(@provider) do
      made_in_it = with_env(PROPAGATION_OFF) { client(open_telemetry: nil) }
      made_outside_it = client(open_telemetry: nil)
      with_trace_context do
        made_in_it.messages.create(**PARAMS)
        with_env(PROPAGATION_OFF) { made_outside_it.messages.create(**PARAMS) }
      end
    end

    assert_requested(:post, MESSAGES_URL, times: 2)
    assert_equal([[], TRACE_HEADERS], sent_trace_headers)
  end

  # Without spans there is no trace context to send, whatever `propagation` is.
  {
    the_option_false: false,
    traces_false: {propagation: true, traces: false},
    traces_enabled_false: {propagation: true, traces: {enabled: false}}
  }.each do |name, option|
    define_method(:"test_a_client_with_#{name}_sends_no_trace_context_header_and_emits_no_span") do
      stub_messages
      option = {tracer_provider: @provider, **option} unless option == false
      with_trace_context { client(open_telemetry: option).messages.create(**PARAMS) }

      assert_requested(:post, MESSAGES_URL, times: 1)
      assert_equal([[]], sent_trace_headers)
      assert_equal(0, @propagator.injections)
      assert_empty(spans)
    end
  end

  def test_the_environment_variable_that_turns_the_spans_off_turns_propagation_off_too
    stub_messages
    c = with_env("ANTHROPIC_OPEN_TELEMETRY" => "false") { client(open_telemetry: nil) }
    with_global_provider(@provider) { with_trace_context { c.messages.create(**PARAMS) } }

    assert_requested(:post, MESSAGES_URL, times: 1)
    assert_equal([[]], sent_trace_headers)
    assert_empty(spans)
  end

  def test_with_no_tracer_provider_propagation_false_sends_no_trace_context_header_either
    stub_messages
    with_global_provider(OpenTelemetry::Trace::TracerProvider.new) do
      options = {base_url: BASE_URL, api_key: "test-key"}
      on = Anthropic::Client.new(**options)
      off = Anthropic::Client.new(**options, open_telemetry: {propagation: false})
      with_trace_context do
        on.messages.create(**PARAMS)
        injections = @propagator.injections
        off.messages.create(**PARAMS)

        assert_equal(injections, @propagator.injections)
      end
    end

    assert_requested(:post, MESSAGES_URL, times: 2)
    assert_equal([TRACE_HEADERS, []], sent_trace_headers)
    assert_match(/\A00-#{'01' * 16}-/, @requests.first["traceparent"])
    assert_empty(spans)
  end

  def test_propagation_false_leaves_the_trace_headers_of_the_application_as_they_are
    stub_messages
    headers = {"traceparent" => "00-#{'0a' * 16}-#{'0b' * 8}-01", "baggage" => "user=1"}
    c = client(open_telemetry: {tracer_provider: @provider, propagation: false})
    with_trace_context { c.messages.create(**PARAMS, request_options: {extra_headers: headers}) }

    assert_requested(:post, MESSAGES_URL, headers: headers, times: 1)
    assert_equal(headers, @requests.first.slice(*TRACE_HEADERS))
    assert_equal("01" * 16, only_span.hex_trace_id)
  end

  def test_every_attempt_of_a_call_with_propagation_false_has_no_trace_context_header
    stub_messages(
      {status: 500, body: {type: "error", error: {type: "api_error", message: "x"}}.to_json},
      {status: 200, body: MESSAGE.to_json, headers: {"request-id" => "req_2"}}
    )
    c = client(max_retries: 1, open_telemetry: {tracer_provider: @provider, propagation: false})
    with_trace_context { c.messages.create(**PARAMS) }

    assert_requested(:post, MESSAGES_URL, times: 2)
    assert_equal([[], []], sent_trace_headers)
    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal(1, span.attributes["http.request.resend_count"])
  end

  # The HTTP instrumentation of the application then propagates the decision of the sampler,
  # and does not start a trace of its own.
  def test_a_span_that_the_sampler_drops_is_current_during_every_attempt_with_propagation_false
    stub_a_failed_and_a_successful_attempt
    provider = DroppingProvider.new
    c = client(max_retries: 1, open_telemetry: {tracer_provider: provider, propagation: false})
    with_trace_context { c.messages.create(**PARAMS) }

    assert_requested(:post, MESSAGES_URL, times: 2)
    assert_equal(1, provider.started.length)
    span = provider.started.first
    refute_predicate(span, :recording?)
    assert_predicate(span.context, :valid?)
    assert_equal([[], []], sent_trace_headers)
    assert_equal(0, @propagator.injections)
    assert_equal(2, @contexts.length)
    @contexts.each { assert_same(span, OpenTelemetry::Trace.current_span(_1)) }
  end

  def test_with_no_tracer_provider_and_propagation_false_every_attempt_runs_in_the_context_of_the_caller
    stub_a_failed_and_a_successful_attempt
    caller_context = OpenTelemetry::Baggage.set_value("tenant", "1")
    with_global_provider(OpenTelemetry::Trace::TracerProvider.new) do
      c = Anthropic::Client.new(
        base_url: BASE_URL,
        api_key: "test-key",
        max_retries: 1,
        open_telemetry: {propagation: false}
      )
      OpenTelemetry::Context.with_current(caller_context) { c.messages.create(**PARAMS) }
    end

    assert_requested(:post, MESSAGES_URL, times: 2)
    assert_equal([[], []], sent_trace_headers)
    assert_equal(0, @propagator.injections)
    assert_equal(2, @contexts.length)
    @contexts.each { assert_same(caller_context, _1) }
  end

  def test_a_redirect_to_another_origin_with_propagation_false_drops_the_fields_of_the_propagator
    stub_messages({status: 307, body: "", headers: {"location" => "https://example.com/elsewhere"}})
    redirected = []
    stub_request(:post, "https://example.com/elsewhere").to_return(
      lambda do |request|
        redirected << request.headers.transform_keys(&:downcase)
        {status: 200, body: MESSAGE.to_json, headers: {"content-type" => "application/json"}}
      end
    )
    c = client(open_telemetry: {tracer_provider: @provider, propagation: false})
    with_trace_context do
      c.messages.create(**PARAMS, request_options: {extra_headers: {"baggage" => "user=1", "x-kept" => "1"}})
    end

    assert_requested(:post, "https://example.com/elsewhere", times: 1)
    assert_equal([["baggage"]], sent_trace_headers)
    assert_empty(redirected.first.keys & TRACE_HEADERS)
    assert_equal("1", redirected.first["x-kept"])
    assert_equal(0, @propagator.injections)
    assert_equal(1, only_span.attributes["http.request.resend_count"])
  end

  def test_a_streamed_call_with_propagation_false_ends_its_span_when_the_stream_is_read
    stub_messages(stream_response)
    c = client(open_telemetry: {tracer_provider: @provider, propagation: false})
    stream = with_trace_context { c.messages.stream_raw(**PARAMS) }

    assert_empty(spans)
    assert_equal(STREAM_EVENTS.map { _1[:type].to_sym }, stream.map(&:type))
    assert_requested(:post, MESSAGES_URL, times: 1)
    assert_equal([[]], sent_trace_headers)
    assert_equal(0, @propagator.injections)
    span = only_span
    assert_equal(OK, span.status.code)
    assert_equal("01" * 16, span.hex_trace_id)
    assert_equal(5, span.attributes["gen_ai.usage.output_tokens"])
  end

  def test_propagation_is_no_key_of_the_request_option
    stub_messages
    error = assert_raises(ArgumentError) do
      client.messages.create(**PARAMS, request_options: {open_telemetry: {propagation: false}})
    end

    assert(error.message.end_with?("keys must be one of [:conversation_id], got :propagation"), error.message)
    assert_not_requested(:post, MESSAGES_URL)
  end
end
