# frozen_string_literal: true

require_relative "support"

# The tests stop reading streams early on purpose.
# rubocop:disable Lint/EmptyBlock, Lint/UnreachableLoop
class Anthropic::Test::OpenTelemetryToolRunnerTest < Anthropic::Test::OpenTelemetryTestCase
  class GetWeather < Anthropic::BaseTool
    class Input < Anthropic::BaseModel
      required :city, String
    end

    doc "Gets the weather"
    input_schema Input

    def call(input)
      raise "no weather in #{input.city}" if input.city == "Nowhere"

      "sunny"
    end
  end

  def tool_use_message(id, city)
    MESSAGE.merge(
      id: id,
      content: [{type: "tool_use", id: "toolu_#{id}", name: "get_weather", input: {city: city}}],
      stop_reason: "tool_use"
    )
  end

  def message_events(message)
    blocks = message[:content].each_with_index.flat_map do |block, index|
      [
        {type: "content_block_start", index: index, content_block: block},
        {type: "content_block_stop", index: index}
      ]
    end
    [
      {type: "message_start", message: message.merge(content: [], stop_reason: nil)},
      *blocks,
      {
        type: "message_delta",
        delta: {stop_reason: message[:stop_reason], stop_sequence: nil},
        usage: {output_tokens: message[:usage][:output_tokens]}
      },
      {type: "message_stop"}
    ]
  end

  def stub_runner(*messages)
    @requests = []
    stub_request(:post, "#{MESSAGES_URL}?beta=true").to_return(
      *messages.map do |message|
        lambda do |request|
          @requests << request.headers.transform_keys(&:downcase)
          if JSON.parse(request.body)["stream"] == true
            stream_response(message_events(message))
          else
            {status: 200, body: message.to_json, headers: {"content-type" => "application/json"}}
          end
        end
      end
    )
  end

  def runner(**params)
    client.beta.messages.tool_runner(
      **PARAMS,
      tools: [GetWeather.new],
      request_options: {open_telemetry: {conversation_id: "conv_1"}},
      **params
    )
  end

  def test_a_tool_runner_raises_for_an_open_telemetry_request_option_that_is_not_a_hash
    stub_runner(MESSAGE)
    runner = client.beta.messages.tool_runner(
      **PARAMS,
      tools: [GetWeather.new],
      request_options: {open_telemetry: "conv_1"}
    )

    error = assert_raises(ArgumentError) { runner.run_until_finished }
    assert_match(/\ARequest `open_telemetry` must be a Hash/, error.message)
    assert_equal([ERROR], spans.map { _1.status.code })
  end

  def test_a_tool_runner_loop_span_contains_each_request_and_each_tool_execution
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    runner.run_until_finished

    loop_span = only_span("anthropic.messages.tool_runner")
    assert_equal(:internal, loop_span.kind)
    assert_equal(OK, loop_span.status.code)
    assert_equal(
      {
        "gen_ai.operation.name" => "invoke_agent",
        "gen_ai.provider.name" => "anthropic",
        "gen_ai.request.model" => "claude-sonnet-4-5",
        "gen_ai.conversation.id" => "conv_1"
      },
      loop_span.attributes.to_h
    )

    tool = only_span("anthropic.custom_tool_use get_weather")
    assert_equal(:internal, tool.kind)
    assert_equal(OK, tool.status.code)
    assert_equal(
      {
        "gen_ai.operation.name" => "execute_tool",
        "gen_ai.provider.name" => "anthropic",
        "gen_ai.tool.name" => "get_weather",
        # The description is not content: it is there in the metadata-only mode.
        "gen_ai.tool.description" => "Gets the weather",
        "gen_ai.tool.call.id" => "toolu_msg_1",
        "gen_ai.tool.type" => "function",
        "gen_ai.conversation.id" => "conv_1"
      },
      tool.attributes.to_h
    )

    calls = spans.select { _1.name == "anthropic.messages.create" }
    assert_equal(2, calls.length)
    assert_equal(["conv_1"], calls.map { _1.attributes["gen_ai.conversation.id"] }.uniq)
    # Each request has its response's stop reason. The loop span, above, has none.
    assert_equal(%w[tool_use end_turn], calls.map { _1.attributes["anthropic.message.stop_reason"] })
    [tool, *calls].each { assert_equal(loop_span.span_id, _1.parent_span_id) }
  end

  def toolset_tool_use_message(toolset_name)
    message = tool_use_message("msg_1", "Paris")
    message.merge(content: message[:content].map { _1.merge(toolset_name) })
  end

  def test_the_span_of_a_tool_use_with_a_toolset_name_has_it
    stub_runner(toolset_tool_use_message({toolset_name: "computer"}), MESSAGE.merge(id: "msg_2"))
    sampler = recording_sampler
    # The client records no content: the name is not content.
    runner.each_message {}

    tool = only_span("anthropic.custom_tool_use get_weather")
    assert_equal("computer", tool.attributes["anthropic.toolset.name"])
    started = sampler.started.to_h.fetch("anthropic.custom_tool_use get_weather")
    assert_equal("computer", started["anthropic.toolset.name"])
  end

  def test_the_span_of_a_tool_use_without_a_toolset_name_has_none
    [{toolset_name: nil}, {toolset_name: 7}, {}].each do |toolset_name|
      stub_runner(toolset_tool_use_message(toolset_name), MESSAGE.merge(id: "msg_2"))
      runner.each_message {}

      tool = only_span("anthropic.custom_tool_use get_weather")
      assert_equal(OK, tool.status.code)
      refute_includes(tool.attributes.keys, "anthropic.toolset.name")
      @exporter.reset
    end
  end

  def test_only_the_spans_of_the_requests_of_a_tool_runner_have_the_http_attributes
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    runner.run_until_finished

    names = %w[http.request.method http.route url.scheme url.path url.query url.full http.request.resend_count]
    http = spans.to_h { [_1.name, _1.attributes.to_h.slice(*names)] }
    assert_equal({}, http.fetch("anthropic.messages.tool_runner"))
    assert_equal({}, http.fetch("anthropic.custom_tool_use get_weather"))
    assert_equal(
      {
        "http.request.method" => "POST",
        "http.route" => "/v1/messages",
        "url.scheme" => "http",
        "url.path" => "/v1/messages",
        "url.full" => MESSAGES_URL
      },
      http.fetch("anthropic.messages.create")
    )
  end

  def test_the_spans_of_a_tool_runner_start_with_their_attributes_for_a_sampler_to_read
    schema = {type: "object", properties: {summary: {type: "string"}}, required: ["summary"]}
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    sampler = recording_sampler
    output_config = {format: {type: :json_schema, schema: schema}}
    runner(thread: false, output_config: output_config, betas: %w[beta-a]).run_until_finished

    shared = {"gen_ai.provider.name" => "anthropic", "gen_ai.conversation.id" => "conv_1"}
    # Only the span of an API call has the server, the method and the route.
    request = {
      **shared,
      "server.address" => "localhost",
      "server.port" => 4010,
      "http.request.method" => "POST",
      "http.route" => "/v1/messages",
      "gen_ai.operation.name" => "chat",
      "gen_ai.request.model" => "claude-sonnet-4-5",
      "gen_ai.request.max_tokens" => 100,
      # The runner streams its requests.
      "gen_ai.request.stream" => true,
      "gen_ai.output.type" => "json",
      "anthropic.beta" => %w[beta-a]
    }
    assert_equal(
      [
        [
          "anthropic.messages.tool_runner",
          {
            **shared,
            "gen_ai.operation.name" => "invoke_agent",
            "gen_ai.request.model" => "claude-sonnet-4-5",
            "gen_ai.output.type" => "json"
          }
        ],
        ["anthropic.messages.create", request],
        [
          "anthropic.custom_tool_use get_weather",
          {
            **shared,
            "gen_ai.operation.name" => "execute_tool",
            "gen_ai.tool.name" => "get_weather",
            "gen_ai.tool.description" => "Gets the weather",
            "gen_ai.tool.call.id" => "toolu_msg_1",
            "gen_ai.tool.type" => "function"
          }
        ],
        ["anthropic.messages.create", request]
      ],
      sampler.started
    )
  end

  def test_a_tool_span_has_the_conversation_id_of_the_runner_and_none_when_it_is_unset
    requests = [
      {open_telemetry: {conversation_id: "conv_1"}},
      nil,
      {open_telemetry: {}},
      {open_telemetry: {"conversation_id" => "conv_2"}}
    ]
    requests.each do |request_options|
      stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
      options = request_options.nil? ? {} : {request_options: request_options}
      client.beta.messages.tool_runner(**PARAMS, tools: [GetWeather.new], **options).run_until_finished
    end

    tools = spans.select { _1.name == "anthropic.custom_tool_use get_weather" }
    assert_equal(["conv_1", nil, nil, "conv_2"], tools.map { _1.attributes["gen_ai.conversation.id"] })
    tools.each { assert_empty(_1.attributes.keys & %w[anthropic.session.id anthropic.session.thread.id]) }
  end

  def test_a_conversation_id_that_is_not_a_string_is_recorded_as_a_string
    {5 => "5", conv_1: "conv_1"}.each do |id, recorded|
      stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
      sampler = recording_sampler
      runner(request_options: {open_telemetry: {conversation_id: id}}).run_until_finished

      assert_equal(4, spans.length)
      assert_equal([recorded], spans.map { _1.attributes["gen_ai.conversation.id"] }.uniq, id.inspect)
      assert_equal([recorded], sampler.started.map { _2["gen_ai.conversation.id"] }.uniq, id.inspect)
      @exporter.reset
    end
  end

  class Forecast < Anthropic::BaseModel
    required :summary, String
  end

  def test_a_tool_runner_with_a_json_output_format_has_the_json_output_type
    schema = {type: "object", properties: {summary: {type: "string"}}, required: ["summary"]}
    stub_runner(MESSAGE)
    runner(output_config: {format: {type: :json_schema, schema: schema}}).run_until_finished
    runner(output_format: {type: :json_schema, schema: schema}).run_until_finished
    # The structured output helper turns the model class into a `json_schema` format for each request.
    runner(output_config: {format: Forecast}).run_until_finished
    runner(output_config: {format: {schema: Forecast}}).run_until_finished
    runner(output_config: {format: {type: :text}}).run_until_finished
    runner(output_config: {effort: :high}).run_until_finished

    expected = ["json", "json", "json", "json", nil, nil]
    loops = spans.select { _1.name == "anthropic.messages.tool_runner" }
    assert_equal(expected, loops.map { _1.attributes["gen_ai.output.type"] })
    # Each loop's request has the attribute too, or not.
    requests = spans.select { _1.name == "anthropic.messages.create" }
    assert_equal(expected, requests.map { _1.attributes["gen_ai.output.type"] })
  end

  def test_a_tool_runner_given_typed_params_reads_their_output_format
    schema = {type: "object", properties: {summary: {type: "string"}}, required: ["summary"]}
    stub_runner(MESSAGE, MESSAGE, MESSAGE)
    # Typed params keep `output_config` as a model, which has `[]` but not `dig`.
    typed = Anthropic::Beta::MessageCreateParams.new(
      **PARAMS,
      output_config: Anthropic::Beta::BetaOutputConfig.new(format: {type: :json_schema, schema: schema})
    )
    # A model of the format has its `type` only once it is serialized.
    model = Anthropic::Beta::MessageCreateParams.new(
      **PARAMS,
      output_config: {format: Anthropic::Beta::BetaJSONOutputFormat.new(schema: schema)}
    )
    plain = Anthropic::Beta::MessageCreateParams.new(
      **PARAMS,
      output_config: Anthropic::Beta::BetaOutputConfig.new(effort: :high)
    )

    assert_equal("msg_1", client.beta.messages.tool_runner(typed).run_until_finished.last.id)
    assert_equal("msg_1", client.beta.messages.tool_runner(model).run_until_finished.last.id)
    assert_equal("msg_1", client.beta.messages.tool_runner(plain).run_until_finished.last.id)
    quiet = client(open_telemetry: false)
    assert_equal("msg_1", quiet.beta.messages.tool_runner(typed).run_until_finished.last.id)

    loops = spans.select { _1.name == "anthropic.messages.tool_runner" }
    assert_equal(["json", "json", nil], loops.map { _1.attributes["gen_ai.output.type"] })
  end

  def test_runner_params_that_cannot_be_read_for_the_span_do_not_fail_the_runner
    stub_runner(MESSAGE)
    # A model that serializes for the API, but whose string form the span cannot take.
    model = Object.new
    def model.to_s = raise("unreadable")
    def model.to_json(*) = '"claude-sonnet-4-5"'

    assert_equal("msg_1", runner(model: model).run_until_finished.last.id)
    loop_span = only_span("anthropic.messages.tool_runner")
    assert_equal(OK, loop_span.status.code)
    assert_nil(loop_span.attributes["gen_ai.request.model"])
  end

  def test_a_tool_the_mcp_helper_made_runs_in_an_mcp_tool_use_span
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    mcp_client = Object.new
    def mcp_client.call_tool(name:, arguments:)
      {"content" => [{"type" => "text", "text" => "sunny in #{arguments['city']} (#{name})"}]}
    end
    schema = {"type" => "object", "properties" => {"city" => {"type" => "string"}}}
    tool = Anthropic::Mcp.tool({"name" => "get_weather", "inputSchema" => schema}, mcp_client)
    runner(tools: [tool]).run_until_finished

    tool_span = only_span("anthropic.mcp_tool_use get_weather")
    assert_equal(:internal, tool_span.kind)
    assert_equal(OK, tool_span.status.code)
    assert_equal(only_span("anthropic.messages.tool_runner").span_id, tool_span.parent_span_id)
    assert_equal(
      {
        "gen_ai.operation.name" => "execute_tool",
        "gen_ai.provider.name" => "anthropic",
        "gen_ai.tool.name" => "get_weather",
        "gen_ai.tool.call.id" => "toolu_msg_1",
        "gen_ai.tool.type" => "function",
        "gen_ai.conversation.id" => "conv_1"
      },
      tool_span.attributes.to_h
    )
    assert_empty(spans.select { _1.name.start_with?("anthropic.custom_tool_use") })
  end

  def test_a_tool_the_mcp_helper_made_has_the_description_of_the_mcp_server
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    mcp_client = Object.new
    def mcp_client.call_tool(**) = {"content" => [{"type" => "text", "text" => "sunny"}]}
    schema = {"type" => "object", "properties" => {"city" => {"type" => "string"}}}
    mcp_tool = {"name" => "get_weather", "description" => "Weather, from the server", "inputSchema" => schema}
    runner(tools: [Anthropic::Mcp.tool(mcp_tool, mcp_client)]).run_until_finished

    tool_span = only_span("anthropic.mcp_tool_use get_weather")
    assert_equal("Weather, from the server", tool_span.attributes["gen_ai.tool.description"])
  end

  class Undescribed < Anthropic::BaseTool
    input_schema GetWeather::Input

    def call(_input) = "sunny"
  end

  class DescribedByNothing < Undescribed
    doc ""
    input_schema GetWeather::Input
  end

  def test_a_tool_with_no_description_or_an_empty_one_has_no_description_attribute
    [Undescribed, DescribedByNothing].each do |tool|
      name = tool.name.split("::").last.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      use = MESSAGE.merge(
        content: [{type: "tool_use", id: "toolu_1", name: name, input: {city: "Paris"}}],
        stop_reason: "tool_use"
      )
      stub_runner(use, MESSAGE.merge(id: "msg_2"))
      runner(tools: [tool.new]).run_until_finished

      # The request describes such a tool by its name, which is not a description it was given.
      tool_span = only_span("anthropic.custom_tool_use #{name}")
      assert_equal(OK, tool_span.status.code)
      refute_includes(tool_span.attributes.keys, "gen_ai.tool.description")
    end
  end

  def test_a_description_that_is_not_valid_text_is_left_out
    descriptions = {
      "Weather caf\xC3\xA9".b => "Weather caf\u00e9",
      "Weather caf\xE9".dup.force_encoding(Encoding::ISO_8859_1) => "Weather caf\u00e9",
      "Weather \xFF".b => nil,
      "Weather \xFF".dup.force_encoding(Encoding::UTF_8) => nil
    }
    # The request cannot carry a description that is not text either, so the span is started as the runner starts it.
    tool_use = Anthropic::Beta::BetaToolUseBlock.new(id: "toolu_1", name: "get_weather", input: {})
    recorded = descriptions.each_key.map do |description|
      tool = Class.new(GetWeather) { doc description }.new
      Anthropic::Helpers::Tracing.start_tool_use_span(client, tool, tool_use, nil).finish
      spans.last.attributes["gen_ai.tool.description"]
    end

    assert_equal(descriptions.values, recorded)
    recorded.compact.each do |text|
      assert_equal(Encoding::UTF_8, text.encoding)
      assert_predicate(text, :valid_encoding?)
    end
  end

  def test_a_long_description_is_whole_in_either_content_mode
    described = Class.new(GetWeather) do
      doc "d" * 2_000_000
      input_schema GetWeather::Input

      def self.name = "GetWeather"
    end
    [client, content_client].each do |c|
      stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
      c.beta.messages.tool_runner(**PARAMS, tools: [described.new]).run_until_finished
    end

    tools = spans.select { _1.name == "anthropic.custom_tool_use get_weather" }
    assert_equal([2_000_000] * 2, tools.map { _1.attributes["gen_ai.tool.description"].length })
    tools.each { refute_includes(_1.attributes.keys, TRUNCATED) }
  end

  def test_a_tool_span_is_current_while_the_tool_runs_and_not_after
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    # The MCP client stands for a tool that is instrumented: it starts a span of its own while it runs.
    provider = @provider
    mcp_client = Object.new
    mcp_client.define_singleton_method(:call_tool) do |name:, arguments:|
      provider.tracer("tool").start_span("inside #{name}").finish
      {"content" => [{"type" => "text", "text" => "sunny in #{arguments['city']}"}]}
    end
    schema = {"type" => "object", "properties" => {"city" => {"type" => "string"}}}
    tool = Anthropic::Mcp.tool({"name" => "get_weather", "inputSchema" => schema}, mcp_client)
    runner(tools: [tool]).run_until_finished

    tool_span = only_span("anthropic.mcp_tool_use get_weather")
    assert_equal(tool_span.span_id, only_span("inside get_weather").parent_span_id)
    refute(OpenTelemetry::Trace.current_span.context.valid?)
  end

  # A tool whose input model tells the test when the runner, between a response and the tool's run,
  # matches a tool use to it: a place in the runner's own code that is no request, tool or callback.
  class ProbedWeather < Anthropic::BaseTool
    class Input < Anthropic::BaseModel
      required :city, String

      class << self
        attr_accessor :probe

        def ===(other)
          probe&.call
          super
        end
      end
    end

    doc "Gets the weather"
    input_schema Input

    def call(_input) = "sunny"
  end

  def test_the_runners_own_code_has_the_tool_runner_span_current_whatever_context_resumes_it
    use = MESSAGE.merge(
      content: [{type: "tool_use", id: "toolu_1", name: "probed_weather", input: {city: "Paris"}}],
      stop_reason: "tool_use"
    )
    stub_runner(use, MESSAGE.merge(id: "msg_2"))
    provider = @provider
    ProbedWeather::Input.probe = -> { provider.tracer("other").start_span("in the runner").finish }
    messages = client.beta.messages.tool_runner(**PARAMS, tools: [ProbedWeather.new]).to_enum(:each_message)

    # The application takes each message from a context of its own, and handles it there.
    own = %w[first second].map do |name|
      @provider.tracer("app").in_span(name) do |app_span|
        messages.next
        OpenTelemetry::Trace.current_span.equal?(app_span)
      end
    end
    assert_raises(StopIteration) { messages.next }

    assert_equal([true, true], own)
    tool_runner_span = only_span("anthropic.messages.tool_runner")
    inside = spans.reject { [tool_runner_span.name, "first", "second"].include?(_1.name) }
    assert_equal(
      ["anthropic.custom_tool_use probed_weather", "anthropic.messages.create", "in the runner"],
      inside.map(&:name).uniq.sort
    )
    assert_equal(2, inside.count { _1.name == "anthropic.messages.create" })
    inside.each { assert_equal(tool_runner_span.span_id, _1.parent_span_id, _1.name) }
  ensure
    ProbedWeather::Input.probe = nil
  end

  def test_the_block_that_handles_a_message_runs_in_the_context_the_loop_was_started_from
    stub_runner(
      tool_use_message("msg_1", "Paris"),
      MESSAGE.merge(id: "msg_2"),
      tool_use_message("msg_3", "Paris"),
      MESSAGE.merge(id: "msg_4")
    )
    current = []
    @provider.tracer("app").in_span("app") do |app_span|
      runner.each_message { current << OpenTelemetry::Trace.current_span.equal?(app_span) }
      runner.each_streaming { current << OpenTelemetry::Trace.current_span.equal?(app_span) }
    end

    assert_equal([true] * 4, current)
    tool_runner_spans = spans.select { _1.name == "anthropic.messages.tool_runner" }
    assert_equal([only_span("app").span_id] * 2, tool_runner_spans.map(&:parent_span_id))
  end

  def test_the_loop_span_is_not_current_while_the_application_handles_a_message
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    current = []
    runner.each_message { current << OpenTelemetry::Trace.current_span.context.span_id }

    loop_span = only_span("anthropic.messages.tool_runner")
    refute_includes(current, loop_span.span_id)
  end

  def test_a_tool_that_raises_fails_its_span_but_not_the_loop
    stub_runner(tool_use_message("msg_1", "Nowhere"), MESSAGE.merge(id: "msg_2"))
    runner.run_until_finished

    tool = only_span("anthropic.custom_tool_use get_weather")
    assert_equal(ERROR, tool.status.code)
    assert_equal("tool_error", tool.attributes["error.type"])
    assert_equal(OK, only_span("anthropic.messages.tool_runner").status.code)
  end

  def test_a_failed_request_fails_the_loop_with_its_error_type
    stub_messages(
      {status: 400, body: {type: "error", error: {type: "invalid_request_error", message: "x"}}.to_json},
      url: "#{MESSAGES_URL}?beta=true"
    )
    assert_raises(Anthropic::Errors::BadRequestError) { runner.each_message { nil } }

    loop_span = only_span("anthropic.messages.tool_runner")
    assert_equal(ERROR, loop_span.status.code)
    assert_equal("invalid_request_error", loop_span.attributes["error.type"])
  end

  def test_a_failed_streamed_request_fails_the_loop_with_its_error_type
    stub_messages(
      {status: 400, body: {type: "error", error: {type: "invalid_request_error", message: "x"}}.to_json},
      url: "#{MESSAGES_URL}?beta=true"
    )
    assert_raises(Anthropic::Errors::BadRequestError) { runner.each_streaming { nil } }

    loop_span = only_span("anthropic.messages.tool_runner")
    assert_equal(ERROR, loop_span.status.code)
    assert_equal("invalid_request_error", loop_span.attributes["error.type"])
  end

  def test_a_stream_that_fails_while_the_application_reads_it_fails_the_loop_with_its_error_type
    events = [STREAM_EVENTS.first, {type: "error", error: {type: "overloaded_error", message: "x"}}]
    stub_messages(stream_response(events), url: "#{MESSAGES_URL}?beta=true")
    assert_raises(Anthropic::Errors::APIStatusError) { runner.each_streaming { _1.each {} } }

    loop_span = only_span("anthropic.messages.tool_runner")
    assert_equal(ERROR, loop_span.status.code)
    assert_equal("overloaded_error", loop_span.attributes["error.type"])
  end

  def test_a_compaction_request_is_part_of_the_loop
    compacted = MESSAGE.merge(
      id: "msg_compacted",
      content: [{type: "compaction", content: "Summary so far.", signature: "sig_01"}],
      stop_reason: "compaction"
    )
    stub_runner(tool_use_message("msg_1", "Paris"), compacted, MESSAGE.merge(id: "msg_2"))
    tool_runner = runner
    current = []
    tool_runner.each_message do |message|
      current << OpenTelemetry::Trace.current_span.context.valid?
      tool_runner.compact_before_next_turn if message.id == "msg_1"
    end

    loop_span = only_span("anthropic.messages.tool_runner")
    assert_equal(OK, loop_span.status.code)
    # The application handles the compaction response as any other message, where the span is not current.
    assert_equal([false] * 3, current)
    # The compaction request is part of the loop, and of the conversation.
    requests = spans.select { _1.name == "anthropic.messages.create" }
    assert_equal([loop_span.span_id] * 3, requests.map(&:parent_span_id))
    assert_equal(["conv_1"], requests.map { _1.attributes["gen_ai.conversation.id"] }.uniq)
    assert_equal(%w[tool_use compaction end_turn], requests.map { _1.attributes["anthropic.message.stop_reason"] })
    refute(OpenTelemetry::Trace.current_span.context.valid?)
  end

  def test_a_loop_the_application_stops_leaves_the_status_unset
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    runner.each_message { break }

    assert_equal(UNSET, only_span("anthropic.messages.tool_runner").status.code)
  end

  def test_an_error_the_application_raises_stops_the_loop
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    assert_raises(RuntimeError) { runner.each_message { raise "stop" } }

    loop_span = only_span("anthropic.messages.tool_runner")
    assert_equal(UNSET, loop_span.status.code)
    assert_nil(loop_span.attributes["error.type"])
  end

  # Ruby has no cancellation token that reaches a tool: the application stops a run with
  # `Interrupt`, `Timeout`, or `Thread#raise`, none of which is a `StandardError`.
  def test_a_tool_run_the_application_interrupts_leaves_its_span_and_the_loop_span_unset
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    tool = GetWeather.new
    tool.define_singleton_method(:call) { |_input| raise Interrupt }
    assert_raises(Interrupt) { runner(tools: [tool]).run_until_finished }

    [
      only_span("anthropic.custom_tool_use get_weather"),
      only_span("anthropic.messages.tool_runner")
    ].each do |span|
      assert_equal(UNSET, span.status.code, span.name)
      assert_nil(span.attributes["error.type"], span.name)
    end
  end

  def test_a_streaming_loop_the_application_interrupts_leaves_the_status_unset
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    assert_raises(Interrupt) { runner.each_streaming { raise Interrupt } }

    assert_equal(UNSET, only_span("anthropic.messages.tool_runner").status.code)
  end

  def test_a_loop_that_reaches_its_iteration_limit_ends_its_span
    stub_runner(tool_use_message("msg_1", "Paris"), tool_use_message("msg_2", "Paris"))
    runner(max_iterations: 1).run_until_finished

    assert_equal(OK, only_span("anthropic.messages.tool_runner").status.code)
  end

  def test_a_tool_runner_with_spans_disabled_emits_none
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    Anthropic::Client.new(base_url: BASE_URL, api_key: "test-key", open_telemetry: false)
                     .beta.messages.tool_runner(**PARAMS, tools: [GetWeather.new])
                     .run_until_finished

    assert_empty(spans)
  end

  def test_a_tool_span_has_the_arguments_and_the_result_in_the_content_mode
    stub_runner(
      tool_use_message("msg_1", "Paris"),
      tool_use_message("msg_2", "Nowhere"),
      MESSAGE.merge(id: "msg_3")
    )
    content_client.beta.messages.tool_runner(**PARAMS, tools: [GetWeather.new]).run_until_finished

    tools = spans.select { _1.name == "anthropic.custom_tool_use get_weather" }
    assert_equal(
      [{"city" => "Paris"}, {"city" => "Nowhere"}],
      tools.map do
        json_attribute(_1, "gen_ai.tool.call.arguments")
      end
    )
    # A string is one `text` block, for an error result too.
    assert_equal(
      [
        [{"type" => "text", "text" => "sunny"}],
        [{"type" => "text", "text" => "no weather in Nowhere"}]
      ],
      tools.map { json_attribute(_1, "anthropic.tool_result.content") }
    )
    tools.each do
      refute_includes(_1.attributes.keys, "gen_ai.tool.call.result")
      refute_includes(_1.attributes.keys, TRUNCATED)
    end
    assert_equal([OK, ERROR], tools.map { _1.status.code })
  end

  class Snapshot < Anthropic::BaseTool
    class Input < Anthropic::BaseModel
      required :city, String
    end

    doc "Shows the weather"
    input_schema Input

    CITED = {
      type: "text",
      text: "sunny",
      citations: [
        {type: "char_location", cited_text: "sun", document_index: 0, start_char_index: 0, end_char_index: 3},
        {
          type: "web_search_result_location",
          cited_text: "sun",
          url: "https://example.com",
          title: "Weather",
          encrypted_index: "opaque"
        }
      ],
      cache_control: {type: "ephemeral"}
    }.freeze
    FOUND = {
      type: "search_result",
      source: "https://example.com",
      title: "Weather",
      content: [{type: "text", text: "sunny"}]
    }.freeze

    def call(_input)
      # One block has string keys, as a tool that parses JSON returns them.
      [CITED, JSON.parse(FOUND.to_json), {type: "image", source: {type: "base64", media_type: "image/png", data: "aGk="}}]
    end
  end

  def test_a_text_or_search_result_block_of_a_tool_result_is_whole_and_any_other_block_has_its_type_only
    snapshot_use = MESSAGE.merge(
      content: [{type: "tool_use", id: "toolu_1", name: "snapshot", input: {city: "Paris"}}],
      stop_reason: "tool_use"
    )
    stub_runner(snapshot_use, MESSAGE.merge(id: "msg_2"))
    content_client.beta.messages.tool_runner(
      **PARAMS,
      messages: [{role: :user, content: "Show"}],
      tools: [Snapshot.new]
    ).run_until_finished

    tool = only_span("anthropic.custom_tool_use snapshot")
    # A field whose name starts with `encrypted_` is left out, and the rest of the block is kept.
    cited = JSON.parse(Snapshot::CITED.to_json)
    cited["citations"].last.delete("encrypted_index")
    assert_equal(
      [cited, JSON.parse(Snapshot::FOUND.to_json), {"type" => "image"}],
      json_attribute(tool, "anthropic.tool_result.content")
    )
    refute_includes(tool.attributes.keys, "gen_ai.tool.call.result")
  end

  def test_a_tool_result_without_content_is_an_empty_list
    essay = Essay.new
    essay.define_singleton_method(:call) { |_input| [] }
    tool = run_essay(content_client, essay)

    assert_equal("[]", tool.attributes["anthropic.tool_result.content"])
    refute_includes(tool.attributes.keys, TRUNCATED)
    assert_equal(OK, tool.status.code)
    # The runner gives every result a `content`. A result block without one is the same list.
    assert_equal([], Anthropic::Helpers::Tracing.tool_result_content(nil))
  end

  def test_a_tool_run_the_application_interrupts_has_no_result_content
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    tool = GetWeather.new
    tool.define_singleton_method(:call) { |_input| raise Interrupt }
    assert_raises(Interrupt) do
      content_client.beta.messages.tool_runner(**PARAMS, tools: [tool]).run_until_finished
    end

    tool_span = only_span("anthropic.custom_tool_use get_weather")
    assert_equal({"city" => "Paris"}, json_attribute(tool_span, "gen_ai.tool.call.arguments"))
    refute_includes(tool_span.attributes.keys, "anthropic.tool_result.content")
    refute_includes(tool_span.attributes.keys, "gen_ai.tool.call.result")
  end

  class Essay < Anthropic::BaseTool
    class Input < Anthropic::BaseModel
      required :topic, String
    end

    doc "Writes at length"
    input_schema Input

    def call(_input) = [{type: "text", text: "a" * 600_000}, {type: "text", text: "b" * 600_000}]
  end

  def run_essay(client, tool)
    essay_use = MESSAGE.merge(
      content: [{type: "tool_use", id: "toolu_1", name: "essay", input: {topic: "x"}}],
      stop_reason: "tool_use"
    )
    stub_runner(essay_use, MESSAGE.merge(id: "msg_2"))
    # The runner appends to the messages it is given, so these are not the shared ones.
    client.beta.messages.tool_runner(
      **PARAMS,
      messages: [{role: :user, content: "Write"}],
      tools: [tool]
    ).run_until_finished
    spans.reverse.find { _1.name == "anthropic.custom_tool_use essay" }
  end

  def test_a_tool_result_over_the_limit_loses_its_last_blocks
    tool = run_essay(content_client, Essay.new)

    # The first block fits with the arguments, whole, and the second does not.
    assert_equal(
      [{"type" => "text", "text" => "a" * 600_000}],
      json_attribute(tool, "anthropic.tool_result.content")
    )
    assert_equal({"topic" => "x"}, json_attribute(tool, "gen_ai.tool.call.arguments"))
    assert_equal(true, tool.attributes[TRUNCATED])
    assert_equal(OK, tool.status.code)
  end

  def test_a_string_tool_result_over_the_limit_is_an_empty_list
    essay = Essay.new
    essay.define_singleton_method(:call) { |_input| "a" * Anthropic::Helpers::Tracing::CONTENT_LIMIT }
    tool = run_essay(content_client, essay)

    # A string is one content block, which is removed whole.
    assert_equal([], json_attribute(tool, "anthropic.tool_result.content"))
    assert_equal({"topic" => "x"}, json_attribute(tool, "gen_ai.tool.call.arguments"))
    assert_equal(true, tool.attributes[TRUNCATED])
  end

  def test_max_content_bytes_replaces_the_limit_of_a_tool_span
    essay = Essay.new
    essay.define_singleton_method(:call) do |_input|
      [{type: "text", text: "a" * 100}, {type: "text", text: "b" * 100}]
    end
    tool = run_essay(content_client(max_content_bytes: 200), essay)

    assert_equal([{"type" => "text", "text" => "a" * 100}], json_attribute(tool, "anthropic.tool_result.content"))
    assert_equal({"topic" => "x"}, json_attribute(tool, "gen_ai.tool.call.arguments"))
    assert_equal(true, tool.attributes[TRUNCATED])
  end

  def test_a_tool_result_over_the_limit_is_no_content_in_the_metadata_only_mode
    tool = run_essay(client, Essay.new)

    refute_includes(tool.attributes.keys, "anthropic.tool_result.content")
    refute_includes(tool.attributes.keys, "gen_ai.tool.call.arguments")
    refute_includes(tool.attributes.keys, TRUNCATED)
  end

  # The cases of a tool's span that every SDK shares. Each has the most bytes the content holds,
  # the arguments and the result's content blocks, the arguments and the blocks that are expected
  # to stay, whether the span is marked, and the bytes that are left. Arguments that fit the bound
  # stay whole and count toward it, and arguments that are expected to be `nil` are left out.
  TOOL_SIZE_BOUND_CASES = {
    tool_span_blocks_go_from_the_end: {
      bound: 152,
      arguments: {city: "Paris"},
      result: [
        {type: "text", text: "first #{'1' * 30}"},
        {type: "text", text: "second #{'2' * 30}"},
        {type: "image"},
        {type: "text", text: "fourth #{'4' * 30}"}
      ],
      expected: {
        arguments: {city: "Paris"},
        result: [
          {type: "text", text: "first #{'1' * 30}"},
          {type: "text", text: "second #{'2' * 30}"}
        ]
      },
      truncated: true,
      size: 142
    },
    tool_span_arguments_alone_over_the_bound: {
      bound: 100,
      arguments: {text: "w" * 150},
      result: [{type: "text", text: "ok"}],
      expected: {arguments: nil, result: [{type: "text", text: "ok"}]},
      truncated: true,
      size: 29
    }
  }.freeze

  def tool_content_span(bound, arguments, result)
    span = @provider.tracer("test").start_span("anthropic.custom_tool_use essay")
    Anthropic::Helpers::Tracing.set_content_attributes(
      span,
      nil,
      {"gen_ai.tool.call.arguments" => arguments, "anthropic.tool_result.content" => result},
      limit: bound
    )
    span.finish
    spans.last
  end

  TOOL_SIZE_BOUND_CASES.each do |name, shared|
    define_method(:"test_size_bound_#{name}") do
      span = tool_content_span(shared[:bound], shared[:arguments], shared[:result])

      # No other attribute is set, and a list that lost every block would stay in its attribute.
      expected = {
        "gen_ai.tool.call.arguments" => shared[:expected][:arguments],
        "anthropic.tool_result.content" => shared[:expected][:result]
      }.compact.transform_values { JSON.generate(_1) }
      expected[TRUNCATED] = true if shared[:truncated]
      assert_equal(expected, span.attributes)
      assert_equal(shared[:size], span.attributes.values.grep(String).sum(&:bytesize))
    end
  end

  def test_tool_arguments_stay_at_the_bound_and_are_left_out_one_byte_over_it
    result = [{type: "text", text: "ok"}]
    at = {text: "w" * 89}
    over = {text: "w" * 90}
    assert_equal([100, 101], [at, over].map { JSON.generate(_1).bytesize })

    # Arguments that fit take the whole bound, and the result loses its block.
    assert_equal(
      {
        "gen_ai.tool.call.arguments" => JSON.generate(at),
        "anthropic.tool_result.content" => "[]",
        TRUNCATED => true
      },
      tool_content_span(100, at, result).attributes
    )
    # Arguments that do not fit are left out, and the result has the whole bound.
    assert_equal(
      {"anthropic.tool_result.content" => JSON.generate(result), TRUNCATED => true},
      tool_content_span(100, over, result).attributes
    )
  end

  def test_tool_arguments_over_the_bound_are_left_out_of_a_span_without_a_result
    assert_equal({TRUNCATED => true}, tool_content_span(100, {text: "w" * 150}, nil).attributes)
  end

  def test_tool_arguments_over_max_content_bytes_are_left_out_of_a_tool_run
    essay = Essay.new
    essay.define_singleton_method(:call) { |_input| "ok" }
    tool = run_essay(content_client(max_content_bytes: 12), essay)

    assert_equal(13, JSON.generate({topic: "x"}).bytesize)
    refute_includes(tool.attributes.keys, "gen_ai.tool.call.arguments")
    assert_equal("[]", tool.attributes["anthropic.tool_result.content"])
    assert_equal(true, tool.attributes[TRUNCATED])
    assert_equal(OK, tool.status.code)
  end

  def test_the_streamed_requests_of_a_tool_runner_have_their_output_in_the_content_mode
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    content_client.beta.messages.tool_runner(**PARAMS, tools: [GetWeather.new]).run_until_finished

    requests = spans.select { _1.name == "anthropic.messages.create" }
    assert_equal([true, true], requests.map { _1.attributes["gen_ai.request.stream"] })
    assert_equal(
      [
        [
          {
            "type" => "tool_call",
            "id" => "toolu_msg_1",
            "name" => "get_weather",
            "arguments" => {"city" => "Paris"}
          }
        ],
        [{"type" => "text", "content" => "Hi"}]
      ],
      requests.map { json_attribute(_1, "gen_ai.output.messages").first["parts"] }
    )
  end

  def test_the_requests_of_a_streaming_loop_have_the_output_the_stream_helper_accumulated
    stub_runner(tool_use_message("msg_1", "Paris"), MESSAGE.merge(id: "msg_2"))
    content_client.beta.messages.tool_runner(**PARAMS, tools: [GetWeather.new]).each_streaming { _1.each {} }

    requests = spans.select { _1.name == "anthropic.messages.create" }
    assert_equal(
      [%w[tool_call], %w[text]],
      requests.map { json_attribute(_1, "gen_ai.output.messages").first["parts"].map { |part| part["type"] } }
    )
  end

  # A block that serializes for the API, but that the span cannot read.
  class OpaqueBlock
    def to_json(*) = '{"type":"text","text":"12:00"}'
  end

  class Clock < Anthropic::BaseTool
    class Input < Anthropic::BaseModel
      required :zone, String
    end

    doc "Tells the time"
    input_schema Input

    def call(_input) = [OpaqueBlock.new]
  end

  def test_a_tool_result_that_cannot_be_recorded_does_not_fail_the_run
    clock_use = MESSAGE.merge(
      content: [{type: "tool_use", id: "toolu_1", name: "clock", input: {zone: "UTC"}}],
      stop_reason: "tool_use"
    )
    stub_runner(clock_use, MESSAGE.merge(id: "msg_2"))
    runner = content_client.beta.messages.tool_runner(
      **PARAMS,
      messages: [{role: :user, content: "What time is it?"}],
      tools: [Clock.new]
    )
    messages = runner.run_until_finished

    assert_equal("msg_2", messages.last.id)
    tool = only_span("anthropic.custom_tool_use clock")
    assert_equal(OK, tool.status.code)
    assert_nil(tool.attributes["anthropic.tool_result.content"])
    assert_equal(OK, only_span("anthropic.messages.tool_runner").status.code)
  end
end
# rubocop:enable Lint/EmptyBlock, Lint/UnreachableLoop
