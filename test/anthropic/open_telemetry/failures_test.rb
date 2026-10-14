# frozen_string_literal: true

require_relative "support"

# Tracing that fails leaves an API call as it is without tracing: its result, its error and its
# requests.
class Anthropic::Test::OpenTelemetryFailuresTest < Anthropic::Test::OpenTelemetryTestCase
  class TracingFailure < StandardError
  end

  # Raises when a span starts, or else when one ends.
  class FailingProcessor < OpenTelemetry::SDK::Trace::SpanProcessor
    def initialize(failure)
      super()
      @failure = failure
    end

    def on_start(_span, _parent_context)
      raise TracingFailure.new("cannot start a span") if @failure == :on_start
    end

    def on_finish(_span)
      raise TracingFailure.new("cannot end a span") if @failure == :on_finish
    end
  end

  class FailingSampler
    def should_sample?(**) = raise(TracingFailure.new("cannot sample a span"))

    def description = "FailingSampler"
  end

  class FailingIdGenerator
    def self.generate_trace_id = raise(TracingFailure.new("cannot name a trace"))

    def self.generate_span_id = raise(TracingFailure.new("cannot name a span"))
  end

  class FailingPropagator
    def inject(_carrier, **) = raise(TracingFailure.new("cannot inject a trace context"))

    def extract(_carrier, context: OpenTelemetry::Context.current, **) = context

    def fields = raise(TracingFailure.new("cannot list the fields"))
  end

  # A tracer provider that the application wrote, whose spans record and fail the `writes`.
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

    def initialize(*writes) = @writes = writes

    def tracer(*) = self

    def start_span(*, **) = Span.new(@writes)
  end

  class GetWeather < Anthropic::BaseTool
    class Input < Anthropic::BaseModel
      required :city, String
    end

    doc "Gets the weather"
    input_schema Input

    def call(_input) = "sunny"
  end

  MODEL = {type: "model", display_name: "M", created_at: "2026-01-01T00:00:00Z"}.freeze

  FAILURES = [:sampler, :id_generator, :on_start, :on_finish, :propagator, :span, :span_end].freeze

  SCENARIOS = [
    :a_call_returns_its_result_from_one_request,
    :a_call_raises_the_error_of_the_api_after_its_retries,
    :a_call_raises_its_connection_error,
    :a_stream_gives_every_event,
    :the_error_of_the_block_that_reads_a_stream_is_raised_as_it_is,
    :the_error_of_a_middleware_is_raised_as_it_is,
    :a_list_gives_every_page,
    :a_tool_runner_runs_its_tools
  ].freeze

  FAILURES.product(SCENARIOS).each do |failure, scenario|
    define_method(:"test_with_a_failing_#{failure}_#{scenario}") { send(scenario, failure) }
  end

  # A client whose tracing fails every span at `failure`.
  def failing_client(failure, **kw)
    case failure
    in :sampler
      @provider.sampler = FailingSampler.new
    in :id_generator
      @provider.id_generator = FailingIdGenerator
    in :on_start | :on_finish
      @provider.add_span_processor(FailingProcessor.new(failure))
    in :propagator
      OpenTelemetry.propagation = FailingPropagator.new
    in :span
      kw = {open_telemetry: {tracer_provider: FailingSpanProvider.new(*FailingSpanProvider::WRITES)}, **kw}
    in :span_end
      kw = {open_telemetry: {tracer_provider: FailingSpanProvider.new(:status=, :finish)}, **kw}
    end
    client(**kw)
  end

  def a_call_returns_its_result_from_one_request(failure)
    stub_messages
    message = failing_client(failure, max_retries: 2).messages.create(**PARAMS)

    assert_equal("msg_1", message.id)
    assert_requested(:post, MESSAGES_URL, times: 1)
  end

  def a_call_raises_the_error_of_the_api_after_its_retries(failure)
    error = {type: "error", error: {type: "api_error", message: "Internal server error"}}
    stub_messages(*([{status: 500, body: error.to_json}] * 3))

    raised = assert_raises(Anthropic::Errors::InternalServerError) do
      failing_client(failure, max_retries: 2).messages.create(**PARAMS)
    end

    assert_equal(500, raised.status)
    assert_requested(:post, MESSAGES_URL, times: 3)
  end

  def a_call_raises_its_connection_error(failure)
    stub_request(:post, MESSAGES_URL).to_raise(Errno::ECONNREFUSED)

    assert_raises(Anthropic::Errors::APIConnectionError) do
      failing_client(failure, max_retries: 0).messages.create(**PARAMS)
    end
    assert_requested(:post, MESSAGES_URL, times: 1)
  end

  def a_stream_gives_every_event(failure)
    stub_messages(*([stream_response] * 4))
    c = failing_client(failure)

    assert_equal(STREAM_EVENTS.map { _1[:type].to_sym }, c.messages.stream_raw(**PARAMS).map(&:type))
    assert_equal("Hi", c.messages.stream(**PARAMS).accumulated_text)
    # An application that stops reading closes the stream, which ends the span too.
    stream = c.messages.stream_raw(**PARAMS)
    assert_equal(:message_start, stream.first.type)
    stream.close
    c.messages.stream_raw(**PARAMS).close
    assert_requested(:post, MESSAGES_URL, times: 4)
  end

  def the_error_of_the_block_that_reads_a_stream_is_raised_as_it_is(failure)
    stub_messages(stream_response)
    stream = failing_client(failure).messages.stream_raw(**PARAMS)
    fail_the_read = ->(_event) { raise ArgumentError.new("from the application") }

    raised = assert_raises(ArgumentError) { stream.each(&fail_the_read) }

    assert_equal("from the application", raised.message)
  end

  def the_error_of_a_middleware_is_raised_as_it_is(failure)
    stub_messages
    middleware = ->(_req, _nxt) { raise ArgumentError.new("from the application") }

    raised = assert_raises(ArgumentError) do
      failing_client(failure).messages.create(**PARAMS, request_options: {middleware: middleware})
    end

    assert_equal("from the application", raised.message)
    assert_nil(raised.cause)
  end

  def a_list_gives_every_page(failure)
    stub_request(:get, "#{BASE_URL}/v1/models")
      .to_return_json(body: {data: [MODEL.merge(id: "a")], has_more: true, first_id: "a", last_id: "a"})
    stub_request(:get, "#{BASE_URL}/v1/models?after_id=a")
      .to_return_json(body: {data: [MODEL.merge(id: "b")], has_more: false, first_id: "b", last_id: "b"})
    ids = []

    failing_client(failure).models.list.auto_paging_each { ids << _1.id }

    assert_equal(%w[a b], ids)
    assert_requested(:get, "#{BASE_URL}/v1/models", times: 1)
    assert_requested(:get, "#{BASE_URL}/v1/models?after_id=a", times: 1)
  end

  def a_tool_runner_runs_its_tools(failure)
    tool_use = MESSAGE.merge(
      content: [{type: "tool_use", id: "toolu_1", name: "get_weather", input: {city: "Paris"}}],
      stop_reason: "tool_use"
    )
    requests = []
    stub_request(:post, "#{MESSAGES_URL}?beta=true").to_return(
      *[tool_use, MESSAGE.merge(id: "msg_2")].map do |message|
        lambda do |request|
          requests << JSON.parse(request.body, symbolize_names: true)
          {status: 200, body: message.to_json, headers: {"content-type" => "application/json"}}
        end
      end
    )
    ids = []

    failing_client(failure).beta.messages.tool_runner(**PARAMS, tools: [GetWeather.new]).each_message { ids << _1.id }

    assert_equal(%w[msg_1 msg_2], ids)
    result = requests.last[:messages].last[:content].first
    assert_equal({type: "tool_result", tool_use_id: "toolu_1", content: "sunny", is_error: false}, result)
  end

  def test_a_failing_propagator_sends_the_request_without_a_trace_context
    stub_messages
    message = failing_client(:propagator).messages.create(**PARAMS)

    assert_equal("msg_1", message.id)
    assert_nil(@requests.first["traceparent"])
    assert_equal(OK, only_span("anthropic.messages.create").status.code)
  end

  def test_with_a_failing_propagator_a_redirect_to_another_origin_drops_the_standard_trace_headers
    stub_messages({status: 307, body: "", headers: {"location" => "https://example.com/elsewhere"}})
    redirected = []
    stub_request(:post, "https://example.com/elsewhere").to_return(
      lambda do |request|
        redirected << request.headers.transform_keys(&:downcase)
        {status: 200, body: MESSAGE.to_json, headers: {"content-type" => "application/json"}}
      end
    )
    headers = {"traceparent" => "00-#{'1' * 32}-#{'2' * 16}-01", "baggage" => "user=1", "x-kept" => "1"}

    message = failing_client(:propagator).messages.create(**PARAMS, request_options: {extra_headers: headers})

    assert_equal("msg_1", message.id)
    assert_equal(headers["traceparent"], @requests.first["traceparent"])
    assert_empty(redirected.first.keys & %w[traceparent tracestate baggage])
    assert_equal("1", redirected.first["x-kept"])
  end

  def test_a_failure_is_logged_without_its_message
    stub_messages
    logged = []
    logger = OpenTelemetry.logger
    OpenTelemetry.logger = Logger.new(File::NULL).tap do |log|
      log.define_singleton_method(:debug) { |message = nil, &blk| logged << (message || blk&.call) }
    end

    begin
      failing_client(:on_finish).messages.create(**PARAMS)
    ensure
      OpenTelemetry.logger = logger
    end

    assert_equal(1, logged.grep(/TracingFailure/).length, logged.inspect)
    assert_empty(logged.grep(/cannot end a span/))
  end
end
