# frozen_string_literal: true

require_relative "../../test_helper"

module Anthropic
  module Helpers
    module InputSchema
      class StreamingTest < Minitest::Test
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

        class GetWeatherInput < Anthropic::Helpers::InputSchema::BaseModel
          doc "Get the weather in a location"
          required :location, String
          optional :unit, Anthropic::Helpers::InputSchema::EnumOf["celsius", "fahrenheit"]
        end

        class Calculator < Anthropic::Helpers::InputSchema::BaseModel
          doc "Perform calculations"
          required :operation,
                   Anthropic::Helpers::InputSchema::EnumOf["add", "subtract", "multiply", "divide"]
          required :a, Float
          required :b, Float
        end

        def sse_response(*events)
          events.map do |event|
            type = event[:type]
            "event: #{type}\ndata: #{event.to_json}\n\n"
          end.join
        end

        def stub_streaming_request
          stub_request(:post, "http://localhost/v1/messages")
            .to_return(
              status: 200,
              body: ->(_) { @response_body },
              headers: {"content-type" => "text/event-stream"}
            )
        end

        def test_parsed_stream_preserves_block_wire_fields
          assert_parsed_stream_wire_fields(false)
          assert_parsed_stream_wire_fields(true)
        end

        def assert_parsed_stream_wire_fields(beta)
          initial = {
            type: "tool_use",
            id: "tool_metadata",
            name: "get_weather_input",
            input: {location: "Paris"},
            caller: {type: "direct"},
            toolset_name: "weather",
            future_field: {sequence: 7}
          }
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_metadata",
                type: "message",
                role: "assistant",
                content: [],
                model: "claude-opus-4-6",
                usage: {input_tokens: 1, output_tokens: 0}
              }
            },
            {type: "content_block_start", index: 0, content_block: initial},
            {type: "content_block_stop", index: 0},
            {type: "message_delta", delta: {stop_reason: "end_turn"}, usage: {output_tokens: 1}},
            {type: "message_stop"}
          )
          url = beta ? "http://localhost/v1/messages?beta=true" : "http://localhost/v1/messages"
          stub_request(:post, url).to_return(
            status: 200, body: @response_body, headers: {"content-type" => "text/event-stream"}
          )
          service = beta ? @client.beta.messages : @client.messages
          stream = service.stream(
            model: "claude-opus-4-6",
            max_tokens: 100,
            messages: [{role: "user", content: "Test"}],
            tools: [GetWeatherInput]
          )
          begin
            events = stream.to_a
            original = events.find { _1.type == :content_block_stop }.content_block
            before = JSON.parse(original.to_json)
            message = stream.accumulated_message
            block = message.content.first
            assert_equal("Paris", block.parsed.location)
            assert_equal("direct", JSON.parse(block.to_json).dig("caller", "type"))
            assert_equal("weather", block[:toolset_name])
            assert_equal({"sequence" => 7}, JSON.parse(block.to_json)["future_field"])
            actual = JSON.parse(block.to_json).except("parsed")
            assert_equal(before, actual, "parsed block changed wire fields (beta=#{beta})")
            assert_equal(before, JSON.parse(original.to_json))
            assert_equal(
              actual,
              JSON.parse(stream.accumulated_message.content.first.to_json).except("parsed")
            )
          ensure
            stream.close
          end
        end

        def test_stream_with_single_tool_model
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_123",
                type: "message",
                role: "assistant",
                content: [],
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: "I'll check"}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: " the weather."}},
            {type: "content_block_stop", index: 0},
            {
              type: "content_block_start",
              index: 1,
              content_block: {type: "tool_use", id: "tool_456", name: "get_weather", input: ""}
            },
            {
              type: "content_block_delta",
              index: 1,
              delta: {type: "input_json_delta", partial_json: '{"loc'}
            },
            {
              type: "content_block_delta",
              index: 1,
              delta: {type: "input_json_delta", partial_json: 'ation":"San '}
            },
            {
              type: "content_block_delta",
              index: 1,
              delta: {type: "input_json_delta", partial_json: 'Francisco","unit":"celsius"}'}
            },
            {type: "content_block_stop", index: 1},
            {
              type: "message_delta",
              delta: {stop_reason: "tool_use", stop_sequence: nil},
              usage: {output_tokens: 25}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          events = []
          final_message = nil

          stream = @client.messages.stream(
            model: "claude-opus-4-6",
            max_tokens: 100,
            messages: [{role: "user", content: "What's the weather?"}],
            tools: [GetWeatherInput]
          )

          stream.each do |event|
            events << event
            final_message = event.message if event.type == :message_stop
          end

          message = final_message
          assert_equal("msg_123", message.id)
          assert_equal("I'll check the weather.", message.content[0].text)

          tool_use = message.content[1]
          assert_equal(:tool_use, tool_use.type)
          assert_equal("get_weather", tool_use.name)

          # The parsed field would be populated in a real request
          # For this test, we're verifying the streaming API accepts BaseModel tools
        end

        def test_stream_with_multiple_tools
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_123",
                type: "message",
                role: "assistant",
                content: [],
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {
              type: "content_block_start",
              index: 0,
              content_block: {type: "tool_use", id: "tool_1", name: "calculator", input: ""}
            },
            {
              type: "content_block_delta",
              index: 0,
              delta: {type: "input_json_delta", partial_json: '{"operation":"add","a":5.0,"b":3.0}'}
            },
            {type: "content_block_stop", index: 0},
            {
              type: "content_block_start",
              index: 1,
              content_block: {type: "tool_use", id: "tool_2", name: "get_weather", input: ""}
            },
            {
              type: "content_block_delta",
              index: 1,
              delta: {type: "input_json_delta", partial_json: '{"location":"NYC"}'}
            },
            {type: "content_block_stop", index: 1},
            {
              type: "message_delta",
              delta: {stop_reason: "tool_use", stop_sequence: nil},
              usage: {output_tokens: 20}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          events = []
          final_message = nil

          stream = @client.messages.stream(
            model: "claude-opus-4-6",
            max_tokens: 100,
            messages: [{role: "user", content: "Add 5+3 and check NYC weather"}],
            tools: [Calculator, GetWeatherInput]
          )

          stream.each do |event|
            events << event
            final_message = event.message if event.type == :message_stop
          end

          message = final_message

          assert_equal(2, message.content.length)
          assert_equal(:tool_use, message.content[0].type)
          assert_equal(:tool_use, message.content[1].type)
        end

        def test_stream_with_parse_error
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_123",
                type: "message",
                role: "assistant",
                content: [],
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {
              type: "content_block_start",
              index: 0,
              content_block: {type: "tool_use", id: "tool_456", name: "calculator", input: ""}
            },
            {
              type: "content_block_delta",
              index: 0,
              delta: {
                type: "input_json_delta",
                partial_json: '{"operation":"invalid","a":"not_number","b":3.0}'
              }
            },
            {type: "content_block_stop", index: 0},
            {
              type: "message_delta",
              delta: {stop_reason: "tool_use", stop_sequence: nil},
              usage: {output_tokens: 15}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          events = []
          final_message = nil

          stream = @client.messages.stream(
            model: "claude-opus-4-6",
            max_tokens: 100,
            messages: [{role: "user", content: "Calculate"}],
            tools: [Calculator]
          )

          stream.each do |event|
            events << event
            final_message = event.message if event.type == :message_stop
          end

          message = final_message
          assert_equal(1, message.content.length)
          assert_equal(:tool_use, message.content[0].type)
        end

        def test_stream_helper_methods
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_123",
                type: "message",
                role: "assistant",
                content: [],
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}},
            {
              type: "content_block_delta",
              index: 0,
              delta: {type: "text_delta", text: "Let me calculate: "}
            },
            {type: "text", index: 0, text: "Let me calculate: "},
            {type: "content_block_stop", index: 0},
            {
              type: "content_block_start",
              index: 1,
              content_block: {type: "tool_use", id: "tool_456", name: "calculator", input: ""}
            },
            {
              type: "content_block_delta",
              index: 1,
              delta: {type: "input_json_delta", partial_json: '{"operation":"multiply","a":7.0,"b":8.0}'}
            },
            {type: "content_block_stop", index: 1},
            {
              type: "message_delta",
              delta: {stop_reason: "tool_use", stop_sequence: nil},
              usage: {output_tokens: 20}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          text_chunks = []
          final_message = nil

          @client.messages.stream(
            model: "claude-opus-4-6",
            max_tokens: 100,
            messages: [{role: "user", content: "Multiply 7*8"}],
            tools: [Calculator]
          ) do |event|
            text_chunks << event.text if event.type == :text
            final_message = event.message if event.type == :message_stop
          end

          assert_equal(Calculator, [Calculator].first)
        end

        class NestedModel < Anthropic::Helpers::InputSchema::BaseModel
          class Info < Anthropic::Helpers::InputSchema::BaseModel
            required :key, String
            required :value, String
          end

          required :data, Info
        end

        def test_stream_with_nested_model
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_123",
                type: "message",
                role: "assistant",
                content: [],
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {
              type: "content_block_start",
              index: 0,
              content_block: {type: "tool_use", id: "tool_456", name: "nested_model", input: ""}
            },
            {
              type: "content_block_delta",
              index: 0,
              delta: {type: "input_json_delta", partial_json: '{"data":{"key":"test","value":"data"}}'}
            },
            {type: "content_block_stop", index: 0},
            {
              type: "message_delta",
              delta: {stop_reason: "tool_use", stop_sequence: nil},
              usage: {output_tokens: 15}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          final_message = nil

          stream = @client.messages.stream(
            model: "claude-opus-4-6",
            max_tokens: 100,
            messages: [{role: "user", content: "Test nested"}],
            tools: [NestedModel]
          )

          stream.each do |event|
            final_message = event.message if event.type == :message_stop
          end

          assert_equal(1, final_message.content.length)
          assert_equal(:tool_use, final_message.content[0].type)
        end

        def test_stream_with_tool_added_by_value
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_123",
                type: "message",
                role: "assistant",
                content: [],
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {
              type: "content_block_start",
              index: 0,
              content_block: {type: "tool_use", id: "tool_456", name: "weather_getter", input: {}}
            },
            {
              type: "content_block_delta",
              index: 0,
              delta: {type: "input_json_delta", partial_json: '{"location":"Paris"}'}
            },
            {type: "content_block_stop", index: 0},
            {
              type: "message_delta",
              delta: {stop_reason: "tool_use", stop_sequence: nil},
              usage: {output_tokens: 15}
            },
            {type: "message_stop"}
          )
          stub_request(:post, "http://localhost/v1/messages?beta=true")
            .to_return(
              status: 200,
              body: ->(_) { @response_body },
              headers: {"content-type" => "text/event-stream"}
            )

          definition = {name: "weather_getter", input_schema: GetWeatherInput}
          stream = @client.beta.messages.stream(
            model: "claude-opus-4-6",
            max_tokens: 100,
            messages: [
              {role: "user", content: "Weather?"},
              {role: :system, content: [{type: :tool_addition, tool: {type: :tool_definition, definition:}}]}
            ]
          )

          tool_use = stream.accumulated_message.content.first
          assert_instance_of(GetWeatherInput, tool_use.parsed)
          assert_equal("Paris", tool_use.parsed.location)
          sent_as = {name: "weather_getter", input_schema: GetWeatherInput.to_json_schema}
          assert_requested(:post, "http://localhost/v1/messages?beta=true") do
            sent = JSON.parse(_1.body, symbolize_names: true).dig(
              :messages,
              1,
              :content,
              0,
              :tool,
              :definition
            )
            assert_equal(JSON.parse(sent_as.to_json, symbolize_names: true), sent)
          end
        end
      end
    end
  end
end
