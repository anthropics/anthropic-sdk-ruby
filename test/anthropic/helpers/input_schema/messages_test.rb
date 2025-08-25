# frozen_string_literal: true

require_relative "../../test_helper"

module Anthropic
  module Helpers
    module InputSchema
      class MessagesTest < Minitest::Test
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
        end

        def teardown
          WebMock.reset!
          super
        end

        def stub_message_request(response_body:)
          stub_request(:post, "http://localhost/v1/messages")
            .to_return(
              status: 200,
              body: response_body.to_json,
              headers: {"content-type" => "application/json"}
            )
        end

        class GetWeather < Anthropic::Helpers::InputSchema::BaseModel
          doc "Get the weather in a location"
          required :location, String, "The location to get weather for"
          optional :unit, Anthropic::Helpers::InputSchema::EnumOf["celsius", "fahrenheit"], "Temperature unit"
        end

        class Calculator < Anthropic::Helpers::InputSchema::BaseModel
          doc "Perform calculations"
          required :operation,
                   Anthropic::Helpers::InputSchema::EnumOf["add", "subtract", "multiply", "divide"]
          required :a, Float
          required :b, Float
        end

        def test_create_with_single_tool_model
          response_body = {
            id: "msg_123",
            type: "message",
            role: "assistant",
            content: [
              {type: "text", text: "I'll check the weather for you."},
              {
                type: "tool_use",
                id: "tool_456",
                name: "GetWeather",
                input: {location: "San Francisco", unit: "celsius"}
              }
            ],
            usage: {input_tokens: 10, output_tokens: 20}
          }

          stub_message_request(response_body: response_body)

          message = @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "What's the weather?"}],
            tools: [GetWeather]
          )

          assert_equal("msg_123", message.id)
          tool_use = message.content.find { _1.type == :tool_use }
          assert_equal("GetWeather", tool_use.name)
          assert_instance_of(GetWeather, tool_use.parsed)
          assert_equal("San Francisco", tool_use.parsed.location)
          assert_equal(:celsius, tool_use.parsed.unit)
        end

        def test_create_with_multiple_tool_models
          response_body = {
            id: "msg_123",
            type: "message",
            role: "assistant",
            content: [
              {
                type: "tool_use",
                id: "tool_1",
                name: "Calculator",
                input: {operation: "add", a: 5.0, b: 3.0}
              },
              {
                type: "tool_use",
                id: "tool_2",
                name: "GetWeather",
                input: {location: "NYC"}
              }
            ],
            usage: {input_tokens: 10, output_tokens: 20}
          }

          stub_message_request(response_body: response_body)

          message = @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Add 5+3 and check NYC weather"}],
            tools: [Calculator, GetWeather]
          )

          calc_tool = message.content.find { _1.name == "Calculator" }
          weather_tool = message.content.find { _1.name == "GetWeather" }

          assert_instance_of(Calculator, calc_tool.parsed)
          assert_equal(:add, calc_tool.parsed.operation)
          assert_equal(5.0, calc_tool.parsed.a)
          assert_equal(3.0, calc_tool.parsed.b)

          assert_instance_of(GetWeather, weather_tool.parsed)
          assert_equal("NYC", weather_tool.parsed.location)
          assert_nil(weather_tool.parsed.unit)
        end

        def test_create_with_mixed_tools
          raw_tool = {
            name: "raw_tool",
            description: "A raw tool",
            input_schema: {
              type: "object",
              properties: {value: {type: "string"}}
            }
          }

          response_body = {
            id: "msg_123",
            type: "message",
            role: "assistant",
            content: [
              {
                type: "tool_use",
                id: "tool_1",
                name: "GetWeather",
                input: {location: "London"}
              },
              {
                type: "tool_use",
                id: "tool_2",
                name: "raw_tool",
                input: {value: "test"}
              }
            ],
            usage: {input_tokens: 10, output_tokens: 20}
          }

          stub_message_request(response_body: response_body)

          message = @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test mixed tools"}],
            tools: [GetWeather, raw_tool]
          )

          weather_tool = message.content.find { _1.name == "GetWeather" }
          raw_tool_use = message.content.find { _1.name == "raw_tool" }

          assert_instance_of(GetWeather, weather_tool.parsed)
          assert_equal("London", weather_tool.parsed.location)

          assert_nil(raw_tool_use.parsed)
          assert_equal({value: "test"}, raw_tool_use.input)
        end

        class NestedModel < Anthropic::Helpers::InputSchema::BaseModel
          class Address < Anthropic::Helpers::InputSchema::BaseModel
            required :street, String
            required :city, String
            optional :zip, String
          end

          doc "A model with nested schemas"
          required :name, String
          required :address, Address
          optional :addresses, Anthropic::Helpers::InputSchema::ArrayOf[Address]
        end

        def test_create_with_nested_models
          response_body = {
            id: "msg_123",
            type: "message",
            role: "assistant",
            content: [
              {
                type: "tool_use",
                id: "tool_456",
                name: "NestedModel",
                input: {
                  name: "John",
                  address: {street: "123 Main", city: "NYC", zip: "10001"},
                  addresses: [
                    {street: "456 Park", city: "LA"}
                  ]
                }
              }
            ],
            usage: {input_tokens: 10, output_tokens: 20}
          }

          stub_message_request(response_body: response_body)

          message = @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test nested"}],
            tools: [NestedModel]
          )

          tool_use = message.content.find { _1.type == :tool_use }
          assert_instance_of(NestedModel, tool_use.parsed)
          assert_equal("John", tool_use.parsed.name)
          assert_instance_of(NestedModel::Address, tool_use.parsed.address)
          assert_equal("123 Main", tool_use.parsed.address.street)
          assert_equal("NYC", tool_use.parsed.address.city)
          assert_equal("10001", tool_use.parsed.address.zip)

          assert_equal(1, tool_use.parsed.addresses.length)
          assert_instance_of(NestedModel::Address, tool_use.parsed.addresses[0])
          assert_equal("456 Park", tool_use.parsed.addresses[0].street)
          assert_nil(tool_use.parsed.addresses[0].zip)
        end

        def test_create_with_explicit_tool_hash
          tool_hash = {
            name: "weather_getter",
            description: "Custom weather tool",
            input_schema: GetWeather
          }

          response_body = {
            id: "msg_123",
            type: "message",
            role: "assistant",
            content: [
              {
                type: "tool_use",
                id: "tool_456",
                name: "weather_getter",
                input: {location: "Paris"}
              }
            ],
            usage: {input_tokens: 10, output_tokens: 20}
          }

          stub_message_request(response_body: response_body)

          message = @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Weather?"}],
            tools: [tool_hash]
          )

          tool_use = message.content.find { _1.type == :tool_use }
          assert_instance_of(GetWeather, tool_use.parsed)
          assert_equal("Paris", tool_use.parsed.location)
        end
      end
    end
  end
end
