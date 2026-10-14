# frozen_string_literal: true

require_relative "../test_helper"
require "opentelemetry/sdk"

class Anthropic::Test::OpenTelemetryTestCase < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  BASE_URL = "http://localhost:4010"
  MESSAGES_URL = "#{BASE_URL}/v1/messages".freeze
  OK = OpenTelemetry::Trace::Status::OK
  ERROR = OpenTelemetry::Trace::Status::ERROR
  UNSET = OpenTelemetry::Trace::Status::UNSET

  MESSAGE = {
    id: "msg_1",
    type: "message",
    role: "assistant",
    model: "claude-sonnet-4-5-20250929",
    content: [{type: "text", text: "Hi"}],
    stop_reason: "end_turn",
    stop_sequence: nil,
    usage: {
      input_tokens: 10,
      output_tokens: 5,
      cache_creation_input_tokens: 3,
      cache_read_input_tokens: 2,
      cache_creation: {ephemeral_5m_input_tokens: 1, ephemeral_1h_input_tokens: 2},
      service_tier: "standard"
    }
  }.freeze

  COMPACTION = {
    type: "compaction",
    input_tokens: 100,
    cache_creation_input_tokens: 3,
    cache_read_input_tokens: 20,
    cache_creation: nil,
    output_tokens: 40
  }.freeze
  COMPACTION_TOKENS = %w[
    anthropic.usage.compaction.input_tokens
    anthropic.usage.compaction.output_tokens
  ].freeze

  PARAMS = {max_tokens: 100, messages: [{role: :user, content: "Hi"}], model: "claude-sonnet-4-5"}.freeze

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
    @exporter = OpenTelemetry::SDK::Trace::Export::InMemorySpanExporter.new
    @provider = OpenTelemetry::SDK::Trace::TracerProvider.new
    @provider.add_span_processor(OpenTelemetry::SDK::Trace::Export::SimpleSpanProcessor.new(@exporter))
    @propagation = OpenTelemetry.propagation
    OpenTelemetry.propagation = OpenTelemetry::Trace::Propagation::TraceContext.text_map_propagator
    Thread.current.thread_variable_set(:mock_sleep, [])
  end

  def teardown
    OpenTelemetry.propagation = @propagation
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  def client(**kw)
    Anthropic::Client.new(
      base_url: BASE_URL,
      api_key: "test-key",
      open_telemetry: {tracer_provider: @provider},
      **kw
    )
  end

  def spans = @exporter.finished_spans

  # A Hash that turns Symbol keys back into Strings, as one with indifferent access does.
  class StringKeyedHash < Hash
    def self.from(hash) = new.tap { |copy| hash.each { copy[_1] = _2 } }

    def []=(key, value)
      super(key.is_a?(Symbol) ? key.to_s : key, value)
    end

    def transform_keys(...) = self.class.from(super)
  end

  # Samples every span, and keeps the name and the attributes each one started with, which are
  # all that a sampler reads of a span.
  class RecordingSampler
    attr_reader :started

    def initialize = @started = []

    def should_sample?(**kw)
      @started << [kw[:name], kw[:attributes].to_h]
      OpenTelemetry::SDK::Trace::Samplers::ALWAYS_ON.should_sample?(**kw)
    end

    def description = "RecordingSampler"
  end

  def recording_sampler = @provider.sampler = RecordingSampler.new

  def only_span(name = nil)
    matching = name ? spans.select { _1.name == name } : spans
    assert_equal(1, matching.length, "spans: #{spans.map(&:name)}")
    matching.first
  end

  def scope(span)
    span.respond_to?(:instrumentation_scope) ? span.instrumentation_scope : span.instrumentation_library
  end

  def stub_messages(*responses, url: MESSAGES_URL)
    @requests = []
    @contexts = []
    responses = [{status: 200, body: MESSAGE.to_json, headers: {"request-id" => "req_1"}}] if responses.empty?
    stub_request(:post, url).to_return(
      *responses.map do |response|
        lambda do |request|
          @requests << request.headers.transform_keys(&:downcase)
          @contexts << OpenTelemetry::Context.current
          {**response, headers: {"content-type" => "application/json", **response[:headers].to_h}}
        end
      end
    )
  end

  def sse(*events) = events.map { "event: #{_1[:type]}\ndata: #{_1.to_json}\n\n" }.join

  STREAM_EVENTS = [
    {
      type: "message_start",
      message: MESSAGE.merge(content: [], stop_reason: nil, usage: MESSAGE[:usage].merge(output_tokens: 1))
    },
    {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}},
    {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: "Hi"}},
    {type: "content_block_stop", index: 0},
    {type: "message_delta", delta: {stop_reason: "end_turn", stop_sequence: nil}, usage: {output_tokens: 5}},
    {type: "message_stop"}
  ].freeze

  def stream_response(events = STREAM_EVENTS)
    {
      status: 200,
      body: sse(*events),
      headers: {"content-type" => "text/event-stream", "request-id" => "req_1"}
    }
  end

  # A middleware whose response yields its whole body and then fails the read, as a dropped
  # connection does.
  DROPPED_CONNECTION = lambda do |req, nxt|
    res = nxt.call(req)
    body = Enumerator.new do |y|
      res.body.each { y << _1 }
      raise IOError.new("connection reset")
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

  # Writes one header per baggage entry and lists only its fixed field, as the Jaeger and
  # OTTrace propagators do.
  class HeaderPerEntryPropagator
    def inject(carrier, context: OpenTelemetry::Context.current, **)
      carrier["uber-trace-id"] = OpenTelemetry::Trace.current_span(context).context.hex_trace_id
      OpenTelemetry::Baggage.values(context: context).each { |key, value| carrier["uberctx-#{key}"] = value }
    end

    def extract(_carrier, context: OpenTelemetry::Context.current, **) = context

    def fields = ["uber-trace-id"]
  end

  CONVERSATION = [
    {role: :user, content: "What's the weather?"},
    {
      role: :assistant,
      content: [
        {type: :text, text: "I'll check."},
        {type: :tool_use, id: "toolu_1", name: "get_weather", input: {city: "Paris"}}
      ]
    },
    {
      role: :user,
      content: [
        {type: :tool_result, tool_use_id: "toolu_1", content: "sunny"},
        {type: :image, source: {type: :url, url: "https://example.com/a.png"}}
      ]
    }
  ].freeze

  def content_client(max_content_bytes: nil, **kw)
    traces = {content_mode: :content, max_content_bytes: max_content_bytes}.compact
    client(
      open_telemetry: {tracer_provider: @provider, traces: traces},
      **kw
    )
  end

  def json_attribute(span, name) = span.attributes[name]&.then { JSON.parse(_1) }

  TRUNCATED = "anthropic.content.truncated"

  private

  def with_global_provider(provider)
    previous = OpenTelemetry.tracer_provider
    OpenTelemetry.tracer_provider = provider
    yield
  ensure
    OpenTelemetry.tracer_provider = previous
  end

  def with_env(vars)
    previous = vars.to_h { [_1, ENV[_1]] }
    vars.each { ENV[_1] = _2 }
    yield
  ensure
    previous.each { ENV[_1] = _2 }
  end
end
