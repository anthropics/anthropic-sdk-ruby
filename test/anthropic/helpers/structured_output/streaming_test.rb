# frozen_string_literal: true

require_relative "../../test_helper"

module Anthropic
  module Helpers
    module StructuredOutput
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

        class SimpleOutput < Anthropic::Helpers::InputSchema::BaseModel
          required :name, String
          required :age, Integer
        end

        class PersonOutput < Anthropic::Helpers::InputSchema::BaseModel
          class Address < Anthropic::Helpers::InputSchema::BaseModel
            required :street, String
            required :city, String
          end

          doc "A person with address"
          required :name, String
          required :address, Address
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
            type: "text",
            text: '{"name":"Ada","age":37}',
            citations: [],
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
            output_config: {format: SimpleOutput}
          )
          begin
            events = stream.to_a
            original = events.find { _1.type == :content_block_stop }.content_block
            before = JSON.parse(original.to_json)
            message = stream.accumulated_message
            block = message.content.first
            assert_equal("Ada", block.parsed.name)
            assert_equal(37, block.parsed.age)
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

        # Test streaming with output_config (GA structured output)
        def test_stream_with_output_config
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_123",
                type: "message",
                role: "assistant",
                content: [],
                model: "claude-sonnet-4-5-20250929",
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: '{"name"'}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: ':"Alice"'}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: ',"age":30}'}},
            {type: "content_block_stop", index: 0},
            {
              type: "message_delta",
              delta: {stop_reason: "end_turn", stop_sequence: nil},
              usage: {output_tokens: 15}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          events = []
          final_message = nil

          stream = @client.messages.stream(
            model: "claude-sonnet-4-5-20250929",
            max_tokens: 100,
            messages: [{role: "user", content: "Give me person info"}],
            output_config: {format: SimpleOutput}
          )

          stream.each do |event|
            events << event
            final_message = event.message if event.type == :message_stop
          end

          assert_equal("msg_123", final_message.id)
          assert_equal(1, final_message.content.length)
          assert_equal(:text, final_message.content[0].type)
        end

        # Test streaming with nested output model
        def test_stream_with_nested_output_model
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_nested",
                type: "message",
                role: "assistant",
                content: [],
                model: "claude-sonnet-4-5-20250929",
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}},
            {
              type: "content_block_delta",
              index: 0,
              delta: {type: "text_delta", text: '{"name":"Bob","address":{"street":"456 Elm","city":"LA"}}'}
            },
            {type: "content_block_stop", index: 0},
            {
              type: "message_delta",
              delta: {stop_reason: "end_turn", stop_sequence: nil},
              usage: {output_tokens: 25}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          final_message = nil

          stream = @client.messages.stream(
            model: "claude-sonnet-4-5-20250929",
            max_tokens: 100,
            messages: [{role: "user", content: "Give me person with address"}],
            output_config: {format: PersonOutput}
          )

          stream.each do |event|
            final_message = event.message if event.type == :message_stop
          end

          assert_equal("msg_nested", final_message.id)
          assert_equal(1, final_message.content.length)
          assert_equal(:text, final_message.content[0].type)
        end

        # Test streaming with block syntax - verifies that output_config is accepted
        def test_stream_with_block_syntax
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_block",
                type: "message",
                role: "assistant",
                content: [],
                model: "claude-sonnet-4-5-20250929",
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}},
            {
              type: "content_block_delta",
              index: 0,
              delta: {type: "text_delta", text: '{"name":"Eve","age":28}'}
            },
            {type: "content_block_stop", index: 0},
            {
              type: "message_delta",
              delta: {stop_reason: "end_turn", stop_sequence: nil},
              usage: {output_tokens: 12}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          # Just verify the stream can be created with output_config and a block
          # Block iteration behaves differently with WebMock stubs
          stream = @client.messages.stream( # rubocop:disable Lint/EmptyBlock
            model: "claude-sonnet-4-5-20250929",
            max_tokens: 100,
            messages: [{role: "user", content: "Give me person info"}],
            output_config: {format: SimpleOutput}
          ) { |_| }

          # The stream method returns a MessageStream object when given a block
          assert_kind_of(Anthropic::Streaming::MessageStream, stream)
        end

        # Test streaming collects incremental text deltas
        def test_stream_collects_text_deltas
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_deltas",
                type: "message",
                role: "assistant",
                content: [],
                model: "claude-sonnet-4-5-20250929",
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: '{"na'}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: 'me":"'}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: 'Carol"'}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: ',"age"'}},
            {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: ":42}"}},
            {type: "content_block_stop", index: 0},
            {
              type: "message_delta",
              delta: {stop_reason: "end_turn", stop_sequence: nil},
              usage: {output_tokens: 20}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          content_block_deltas = []
          final_message = nil

          stream = @client.messages.stream(
            model: "claude-sonnet-4-5-20250929",
            max_tokens: 100,
            messages: [{role: "user", content: "Give me person info"}],
            output_config: {format: SimpleOutput}
          )

          stream.each do |event|
            content_block_deltas << event if event.type == :content_block_delta
            final_message = event.message if event.type == :message_stop
          end

          # Should have received multiple delta events
          assert(content_block_deltas.length > 1)

          # Final message should have the complete text
          assert_equal("msg_deltas", final_message.id)
          text_block = final_message.content.find { _1.type == :text }
          assert_equal('{"name":"Carol","age":42}', text_block.text)
        end

        # Test streaming with output_config format json_schema explicit
        def test_stream_with_explicit_json_schema_format
          @response_body = sse_response(
            {
              type: "message_start",
              message: {
                id: "msg_explicit",
                type: "message",
                role: "assistant",
                content: [],
                model: "claude-sonnet-4-5-20250929",
                usage: {input_tokens: 10, output_tokens: 0}
              }
            },
            {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}},
            {
              type: "content_block_delta",
              index: 0,
              delta: {type: "text_delta", text: '{"name":"Frank","age":50}'}
            },
            {type: "content_block_stop", index: 0},
            {
              type: "message_delta",
              delta: {stop_reason: "end_turn", stop_sequence: nil},
              usage: {output_tokens: 15}
            },
            {type: "message_stop"}
          )

          stub_streaming_request

          final_message = nil

          stream = @client.messages.stream(
            model: "claude-sonnet-4-5-20250929",
            max_tokens: 100,
            messages: [{role: "user", content: "Give me person info"}],
            output_config: {format: {schema: SimpleOutput}}
          )

          stream.each do |event|
            final_message = event.message if event.type == :message_stop
          end

          assert_equal("msg_explicit", final_message.id)
        end
      end
    end
  end
end
