# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Helpers::ToolRunner::ToolChangesTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

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
    @client = Anthropic::Client.new(base_url: "http://localhost", api_key: "test-key")
    @calls = []
    @get_weather = GetWeather.new(@calls)
    @get_time = GetTime.new(@calls)
  end

  def teardown
    WebMock.reset!
    super
  end

  class CityInput < Anthropic::BaseModel
    required :city, String
  end

  # Appends `label` (the tool's name by default) to `calls` when it runs.
  class CityTool < Anthropic::BaseTool
    def initialize(calls, label = nil)
      super()
      @calls = calls
      @label = label || Anthropic::Helpers::Messages.tool_api_name(self)
    end

    def call(input)
      @calls << @label
      answer(input.city)
    end
  end

  class GetWeather < CityTool
    doc "Get the current weather in a given city."
    input_schema CityInput

    def answer(city) = "Sunny in #{city}"
  end

  class GetTime < CityTool
    doc "Get the current local time in a given city."
    input_schema CityInput
    tool_options strict: true

    def answer(city) = "12:00 in #{city}"
  end

  CITY_SCHEMA = {
    type: "object",
    properties: {city: {type: "string"}},
    required: ["city"],
    additionalProperties: false
  }.freeze

  # `GetTime` as it is sent in `tools`.
  GET_TIME_DEFINITION = {
    name: "get_time",
    description: "Get the current local time in a given city.",
    input_schema: CITY_SCHEMA,
    strict: true
  }.freeze

  WEB_SEARCH = {type: "web_search_20250305", name: "web_search", max_uses: 3}.freeze

  def addition(definition) = {type: "tool_addition", tool: {type: "tool_definition", definition:}}

  def removal(name) = {type: "tool_removal", tool: {type: "tool_reference", name:}}

  def call_tool(id, name) = {type: "tool_use", id:, name:, input: {city: "Paris"}}

  def response(id, content, stop_reason: "tool_use")
    {
      status: 200,
      headers: {"Content-Type" => "application/json"},
      body: {
        id:,
        type: "message",
        role: "assistant",
        model: "claude-sonnet-4-5",
        content:,
        stop_reason:,
        usage: {input_tokens: 10, output_tokens: 20}
      }.to_json
    }
  end

  def final_response(id) = response(id, [{type: "text", text: "Done"}], stop_reason: "end_turn")

  # Serves `responses` in order and returns the request bodies as they arrive.
  def stub_responses(*responses)
    [].tap do |bodies|
      stub_request(:post, "http://localhost/v1/messages")
        .to_return do |request|
          bodies << JSON.parse(request.body, symbolize_names: true)
          responses.fetch(bodies.length - 1)
        end
    end
  end

  def new_runner(tools: [@get_weather], **params)
    @client.beta.messages.tool_runner(
      {
        max_tokens: 1024,
        model: "claude-sonnet-4-5",
        betas: ["inline-tools-2026-09-15"],
        messages: [{role: :user, content: "What is it like in Paris?"}],
        tools:,
        **params
      }
    )
  end

  # Runs `runner` to the end, calling `script[message.id]` while each message is being handled.
  def drive(runner, script = {})
    runner.each_message { script[_1.id]&.call }
  end

  def tool_result(body, tool_use_id)
    body[:messages].flat_map { _1[:content] }.find { _1.is_a?(Hash) && _1[:tool_use_id] == tool_use_id }
  end

  def assert_not_found(result, name)
    assert_pattern { result => {type: "tool_result", is_error: true, content: /'#{name}' not found/} }
  end

  def assert_tools_never_change(bodies)
    assert_equal([bodies.first[:tools]], bodies.map { _1[:tools] }.uniq)
  end

  def test_add_tools_is_sent_after_the_tool_results_and_registers_the_tool
    bodies = stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather")]),
      response("msg_2", [call_tool("tool_2", "get_time")]),
      final_response("msg_3")
    )

    runner = new_runner(thread: false)
    drive(runner, "msg_1" => -> { runner.add_tools(@get_time) })

    assert_pattern do
      bodies[1][:messages].last(2) => [
        {role: "user", content: [{type: "tool_result", tool_use_id: "tool_1"}]},
        {role: "system", content: [^(addition(GET_TIME_DEFINITION))]}
      ]
    end
    assert_pattern { tool_result(bodies[2], "tool_2") => {is_error: false, content: "12:00 in Paris"} }
    assert_equal(%w[get_weather get_time], @calls)
    assert_tools_never_change(bodies)
  end

  def test_remove_tools_stops_a_call_already_in_the_turn_by_tool_or_name
    bodies = stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather"), call_tool("tool_2", "get_time")]),
      final_response("msg_2")
    )

    runner = new_runner(tools: [@get_weather, @get_time])
    drive(runner, "msg_1" => -> { runner.remove_tools(@get_weather, :get_time) })

    assert_empty(@calls)
    assert_not_found(tool_result(bodies[1], "tool_1"), "get_weather")
    assert_not_found(tool_result(bodies[1], "tool_2"), "get_time")
    assert_pattern do
      bodies[1][:messages].last => {role: "system", content: [^(removal("get_weather")), ^(removal("get_time"))]}
    end
  end

  def test_a_removed_tool_stays_removed_when_its_block_leaves_the_history_until_added_again
    bodies = stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather")]),
      response("msg_2", [call_tool("tool_2", "get_weather")]),
      response("msg_3", [call_tool("tool_3", "get_weather")]),
      final_response("msg_4")
    )

    runner = new_runner
    drive(
      runner,
      "msg_1" => -> { runner.remove_tools("get_weather") },
      "msg_2" => -> { runner.params[:messages].delete_if { _1[:role] == :system } },
      "msg_3" => -> { runner.add_tools(@get_weather) }
    )

    assert_equal(["get_weather"], @calls)
    assert_not_found(tool_result(bodies[2], "tool_1"), "get_weather")
    assert_not_found(tool_result(bodies[2], "tool_2"), "get_weather")
    assert_pattern { tool_result(bodies[3], "tool_3") => {is_error: false, content: "Sunny in Paris"} }
  end

  def test_a_removed_tool_added_again_answers_a_call_already_in_the_turn
    bodies = stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather")]),
      response("msg_2", [call_tool("tool_2", "get_weather")]),
      final_response("msg_3")
    )

    runner = new_runner(thread: false)
    drive(
      runner,
      "msg_1" => -> { runner.remove_tools("get_weather") },
      "msg_2" => -> { runner.add_tools(@get_weather) }
    )

    assert_pattern { bodies[1][:messages].last => {role: "system", content: [^(removal("get_weather"))]} }
    assert_not_found(tool_result(bodies[2], "tool_1"), "get_weather")
    assert_pattern { tool_result(bodies[2], "tool_2") => {is_error: false, content: "Sunny in Paris"} }
    assert_equal(["get_weather"], @calls)
  end

  def test_changes_in_one_turn_go_out_together_in_call_order_and_are_not_collapsed
    bodies = stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather")]),
      response("msg_2", [call_tool("tool_2", "get_time"), call_tool("tool_3", "get_weather")]),
      final_response("msg_3")
    )

    runner = new_runner
    drive(
      runner,
      "msg_1" => lambda {
        runner.add_tools(@get_time)
        runner.remove_tools(@get_time)
        runner.remove_tools("get_weather")
        runner.add_tools(@get_weather)
      }
    )

    assert_pattern do
      bodies[1][:messages].last => {
        role: "system",
        content: [
          {type: "tool_addition", tool: {definition: {name: "get_time"}}},
          ^(removal("get_time")),
          ^(removal("get_weather")),
          {type: "tool_addition", tool: {definition: {name: "get_weather"}}}
        ]
      }
    end
    assert_not_found(tool_result(bodies[2], "tool_2"), "get_time")
    assert_pattern { tool_result(bodies[2], "tool_3") => {is_error: false, content: "Sunny in Paris"} }
  end

  def test_add_tools_replaces_a_tool_of_the_same_name_straight_away_even_for_a_call_already_in_the_turn
    stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather")]),
      response("msg_2", [call_tool("tool_2", "get_weather")]),
      final_response("msg_3")
    )

    runner = new_runner(tools: [GetWeather.new(@calls, "old")])
    drive(runner, "msg_1" => -> { runner.add_tools(GetWeather.new(@calls, "new")) })

    assert_equal(%w[new new], @calls)
  end

  class LocationInput < Anthropic::BaseModel
    required :location, String
  end

  module ByLocation
    class GetWeather < Anthropic::BaseTool
      doc "Get the current weather at a given location."
      input_schema LocationInput

      def parse(value)
        raise ArgumentError.new("location: expected a string") unless value[:location].is_a?(String)

        value
      end

      def call(input) = "Raining in #{input.location}"
    end
  end

  def test_a_call_already_in_the_turn_gets_the_input_error_of_the_tool_added_under_its_name
    bodies = stub_responses(response("msg_1", [call_tool("tool_1", "get_weather")]), final_response("msg_2"))

    runner = new_runner
    drive(runner, "msg_1" => -> { runner.add_tools(ByLocation::GetWeather.new) })

    assert_empty(@calls)
    assert_pattern do
      tool_result(bodies[1], "tool_1") => {is_error: true, content: "location: expected a string"}
    end
    assert_pattern do
      bodies[1][:messages].last => {
        role: "system",
        content: [{type: "tool_addition", tool: {definition: {input_schema: {required: ["location"]}}}}]
      }
    end
  end

  def test_a_raw_definition_is_sent_as_given_and_never_run_even_over_a_tool_of_the_same_name
    get_weather = {name: "get_weather", description: "Weather from a service.", input_schema: CITY_SCHEMA}
    bodies = stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather")]),
      response("msg_2", [call_tool("tool_2", "get_weather")]),
      final_response("msg_3")
    )

    runner = new_runner
    drive(runner, "msg_1" => -> { runner.add_tools(get_weather, WEB_SEARCH) })

    assert_empty(@calls)
    assert_pattern do
      bodies[1][:messages].last => {role: "system", content: [^(addition(get_weather)), ^(addition(WEB_SEARCH))]}
    end
    assert_not_found(tool_result(bodies[1], "tool_1"), "get_weather")
    assert_not_found(tool_result(bodies[2], "tool_2"), "get_weather")
  end

  def test_a_tool_added_by_value_in_a_message_is_not_run_as_another_tool_of_the_same_input_shape
    by_value = {name: "get_time", description: "Time.", input_schema: CityInput}
    stub_responses(response("msg_1", [call_tool("tool_1", "get_time")]), final_response("msg_2"))

    runner = new_runner(
      messages: [{role: :user, content: "Time?"}, {role: :system, content: [addition(by_value)]}]
    )
    drive(runner)

    assert_empty(@calls)
  end

  def test_changes_made_during_a_paused_turn_are_sent_one_request_later
    paused = [{type: "server_tool_use", id: "srvtoolu_1", name: "web_search", input: {query: "weather paris"}}]
    bodies = stub_responses(
      response("msg_1", paused, stop_reason: "pause_turn"),
      response("msg_2", [call_tool("tool_1", "get_weather")]),
      final_response("msg_3")
    )

    runner = new_runner(thread: false)
    drive(runner, "msg_1" => -> { runner.remove_tools("get_weather") })

    assert_empty(@calls)
    assert_pattern { bodies[1][:messages] => [{role: "user"}, {role: "assistant", content: ^paused}] }
    assert_pattern { bodies[2][:messages].last => {role: "system", content: [^(removal("get_weather"))]} }
    assert_not_found(tool_result(bodies[2], "tool_1"), "get_weather")
  end

  # The history can end in an assistant message without the turn being paused.
  def test_changes_are_not_held_after_a_compaction_turn
    compaction = [{type: "compaction", content: "Summary of the conversation so far."}]
    bodies = stub_responses(response("msg_1", compaction, stop_reason: "compaction"), final_response("msg_2"))

    runner = new_runner(thread: false)
    drive(runner, "msg_1" => -> { runner.add_tools(@get_time) })

    assert_pattern do
      bodies[1][:messages].last(2) => [
        {role: "assistant", content: ^compaction},
        {role: "system", content: [^(addition(GET_TIME_DEFINITION))]}
      ]
    end
  end

  COMPACTION = [{type: "compaction", content: "Summary so far.", signature: "sig_01"}].freeze

  def new_compacting_runner(**params)
    new_runner(betas: %w[inline-tools-2026-09-15 compact-2026-09-04], **params)
  end

  def test_changes_made_with_a_compaction_go_out_in_its_request_and_outlive_the_history
    bodies = stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather")]),
      response("msg_2", COMPACTION, stop_reason: "compaction"),
      response("msg_3", [call_tool("tool_2", "get_time"), call_tool("tool_3", "get_weather")]),
      final_response("msg_4")
    )

    runner = new_compacting_runner(thread: false)
    drive(
      runner,
      "msg_1" => lambda {
        runner.add_tools(@get_time)
        runner.remove_tools("get_weather")
        runner.compact_before_next_turn
      }
    )

    assert_equal({type: "summarize"}, bodies[1][:compaction])
    assert_pattern do
      bodies[1][:messages].last => {role: "system", content: [^(addition(GET_TIME_DEFINITION)), ^(removal("get_weather"))]}
    end
    assert_equal([{role: "assistant", content: COMPACTION}], bodies[2][:messages])
    assert_equal(["get_time"], @calls)
    assert_pattern { tool_result(bodies[3], "tool_2") => {is_error: false, content: "12:00 in Paris"} }
    assert_not_found(tool_result(bodies[3], "tool_3"), "get_weather")
    assert_tools_never_change(bodies)
  end

  def test_a_tool_removed_by_a_block_in_the_history_stays_removed_after_a_compaction
    bodies = stub_responses(
      response("msg_1", COMPACTION, stop_reason: "compaction"),
      response("msg_2", [call_tool("tool_1", "get_weather")]),
      final_response("msg_3")
    )

    runner = new_compacting_runner(
      messages: [{role: :user, content: "Weather?"}, {role: :system, content: [removal("get_weather")]}]
    )
    runner.compact_before_next_turn
    drive(runner)

    assert_empty(@calls)
    assert_equal([{role: "assistant", content: COMPACTION}], bodies[1][:messages])
    assert_not_found(tool_result(bodies[2], "tool_1"), "get_weather")
  end

  def test_a_removed_tool_added_again_while_handling_the_compaction_response_is_run_after_it
    bodies = stub_responses(
      response("msg_1", [call_tool("tool_1", "get_weather")]),
      response("msg_2", COMPACTION, stop_reason: "compaction"),
      response("msg_3", [call_tool("tool_2", "get_weather")]),
      final_response("msg_4")
    )

    runner = new_compacting_runner
    drive(
      runner,
      "msg_1" => lambda {
        runner.remove_tools("get_weather")
        runner.compact_before_next_turn
      },
      "msg_2" => -> { runner.add_tools(@get_weather) }
    )

    assert_pattern { bodies[1][:messages].last => {role: "system", content: [^(removal("get_weather"))]} }
    assert_pattern do
      bodies[2][:messages] => [
        {role: "assistant", content: COMPACTION},
        {role: "system", content: [{type: "tool_addition", tool: {definition: {name: "get_weather"}}}]}
      ]
    end
    assert_pattern { tool_result(bodies[3], "tool_2") => {is_error: false, content: "Sunny in Paris"} }
    assert_equal(["get_weather"], @calls)
  end

  def test_a_compaction_after_the_final_turn_does_not_send_pending_changes
    bodies = stub_responses(final_response("msg_1"), response("msg_2", COMPACTION, stop_reason: "compaction"))

    runner = new_compacting_runner
    drive(
      runner,
      "msg_1" => lambda {
        runner.add_tools(@get_time)
        runner.compact_before_next_turn
      }
    )

    assert_equal(2, bodies.length)
    assert_equal({type: "summarize"}, bodies[1][:compaction])
    assert_empty(bodies[1][:messages].select { _1[:role] == "system" })
  end

  def test_changes_pending_when_the_run_ends_are_not_sent
    bodies = stub_responses(response("msg_1", [call_tool("tool_1", "get_weather")]), final_response("msg_2"))

    runner = new_runner
    drive(runner, "msg_2" => -> { runner.add_tools(@get_time) })

    assert(runner.finished?)
    assert_equal(2, bodies.length)
    assert_empty(bodies.flat_map { _1[:messages] }.select { _1[:role] == "system" })
    assert_empty(runner.params[:messages].select { _1[:role] == :system })
  end

  def test_changes_do_not_add_a_beta_header
    stub_responses(final_response("msg_1"))

    runner = new_runner(thread: false, betas: nil)
    runner.add_tools(@get_time)
    runner.remove_tools("get_weather")
    drive(runner)

    assert_requested(:post, "http://localhost/v1/messages", times: 1) do |request|
      refute(request.headers.keys.any? { _1.casecmp?("anthropic-beta") })
    end
  end

  def sse(id, content, stop_reason:)
    events = [
      {
        type: "message_start",
        message: {
          id:,
          type: "message",
          role: "assistant",
          content: [],
          model: "claude-sonnet-4-5",
          usage: {input_tokens: 10, output_tokens: 0}
        }
      }
    ]
    content.each_with_index do |block, index|
      case block
      in {type: "text", text:}
        events << {type: "content_block_start", index:, content_block: {type: "text", text: ""}}
        events << {type: "content_block_delta", index:, delta: {type: "text_delta", text:}}
      in {type: "tool_use", input:}
        events << {type: "content_block_start", index:, content_block: {**block, input: {}}}
        events << {
          type: "content_block_delta",
          index:,
          delta: {type: "input_json_delta", partial_json: input.to_json}
        }
      end
      events << {type: "content_block_stop", index:}
    end
    events << {type: "message_delta", delta: {stop_reason:}, usage: {output_tokens: 20}}
    events << {type: "message_stop"}
    {
      status: 200,
      headers: {"content-type" => "text/event-stream"},
      body: events.map { "event: #{_1[:type]}\ndata: #{_1.to_json}\n\n" }.join
    }
  end

  def test_changes_when_streaming
    bodies = stub_responses(
      sse("msg_1", [call_tool("tool_1", "get_weather")], stop_reason: "tool_use"),
      sse("msg_2", [call_tool("tool_2", "get_time")], stop_reason: "tool_use"),
      sse("msg_3", [{type: "text", text: "Done"}], stop_reason: "end_turn")
    )

    runner = new_runner
    runner.each_streaming do |stream|
      next unless stream.accumulated_message.id == "msg_1"

      runner.add_tools(@get_time)
      runner.remove_tools(@get_weather)
    end

    assert_equal(["get_time"], @calls)
    assert_pattern do
      bodies[1][:messages].last => {role: "system", content: [^(addition(GET_TIME_DEFINITION)), ^(removal("get_weather"))]}
    end
    assert_not_found(tool_result(bodies[1], "tool_1"), "get_weather")
    assert_pattern { tool_result(bodies[2], "tool_2") => {is_error: false, content: "12:00 in Paris"} }
  end
end
