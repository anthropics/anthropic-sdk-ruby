# frozen_string_literal: true

require_relative "support"

class Anthropic::Test::OpenTelemetryConfigTest < Anthropic::Test::OpenTelemetryTestCase
  def test_open_telemetry_false_emits_no_span_and_no_trace_headers
    stub_messages
    @provider.tracer("test").in_span("parent") do
      client(open_telemetry: false).messages.create(**PARAMS)
    end

    assert_equal(["parent"], spans.map(&:name))
    assert_nil(@requests.first["traceparent"])
  end

  def test_the_environment_variable_disables_a_client_that_is_given_no_option
    stub_messages
    with_env("ANTHROPIC_OPEN_TELEMETRY" => "FALSE") do
      with_global_provider(@provider) do
        Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key").messages.create(**PARAMS)
        Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key", open_telemetry: nil).messages.create(**PARAMS)
      end
    end

    assert_empty(spans)
    assert_equal([nil, nil], @requests.map { _1["traceparent"] })
  end

  def test_the_registered_tracer_provider_is_used_by_default
    stub_messages
    with_global_provider(@provider) do
      Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key").messages.create(**PARAMS)
    end

    assert_equal("anthropic.messages.create", only_span.name)
  end

  def test_tracer_provider_replaces_the_registered_provider
    stub_messages
    registered = OpenTelemetry::SDK::Trace::Export::InMemorySpanExporter.new
    other = OpenTelemetry::SDK::Trace::TracerProvider.new
    other.add_span_processor(OpenTelemetry::SDK::Trace::Export::SimpleSpanProcessor.new(registered))
    with_global_provider(other) { client.messages.create(**PARAMS) }

    assert_empty(registered.finished_spans)
    assert_equal(1, spans.length)
  end

  def test_open_telemetry_true_is_short_for_traces_true
    stub_messages
    with_global_provider(@provider) do
      Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key", open_telemetry: true).messages.create(**PARAMS)
      with_env("ANTHROPIC_OPEN_TELEMETRY" => "false") do
        Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key", open_telemetry: true).messages.create(**PARAMS)
      end
    end

    assert_equal(["anthropic.messages.create"] * 2, spans.map(&:name))
    assert_equal([nil, nil], spans.map { _1.attributes["gen_ai.input.messages"] })
  end

  def test_string_keys_are_honored_at_every_level_of_the_client_option
    stub_messages
    client(open_telemetry: {"tracer_provider" => @provider, "traces" => {"enabled" => false}})
      .messages.create(**PARAMS)
    assert_empty(spans)

    client(open_telemetry: {"tracer_provider" => @provider, "traces" => {"content_mode" => "content"}})
      .messages.create(**PARAMS)
    refute_nil(only_span.attributes["gen_ai.input.messages"])
  end

  def test_a_hash_subclass_that_keeps_string_keys_is_honored_too
    stub_messages
    traces = StringKeyedHash.from(enabled: false)
    client(open_telemetry: StringKeyedHash.from(tracer_provider: @provider, traces: traces))
      .messages.create(**PARAMS)
    assert_empty(spans)

    request_options = {open_telemetry: StringKeyedHash.from(conversation_id: "c1")}
    client(open_telemetry: false).messages.create(**PARAMS, request_options: request_options)
    assert_empty(spans)
    traces = StringKeyedHash.from(content_mode: :content)
    client(open_telemetry: StringKeyedHash.from(tracer_provider: @provider, traces: traces))
      .messages.create(**PARAMS, request_options: request_options)

    span = only_span
    assert_equal("c1", span.attributes["gen_ai.conversation.id"])
    refute_nil(span.attributes["gen_ai.input.messages"])
  end

  def test_a_string_keyed_request_option_sets_the_conversation_id
    stub_messages
    client.messages.create(**PARAMS, request_options: {open_telemetry: {"conversation_id" => "c1"}})

    assert_equal("c1", only_span.attributes["gen_ai.conversation.id"])
  end

  CLIENT_KEYS = "[:tracer_provider, :propagation, :traces]"
  TRACES_KEYS = "[:enabled, :content_mode, :max_content_bytes]"

  UNKNOWN_KEYS = {
    a_misspelled_key: [{trace: {}}, ":trace", CLIENT_KEYS],
    a_misspelled_string_key: [{"tracing" => {}}, ":tracing", CLIENT_KEYS],
    a_misspelled_key_of_traces: [{traces: {contnet_mode: :content}}, ":contnet_mode", TRACES_KEYS],
    a_misspelled_string_key_of_traces: [{"traces" => {"enable" => false}}, ":enable", TRACES_KEYS],
    the_former_signals_key: [{signals: {traces: false}}, ":signals", CLIENT_KEYS],
    the_former_place_of_the_content_mode: [{content_mode: :content}, ":content_mode", CLIENT_KEYS],
    a_key_of_the_request_option: [{conversation_id: "c1"}, ":conversation_id", CLIENT_KEYS]
  }.freeze

  UNKNOWN_KEYS.each do |name, (option, key, allowed)|
    define_method(:"test_#{name}_of_the_client_option_raises_and_names_the_key") do
      error = assert_raises(ArgumentError) { client(open_telemetry: {tracer_provider: @provider, **option}) }

      assert(error.message.end_with?("must be one of #{allowed}, got #{key}"), error.message)
      refute_match(/TracerProvider/, error.message)
    end
  end

  def test_an_unknown_key_of_the_request_option_raises_whether_or_not_the_client_traces
    stub_messages
    [client, client(open_telemetry: false)].each do |c|
      [{conversation: "c1"}, {"content_mode" => "content"}, "c1"].each do |option|
        error = assert_raises(ArgumentError) do
          c.messages.create(**PARAMS, request_options: {open_telemetry: option})
        end
        assert_match(/\ARequest `open_telemetry` /, error.message)
      end
    end
    assert_empty(spans)
    assert_not_requested(:post, MESSAGES_URL)
  end

  def test_an_invalid_option_raises
    assert_raises(ArgumentError) { client(open_telemetry: {traces: "no"}) }
    assert_raises(ArgumentError) { client(open_telemetry: {traces: {enabled: "no"}}) }
    assert_raises(ArgumentError) { client(open_telemetry: {traces: {content_mode: :everything}}) }
    assert_raises(ArgumentError) { client(open_telemetry: {traces: {max_content_bytes: 0}}) }
  end

  # An invalid option, with what the error message says it got.
  INVALID_OPTIONS = {
    a_string_for_propagation: [{propagation: "false"}, '"false"', "[:propagation]"],
    an_object_for_propagation: [{propagation: Object.new}, "a Object", "[:propagation]"],
    a_string_for_traces: [{traces: "off"}, '"off"', "[:traces]"],
    a_string_for_enabled: [{traces: {enabled: "no"}}, '"no"', "[:traces][:enabled]"],
    an_object_for_enabled: [{traces: {enabled: Object.new}}, "a Object", "[:traces][:enabled]"],
    an_unknown_content_mode: [{traces: {content_mode: :everything}}, ":everything", "[:traces][:content_mode]"],
    an_object_for_the_content_mode: [{traces: {content_mode: {secret: "s3cret"}}}, "a Hash", "[:traces][:content_mode]"],
    a_bound_of_zero: [{traces: {max_content_bytes: 0}}, "0", "[:traces][:max_content_bytes]"],
    a_negative_bound: [{traces: {max_content_bytes: -1}}, "-1", "[:traces][:max_content_bytes]"],
    a_fractional_bound: [{traces: {max_content_bytes: 1.5}}, "1.5", "[:traces][:max_content_bytes]"],
    a_string_for_the_bound: [{traces: {max_content_bytes: "1024"}}, '"1024"', "[:traces][:max_content_bytes]"],
    an_object_for_the_bound: [{traces: {max_content_bytes: [1024]}}, "a Array", "[:traces][:max_content_bytes]"]
  }.freeze

  INVALID_OPTIONS.each do |name, (invalid, got, key)|
    define_method(:"test_the_error_for_#{name}_names_that_value_and_not_the_tracer_provider") do
      option = {tracer_provider: @provider, **invalid}

      error = assert_raises(ArgumentError) { client(open_telemetry: option) }

      assert(error.message.start_with?("`open_telemetry` #{key} must be "), error.message)
      assert(error.message.end_with?(", got #{got}"), error.message)
      refute_match(/TracerProvider|tracer_provider|s3cret/, error.message)
      assert_includes(option.inspect, "TracerProvider")
    end
  end

  def test_the_error_for_an_option_that_is_no_hash_names_a_plain_value_and_else_its_class
    messages = [1, "on", [@provider]].map do |option|
      assert_raises(ArgumentError) { client(open_telemetry: option) }.message
    end

    assert_equal(["1", '"on"', "a Array"], messages.map { _1.split(", got ").last })
  end

  def test_tracing_patches_none_of_the_classes_of_the_sdk
    initialize = Anthropic::Client.instance_method(:initialize)
    keywords = initialize.parameters.filter_map { |kind, name| name if kind == :key }

    assert_equal(Anthropic::Client, initialize.owner)
    assert_empty([:api_key, :base_url, :open_telemetry] - keywords)
    [
      Anthropic::Internal::Stream,
      Anthropic::Internal::JsonLStream,
      Anthropic::Streaming::MessageStream
    ].each do |stream|
      refute(stream.method_defined?(:streamed_message), stream.name)
      refute(stream.method_defined?(:streamed_message=), stream.name)
    end
  end

  # `traces: false` is short for `traces: {enabled: false}`.
  {false: false, enabled_false: {enabled: false}, a_string_keyed_enabled_false: {"enabled" => false}}.each do |name, traces|
    define_method(:"test_traces_of_#{name}_disables_the_spans") do
      stub_messages
      client(open_telemetry: {tracer_provider: @provider, traces: traces}).messages.create(**PARAMS)

      assert_empty(spans)
      assert_nil(@requests.first["traceparent"])
    end
  end

  # `traces: true` is short for `traces: {enabled: true}`.
  {true: true, enabled_true: {enabled: true}}.each do |name, traces|
    define_method(:"test_a_client_with_traces_of_#{name}_ignores_the_environment_variable") do
      stub_messages
      with_env("ANTHROPIC_OPEN_TELEMETRY" => "false") do
        client(open_telemetry: {tracer_provider: @provider, traces: traces}).messages.create(**PARAMS)
      end

      assert_equal(1, spans.length)
      refute_nil(@requests.first["traceparent"])
    end
  end

  def test_traces_enabled_false_leaves_its_other_settings_unused
    stub_messages
    traces = {enabled: false, content_mode: :content, max_content_bytes: 16}
    with_env(CONTENT_ON) do
      @provider.tracer("test").in_span("parent") do
        client(open_telemetry: {tracer_provider: @provider, traces: traces}).messages.create(**PARAMS)
      end
    end

    assert_equal(["parent"], spans.map(&:name))
    assert_nil(@requests.first["traceparent"])
  end

  def test_the_settings_of_a_disabled_client_are_still_checked
    assert_raises(ArgumentError) { client(open_telemetry: {traces: {enabled: false, content_mode: :everything}}) }
    assert_raises(ArgumentError) { client(open_telemetry: {traces: {enabled: false, max_content_bytes: 0}}) }
  end

  def test_the_option_of_the_caller_is_left_as_it_was
    stub_messages
    traces = {"content_mode" => "content", max_content_bytes: 1024}
    option = {tracer_provider: @provider, "traces" => traces}
    client(open_telemetry: option).messages.create(**PARAMS)

    assert_equal({"content_mode" => "content", max_content_bytes: 1024}, traces)
    assert_equal([:tracer_provider, "traces"], option.keys)
    refute_predicate(option, :frozen?)
    refute_predicate(traces, :frozen?)
  end

  TRACES_OFF = {"ANTHROPIC_OPEN_TELEMETRY" => "false"}.freeze
  CONTENT_ON = {"ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE" => "content"}.freeze
  TRACES_OFF_AND_CONTENT_ON = {**TRACES_OFF, **CONTENT_ON}.freeze

  # A client's option without the tracer provider, and whether its span has the content.
  PARTIAL_OPTIONS = {
    the_value_true: [true, false],
    an_empty_option: [{}, false],
    traces_of_true: [{traces: true}, false],
    only_traces_enabled: [{traces: {enabled: true}}, false],
    only_a_content_mode: [{traces: {content_mode: :content}}, true],
    only_a_bound: [{traces: {max_content_bytes: 1024}}, false],
    an_empty_traces: [{traces: {}}, false],
    a_nil_traces: [{traces: nil}, false],
    a_nil_traces_enabled: [{traces: {enabled: nil, content_mode: :content}}, true],
    a_nil_content_mode: [{traces: {enabled: true, content_mode: nil}}, false]
  }.freeze

  PARTIAL_OPTIONS.each do |name, (option, content)|
    define_method(:"test_a_client_option_of_#{name}_has_the_defaults_for_the_keys_it_leaves_unset") do
      stub_messages
      with_global_provider(@provider) do
        with_env(TRACES_OFF_AND_CONTENT_ON) do
          Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key", open_telemetry: option)
                           .messages.create(**PARAMS)
        end
      end

      assert_equal([content], spans.map { _1.attributes.key?("gen_ai.input.messages") })
      refute_nil(@requests.first["traceparent"])
    end
  end

  def test_only_a_tracer_provider_has_the_defaults_too
    stub_messages
    with_env(TRACES_OFF_AND_CONTENT_ON) { client.messages.create(**PARAMS) }

    assert_equal([false], spans.map { _1.attributes.key?("gen_ai.input.messages") })
  end

  def test_the_environment_is_read_when_the_client_is_made_and_not_at_each_call
    stub_messages
    make = -> { Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key") }
    with_global_provider(@provider) do
      made_in_it = with_env(CONTENT_ON, &make)
      made_with_traces_off = with_env(TRACES_OFF, &make)
      made_outside_it = make.call

      made_in_it.messages.create(**PARAMS)
      made_with_traces_off.messages.create(**PARAMS)
      with_env(TRACES_OFF_AND_CONTENT_ON) { made_outside_it.messages.create(**PARAMS) }
    end

    assert_equal([true, false], spans.map { _1.attributes.key?("gen_ai.input.messages") })
    assert_equal([false, true, false], @requests.map { _1["traceparent"].nil? })
  end

  def test_a_request_option_keeps_the_tracer_provider_and_the_content_mode_of_the_client
    stub_messages
    registered = OpenTelemetry::SDK::Trace::Export::InMemorySpanExporter.new
    other = OpenTelemetry::SDK::Trace::TracerProvider.new
    other.add_span_processor(OpenTelemetry::SDK::Trace::Export::SimpleSpanProcessor.new(registered))
    request_options = {open_telemetry: {conversation_id: "c1"}}
    with_content = content_client
    without_traces = client(open_telemetry: {tracer_provider: @provider, traces: false})
    with_global_provider(other) do
      with_env({**TRACES_OFF, "ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE" => "metadata_only"}) do
        with_content.messages.create(**PARAMS, request_options: request_options)
        with_content.messages.create(**PARAMS)
      end
      with_env(CONTENT_ON) { without_traces.messages.create(**PARAMS, request_options: request_options) }
    end

    assert_empty(registered.finished_spans)
    assert_equal(["c1", nil], spans.map { _1.attributes["gen_ai.conversation.id"] })
    assert_equal([true, true], spans.map { _1.attributes.key?("gen_ai.input.messages") })
    assert_equal([false, false, true], @requests.map { _1["traceparent"].nil? })
  end

  def test_with_no_tracer_provider_a_call_behaves_as_before
    stub_messages(stream_response)
    with_global_provider(OpenTelemetry::Trace::TracerProvider.new) do
      c = Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key")
      events = c.messages.stream_raw(**PARAMS).map(&:type)

      assert_equal(STREAM_EVENTS.map { _1[:type].to_sym }, events)
    end
    assert_nil(@requests.first["traceparent"])
  end

  def test_with_no_tracer_provider_a_request_still_carries_the_current_trace_context
    stub_messages
    trace_id = "\x01" * 16
    parent = OpenTelemetry::Trace::SpanContext.new(
      trace_id: trace_id,
      span_id: "\x02" * 8,
      trace_flags: OpenTelemetry::Trace::TraceFlags::SAMPLED,
      remote: true
    )
    context = OpenTelemetry::Trace.context_with_span(OpenTelemetry::Trace.non_recording_span(parent))
    with_global_provider(OpenTelemetry::Trace::TracerProvider.new) do
      c = Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key")
      OpenTelemetry::Context.with_current(context) { c.messages.create(**PARAMS) }
    end

    assert_match(/\A00-#{trace_id.unpack1('H*')}-/, @requests.first["traceparent"])
  end
end
