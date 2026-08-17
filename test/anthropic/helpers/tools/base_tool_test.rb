# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Helpers::Tools::BaseToolTest < Minitest::Test
  class GetWeatherInput < Anthropic::BaseModel
    required :location, String
  end

  class GetWeather < Anthropic::BaseTool
    doc "Get the current weather in a given location"
    input_schema GetWeatherInput
    tool_options strict: true, cache_control: {type: :ephemeral}

    def call(input) = input
  end

  class PlainWeather < Anthropic::BaseTool
    input_schema GetWeatherInput

    def call(input) = input
  end

  def test_tool_options_default_to_empty
    assert_equal({}, PlainWeather.tool_options)
    assert_predicate(PlainWeather.tool_options, :frozen?)
  end

  def test_tool_options_reads_back_declaration
    assert_equal({strict: true, cache_control: {type: :ephemeral}}, GetWeather.tool_options)
  end

  def test_tool_options_are_frozen
    assert_raises(FrozenError) { GetWeather.tool_options[:defer_loading] = true }
    assert_raises(FrozenError) { GetWeather.tool_options[:cache_control][:ttl] = "1h" }
    assert_equal({strict: true, cache_control: {type: :ephemeral}}, GetWeather.tool_options)
  end

  def test_tool_options_accumulate_and_are_inherited
    base = Class.new(Anthropic::BaseTool) { tool_options strict: true }
    tool_class = Class.new(base) do
      tool_options cache_control: {type: :ephemeral}
      tool_options defer_loading: true, strict: false
    end

    assert_equal({strict: true}, base.tool_options)
    assert_equal({strict: true}, Class.new(base).tool_options)
    assert_equal(
      {strict: false, cache_control: {type: :ephemeral}, defer_loading: true},
      tool_class.tool_options
    )
  end

  def test_tool_options_rejects_reserved_keys_and_non_hashes
    tool_class = Class.new(Anthropic::BaseTool)

    [:name, :description, :input_schema].each do |key|
      error = assert_raises(ArgumentError) { tool_class.tool_options(key => "nope", strict: true) }
      assert_match(/`#{key}` cannot be set through `tool_options`/, error.message)
    end
    error = assert_raises(ArgumentError) { tool_class.tool_options(:strict) }
    assert_match(/Expected a Hash/, error.message)
    assert_equal({}, tool_class.tool_options)
  end

  def test_tool_options_are_merged_into_the_tool_definition
    data = {tools: [GetWeather.new, PlainWeather.new]}
    Anthropic::Helpers::Messages.distill_input_schema_models!(data, strict: nil)

    input_schema = GetWeatherInput.to_json_schema
    assert_equal(
      [
        {
          name: "get_weather",
          description: "Get the current weather in a given location",
          input_schema: input_schema,
          strict: true,
          cache_control: {type: :ephemeral}
        },
        {name: "plain_weather", description: "plain_weather", input_schema: input_schema}
      ],
      data[:tools]
    )
  end

  # The name sent to the API must stay the one responses are parsed and dispatched under, even if a
  # subclass computes its options instead of declaring them.
  def test_derived_definition_keys_cannot_be_shadowed
    tool_class = Class.new(PlainWeather) do
      input_schema GetWeatherInput
      def self.name = "Renamed"
      def self.tool_options(_ = nil) = {name: "other", input_schema: {type: "object"}, strict: true}
    end
    data = {tools: [tool_class.new]}
    tools, = Anthropic::Helpers::Messages.distill_input_schema_models!(data, strict: nil)

    assert_equal(["renamed"], tools.keys)
    assert_pattern do
      data[:tools] => [{name: "renamed", input_schema: {properties: {location: _}}, strict: true}]
    end
  end

  def test_inspect_tolerates_tools_without_an_input_schema_model
    assert_equal("#{PlainWeather.name}[#{GetWeatherInput.name}]", PlainWeather.inspect(depth: 1))
    schemaless = Class.new(Anthropic::BaseTool)
    assert_equal("[nil]", schemaless.inspect)
    assert_match(/\A#<\[nil\]:0x\h+>\z/, schemaless.new.inspect)
  end
end
