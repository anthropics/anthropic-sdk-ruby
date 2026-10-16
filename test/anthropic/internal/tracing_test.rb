# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::TracingTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  TRACEPARENT = "00-#{'1' * 32}-#{'2' * 16}-01".freeze
  PROPAGATION_ENV = "ANTHROPIC_OPEN_TELEMETRY_PROPAGATION"
  VARIABLES = {
    "ANTHROPIC_OPEN_TELEMETRY" => "false",
    PROPAGATION_ENV => "false",
    "ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE" => "content",
    "ANTHROPIC_OPEN_TELEMETRY_TRACES_MAX_CONTENT_BYTES" => "300"
  }.freeze
  JSON_HEADERS = {"content-type" => "application/json"}.freeze
  OK = {
    body: {token: "card"}.to_json,
    headers: JSON_HEADERS
  }.freeze
  EVENTS = {
    body: %w[a b].map { "data: #{{message: _1}.to_json}\n\n" }.join,
    headers: {"content-type" => "text/event-stream"}
  }.freeze

  # A client whose propagation is off never calls it, so it counts the calls.
  class CountingPropagator
    attr_reader :calls

    def initialize = @calls = 0

    def inject(carrier, **)
      @calls += 1
      carrier["traceparent"] = TRACEPARENT
      nil
    end

    def fields = %w[traceparent]
  end

  class RecordingSpan < OpenTelemetry::Trace::Span
    def recording? = true
  end

  class RecordingProvider
    def tracer(*) = self

    def start_span(*, **) = RecordingSpan.new
  end

  # What a sampler that drops a span gives: it does not record, and its context is valid.
  class DroppingProvider
    attr_reader :spans

    def initialize = @spans = []

    def tracer(*) = self

    def start_span(*, **)
      context = OpenTelemetry::Trace::SpanContext.new
      OpenTelemetry::Trace.non_recording_span(context).tap { @spans << _1 }
    end
  end

  class TracingFailure < StandardError
  end

  class FailingPropagator
    def inject(_carrier, **) = raise(TracingFailure.new("cannot inject a trace context"))

    def extract(_carrier, context: OpenTelemetry::Context.current, **) = context

    def fields = raise(TracingFailure.new("cannot list the fields"))
  end

  # What a sampler, an ID generator or a span processor that raises when a span starts gives.
  class FailingStartProvider
    def tracer(*) = self

    def start_span(*, **) = raise(TracingFailure.new("cannot start a span"))
  end

  # A tracer provider that the application wrote, whose spans record and fail the `writes`.
  # A span processor that raises when a span ends fails `finish`.
  class FailingSpanProvider
    WRITES = [:set_attribute, :add_attributes, :add_event, :record_exception, :status=, :finish].freeze

    class Span < OpenTelemetry::Trace::Span
      def initialize(writes)
        super(span_context: OpenTelemetry::Trace::SpanContext.new)
        @writes = writes
      end

      def recording? = true

      WRITES.each do |write|
        define_method(write) do |*, **|
          raise TracingFailure.new("cannot #{write}") if @writes.include?(write)

          self
        end
      end
    end

    attr_reader :spans

    def initialize(*writes)
      @writes = writes
      @spans = []
    end

    def tracer(*) = self

    def start_span(*, **) = Span.new(@writes).tap { @spans << _1 }
  end

  # The option of a client whose tracing fails at each of these, with the propagator registered.
  FAILURES = {
    "a span that cannot start" => -> { {tracer_provider: FailingStartProvider.new} },
    "a span whose every write fails" => -> {
      {tracer_provider: FailingSpanProvider.new(*FailingSpanProvider::WRITES)}
    },
    "a span that cannot end" => -> { {tracer_provider: FailingSpanProvider.new(:status=, :finish)} },
    "a propagator that fails, with a recording span" => lambda do
      OpenTelemetry.propagation = FailingPropagator.new
      {tracer_provider: FailingSpanProvider.new}
    end,
    "a propagator that fails, with the span of the API" => lambda do
      OpenTelemetry.propagation = FailingPropagator.new
      {}
    end
  }.freeze

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    Thread.current.thread_variable_set(:mock_sleep, [])
    @environment = VARIABLES.keys.to_h { [_1, ENV.delete(_1)] }
    @propagation = OpenTelemetry.propagation
    @logger = OpenTelemetry.logger
    # A test of another class can leave a tracer provider registered.
    reset_tracer_provider
    @sent = []
    @contexts = []
  end

  def teardown
    OpenTelemetry.logger = @logger
    reset_tracer_provider
    OpenTelemetry.propagation = @propagation
    @environment.each { ENV[_1] = _2 }
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  # The registered one cannot be put back: it keeps the first tracer provider that replaces it.
  def reset_tracer_provider = OpenTelemetry.tracer_provider = OpenTelemetry::Internal::ProxyTracerProvider.new

  def new_client(**)
    Anthropic::Client.new(
      base_url: "http://localhost",
      api_key: "my-anthropic-api-key",
      **
    )
  end

  # Answers with each of `responses` in turn, and keeps the headers of each request and the context it was sent in.
  def stub_responses(method, url, *responses)
    stub_request(method, url).to_return(
      *responses.map do |response|
        lambda do |request|
          @sent << request.headers.transform_keys(&:downcase)
          @contexts << OpenTelemetry::Context.current
          response
        end
      end
    )
  end

  # The first attempt fails, so the call has a retry.
  def call_with_retry(option)
    @sent.clear
    @contexts.clear
    WebMock.reset!
    stub_responses(:post, "http://localhost/v1/messages", {**OK, status: 503}, OK)
    anthropic = new_client(max_retries: 1, open_telemetry: option)
    anthropic.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: Anthropic::Model::CLAUDE_OPUS_5_5
    )
  end

  def traceparents = @sent.map { _1["traceparent"] }

  def test_propagation_option_and_environment_variable
    OpenTelemetry.propagation = propagator = CountingPropagator.new
    # Each row: the environment variable, the option, and whether the requests carry the trace
    # context. The option `nil` is a client that is given none: only that client reads the variable.
    cases = {
      "unset" => [nil, {}, true],
      "no option" => [nil, nil, true],
      "option false" => [nil, {propagation: false}, false],
      "option false with a String key" => [nil, {"propagation" => false}, false],
      "environment false" => ["false", nil, false],
      "environment FALSE" => ["FALSE", nil, false],
      "environment 0" => ["0", nil, true],
      "an empty option over environment false" => ["false", {}, true],
      "option nil over environment false" => ["false", {propagation: nil}, true],
      "option true over environment false" => ["false", {propagation: true}, true],
      "option false over environment true" => ["true", {propagation: false}, false]
    }
    # A span that records, and the API's own span, which does not.
    providers = {"recording span" => RecordingProvider.new, "no tracer provider" => nil}

    cases.to_a.product(providers.to_a).each do |(name, (env, option, propagates)), (kind, provider)|
      label = "#{name}, #{kind}"
      ENV[PROPAGATION_ENV] = env
      calls = propagator.calls
      # The spans of a client that is given no option go to the registered tracer provider.
      OpenTelemetry.tracer_provider = provider if option.nil? && provider
      call_with_retry(option && {tracer_provider: provider, **option})
      reset_tracer_provider

      assert_equal(propagates ? [TRACEPARENT] * 2 : [nil, nil], traceparents, label)
      assert_equal(propagates, propagator.calls > calls, label)
    end
  end

  def test_client_reads_every_environment_variable_or_none
    VARIABLES.each { ENV[_1] = _2 }
    defaults = {enabled: true, content_mode: :metadata_only, max_content_bytes: 750_000}
    settled = ->(option) { Anthropic::Internal::Tracing.client_option(option).slice(:propagation, :traces) }

    assert_equal(
      {propagation: false, traces: {enabled: false, content_mode: :content, max_content_bytes: 300}},
      settled.call(nil)
    )
    {
      true => defaults,
      false => {**defaults, enabled: false},
      {} => defaults,
      {tracer_provider: RecordingProvider.new} => defaults,
      {traces: true} => defaults,
      {traces: {content_mode: :metadata_only}} => defaults
    }.each do |option, traces|
      assert_equal({propagation: true, traces: traces}, settled.call(option), option.inspect)
    end

    anthropic = new_client
    VARIABLES.each_key { ENV.delete(_1) }
    # The client read them when it was made.
    assert_equal(
      [nil, true, 300],
      [
        anthropic.open_telemetry_tracer,
        anthropic.open_telemetry_content?,
        anthropic.open_telemetry_max_content_bytes
      ]
    )
  end

  # For the application's HTTP instrumentation to continue its trace.
  def test_dropped_span_is_current_at_each_attempt_with_propagation_off
    OpenTelemetry.propagation = propagator = CountingPropagator.new
    dropping = DroppingProvider.new
    call_with_retry({tracer_provider: dropping, propagation: false})

    assert_equal(1, dropping.spans.length)
    span = dropping.spans.first
    assert_equal(
      [true, false, false],
      [span.context.valid?, span.context.trace_flags.sampled?, span.recording?]
    )
    assert_equal([nil, nil], traceparents)
    assert_equal(0, propagator.calls)
    assert_equal([true, true], @contexts.map { OpenTelemetry::Trace.current_span(_1).equal?(span) })
  end

  # The API's own span has no trace to continue, so the call gets no span.
  def test_callers_context_is_current_at_each_attempt_without_a_tracer_provider
    call_with_retry({propagation: false})

    ambient = OpenTelemetry::Context.current
    assert_equal([true, true], @contexts.map { _1.equal?(ambient) })
  end

  # A redirect to another origin drops the headers of the trace context, whose names the propagator gives.
  def test_redirect_with_propagation_off_does_not_call_the_propagator
    OpenTelemetry.propagation = propagator = CountingPropagator.new
    stub_request(:post, "http://localhost/v1/messages")
      .to_return(status: 307, headers: {"location" => "http://other.localhost/redirected"})
    stub_request(:any, "http://other.localhost/redirected").to_return(OK)
    anthropic = new_client(open_telemetry: {tracer_provider: RecordingProvider.new, propagation: false})
    anthropic.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: Anthropic::Model::CLAUDE_OPUS_5_5
    )

    assert_requested(:any, "http://other.localhost/redirected")
    assert_equal(0, propagator.calls)
  end

  def test_propagation_must_be_true_or_false
    ["false", 0].each do |value|
      e = assert_raises(ArgumentError) { new_client(open_telemetry: {propagation: value}) }
      assert_equal("`open_telemetry` [:propagation] must be true or false, got #{value.inspect}", e.message)
    end
  end

  def test_request_cannot_choose_propagation
    anthropic = new_client
    e = assert_raises(ArgumentError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: Anthropic::Model::CLAUDE_OPUS_5_5,
        request_options: {open_telemetry: {propagation: false}}
      )
    end
    assert_equal(
      "Request `open_telemetry` keys must be one of [:conversation_id], got :propagation",
      e.message
    )
  end

  # Each makes one kind of API call, and returns what the application sees of it.
  def calls
    {
      "a call" => lambda do |anthropic|
        stub_responses(:post, "http://localhost/v1/messages", OK)
        anthropic.messages.create(
          max_tokens: 1024,
          messages: [{content: "Hello, world", role: :user}],
          model: Anthropic::Model::CLAUDE_OPUS_5_5
        )
      end,
      "a call that the API answers with 500 after a retry" => lambda do |anthropic|
        stub_responses(
          :post,
          "http://localhost/v1/messages",
          {status: 500, body: "{}", headers: JSON_HEADERS}
        )
        e = assert_raises(Anthropic::Errors::InternalServerError) do
          anthropic.messages.create(
            max_tokens: 1024,
            messages: [{content: "Hello, world", role: :user}],
            model: Anthropic::Model::CLAUDE_OPUS_5_5
          )
        end
        [e.class, e.status]
      end,
      "a call whose connection fails" => lambda do |anthropic|
        stub_request(:post, "http://localhost/v1/messages").to_raise(Errno::ECONNREFUSED)
        e = assert_raises(Anthropic::Errors::APIConnectionError) do
          anthropic.messages.create(
            max_tokens: 1024,
            messages: [{content: "Hello, world", role: :user}],
            model: Anthropic::Model::CLAUDE_OPUS_5_5,
            request_options: {max_retries: 0}
          )
        end
        [e.class, e.message, e.cause.class]
      end,
      "a stream that the application reads" => lambda do |anthropic|
        stub_responses(:post, "http://localhost/v1/messages", EVENTS)
        anthropic.messages.stream_raw(
          max_tokens: 1024,
          messages: [{content: "Hello, world", role: :user}],
          model: Anthropic::Model::CLAUDE_OPUS_5_5
        ).to_a
      end,
      "a stream that the application closes early" => lambda do |anthropic|
        stub_responses(:post, "http://localhost/v1/messages", EVENTS)
        stream = anthropic.messages.stream_raw(
          max_tokens: 1024,
          messages: [{content: "Hello, world", role: :user}],
          model: Anthropic::Model::CLAUDE_OPUS_5_5
        )
        first = stream.first
        stream.close
        first
      end,
      "a stream whose reading block raises" => lambda do |anthropic|
        stub_responses(:post, "http://localhost/v1/messages", EVENTS)
        block = ->(_) { raise ArgumentError.new("from the application") }
        e = assert_raises(ArgumentError) do
          anthropic.messages.stream_raw(
            max_tokens: 1024,
            messages: [{content: "Hello, world", role: :user}],
            model: Anthropic::Model::CLAUDE_OPUS_5_5
          ).each(&block)
        end
        [e.class, e.message, e.cause.class]
      end,
      "every page of a list" => lambda do |anthropic|
        page = lambda do |ids|
          items = ids.map { {id: _1} }
          {body: {data: items}.to_json, headers: JSON_HEADERS}
        end
        stub_responses(
          :get,
          /\A#{Regexp.escape('http://localhost/v1/messages/batches')}/,
          page.call(%w[a b]),
          page.call([])
        )
        items = []
        anthropic.messages.batches.list.auto_paging_each { items << _1 }
        items
      end
    }
  end

  def outcome(call, option)
    @sent.clear
    WebMock.reset!
    [calls.fetch(call).call(new_client(max_retries: 1, open_telemetry: option)), @sent.length]
  end

  # Each call is as it is with `open_telemetry: false`.
  def test_failing_telemetry_leaves_each_call_unchanged
    logged = []
    OpenTelemetry.logger = Logger.new(File::NULL).tap do |log|
      log.define_singleton_method(:debug) { |message = nil, &blk| logged << (message || blk&.call) }
    end

    FAILURES.to_a.product(calls.keys).each do |(failure, option), call|
      label = "#{failure}, #{call}"
      without_tracing = outcome(call, false)
      logged.clear
      with_failure = outcome(call, option.call)
      OpenTelemetry.propagation = @propagation

      assert_equal(without_tracing, with_failure, label)
      refute_empty(logged.grep(/TracingFailure/), "#{label}: the log names the error's class")
      assert_empty(logged.grep(/cannot /), "#{label}: the log has no message of an error")
    end
  end

  def test_failing_propagator_sends_no_trace_context_and_its_span_still_starts
    OpenTelemetry.propagation = FailingPropagator.new
    provider = FailingSpanProvider.new
    outcome("a call", {tracer_provider: provider})

    assert_equal(1, provider.spans.length)
    assert_equal([nil], traceparents)
  end

  # The propagator cannot list its own.
  def test_redirect_drops_the_standard_trace_headers_when_the_propagator_fails
    OpenTelemetry.propagation = FailingPropagator.new
    stub_request(:post, "http://localhost/v1/messages")
      .to_return(status: 307, headers: {"location" => "http://other.localhost/redirected"})
    stub_responses(:any, "http://other.localhost/redirected", OK)
    headers = {"traceparent" => TRACEPARENT, "baggage" => "user=1", "x-kept" => "1"}
    anthropic = new_client(open_telemetry: {tracer_provider: FailingSpanProvider.new})
    anthropic.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: Anthropic::Model::CLAUDE_OPUS_5_5,
      request_options: {extra_headers: headers}
    )

    assert_empty(@sent.first.keys & %w[traceparent tracestate baggage])
    assert_equal("1", @sent.first["x-kept"])
  end
end
