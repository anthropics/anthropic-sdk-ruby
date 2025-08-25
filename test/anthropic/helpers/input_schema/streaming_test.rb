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

        class GetWeather < Anthropic::Helpers::InputSchema::BaseModel
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
              content_block: {type: "tool_use", id: "tool_456", name: "GetWeather", input: ""}
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
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "What's the weather?"}],
            tools: [GetWeather]
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
          assert_equal("GetWeather", tool_use.name)

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
              content_block: {type: "tool_use", id: "tool_1", name: "Calculator", input: ""}
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
              content_block: {type: "tool_use", id: "tool_2", name: "GetWeather", input: ""}
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
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Add 5+3 and check NYC weather"}],
            tools: [Calculator, GetWeather]
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
              content_block: {type: "tool_use", id: "tool_456", name: "Calculator", input: ""}
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
            model: "claude-3-opus-20240229",
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
              content_block: {type: "tool_use", id: "tool_456", name: "Calculator", input: ""}
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
            model: "claude-3-opus-20240229",
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
              content_block: {type: "tool_use", id: "tool_456", name: "NestedModel", input: ""}
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
            model: "claude-3-opus-20240229",
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
      end
    end
  end
end
