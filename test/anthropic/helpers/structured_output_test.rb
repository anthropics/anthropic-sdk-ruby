# frozen_string_literal: true

require_relative "../test_helper"

module Anthropic
  module Helpers
    class StructuredOutputTest < Minitest::Test
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

      class FamousNumber < Anthropic::Helpers::InputSchema::BaseModel
        required :value, Float
        optional :reason, String, doc: "why is this number mathematically significant?"
      end

      class NumbersOutput < Anthropic::Helpers::InputSchema::BaseModel
        doc "some famous numbers"

        required :numbers,
                 Anthropic::Helpers::InputSchema::ArrayOf[FamousNumber],
                 min_length: 1,
                 max_length: 5
      end

      class SimpleOutput < Anthropic::Helpers::InputSchema::BaseModel
        required :name, String
        required :age, Integer
      end

      class NestedOutput < Anthropic::Helpers::InputSchema::BaseModel
        class Address < Anthropic::Helpers::InputSchema::BaseModel
          required :street, String
          required :city, String
          optional :zip, String
        end

        doc "A person with address"
        required :name, String
        required :address, Address
      end

      # Test GA structured output with output_config: {format: Model}
      def test_create_with_output_config_format_model
        response_body = {
          id: "msg_123",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: '{"name":"Alice","age":30}'
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 20}
        }

        stub_message_request(response_body: response_body)

        message = @client.messages.create(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "Give me a person's info"}],
          output_config: {format: SimpleOutput}
        )

        assert_equal("msg_123", message.id)
        assert_instance_of(Anthropic::Message, message)

        # Access parsed through content block bracket access
        text_block = message.content.find { _1.type == :text }
        parsed = text_block[:parsed]
        assert_instance_of(SimpleOutput, parsed)
        assert_equal("Alice", parsed.name)
        assert_equal(30, parsed.age)
      end

      # Test GA structured output using parse() alias
      def test_parse_method_alias
        response_body = {
          id: "msg_456",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: '{"name":"Bob","age":25}'
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 15, output_tokens: 25}
        }

        stub_message_request(response_body: response_body)

        # parse() is an alias for create()
        message = @client.messages.parse(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "Give me a person's info"}],
          output_config: {format: SimpleOutput}
        )

        assert_equal("msg_456", message.id)
        text_block = message.content.find { _1.type == :text }
        parsed = text_block[:parsed]
        assert_instance_of(SimpleOutput, parsed)
        assert_equal("Bob", parsed.name)
        assert_equal(25, parsed.age)
      end

      # Test complex nested output model
      def test_create_with_nested_output_model
        response_body = {
          id: "msg_789",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: '{"name":"Charlie","address":{"street":"123 Main St","city":"NYC","zip":"10001"}}'
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 30}
        }

        stub_message_request(response_body: response_body)

        message = @client.messages.create(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "Give me person with address"}],
          output_config: {format: NestedOutput}
        )

        text_block = message.content.find { _1.type == :text }
        parsed = text_block[:parsed]
        assert_instance_of(NestedOutput, parsed)
        assert_equal("Charlie", parsed.name)
        assert_instance_of(NestedOutput::Address, parsed.address)
        assert_equal("123 Main St", parsed.address.street)
        assert_equal("NYC", parsed.address.city)
        assert_equal("10001", parsed.address.zip)
      end

      # Test with array output
      def test_create_with_array_output
        response_body = {
          id: "msg_array",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: '{"numbers":[{"value":3.14159,"reason":"pi"},{"value":2.71828,"reason":"e"}]}'
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 40}
        }

        stub_message_request(response_body: response_body)

        message = @client.messages.create(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "Give me famous numbers"}],
          output_config: {format: NumbersOutput}
        )

        text_block = message.content.find { _1.type == :text }
        parsed = text_block[:parsed]
        assert_instance_of(NumbersOutput, parsed)
        assert_equal(2, parsed.numbers.length)

        assert_instance_of(FamousNumber, parsed.numbers[0])
        assert_in_delta(3.14159, parsed.numbers[0].value, 0.00001)
        assert_equal("pi", parsed.numbers[0].reason)

        assert_instance_of(FamousNumber, parsed.numbers[1])
        assert_in_delta(2.71828, parsed.numbers[1].value, 0.00001)
        assert_equal("e", parsed.numbers[1].reason)
      end

      # Test output_config with explicit json_schema format
      def test_create_with_output_config_format_json_schema
        response_body = {
          id: "msg_explicit",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: '{"name":"Diana","age":35}'
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 20}
        }

        stub_message_request(response_body: response_body)

        # Use explicit format with schema key
        message = @client.messages.create(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "Give me a person's info"}],
          output_config: {format: {schema: SimpleOutput}}
        )

        text_block = message.content.find { _1.type == :text }
        parsed = text_block[:parsed]
        assert_instance_of(SimpleOutput, parsed)
        assert_equal("Diana", parsed.name)
        assert_equal(35, parsed.age)
      end

      # Test that no parsing happens when there's no output_config
      def test_no_parsing_without_output_config
        response_body = {
          id: "msg_no_parse",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: "Hello, how can I help you today?"
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 15}
        }

        stub_message_request(response_body: response_body)

        message = @client.messages.create(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "Hello"}]
        )

        # No output_config means no parsing, so content block should not have :parsed
        text_block = message.content.find { _1.type == :text }
        assert_nil(text_block[:parsed])
      end

      # Test JSON parse error handling
      def test_create_with_invalid_json_response
        response_body = {
          id: "msg_bad_json",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: "this is not valid json"
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 10}
        }

        stub_message_request(response_body: response_body)

        message = @client.messages.create(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "Give me a person's info"}],
          output_config: {format: SimpleOutput}
        )

        # The parsed field should contain an error
        text_block = message.content.find { _1.type == :text }
        parsed = text_block[:parsed]
        assert_kind_of(Hash, parsed)
        assert(parsed.key?(:error))
      end

      # Test with enum in output model
      class StatusOutput < Anthropic::Helpers::InputSchema::BaseModel
        required :status, Anthropic::Helpers::InputSchema::EnumOf["pending", "active", "completed"]
        optional :message, String
      end

      def test_create_with_enum_output
        response_body = {
          id: "msg_enum",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: '{"status":"active","message":"Processing"}'
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 15}
        }

        stub_message_request(response_body: response_body)

        message = @client.messages.create(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "What's the status?"}],
          output_config: {format: StatusOutput}
        )

        text_block = message.content.find { _1.type == :text }
        parsed = text_block[:parsed]
        assert_instance_of(StatusOutput, parsed)
        assert_equal(:active, parsed.status)
        assert_equal("Processing", parsed.message)
      end

      # Test with nullable fields
      class NullableOutput < Anthropic::Helpers::InputSchema::BaseModel
        required :title, String
        required :description, String, nil?: true
      end

      def test_create_with_nullable_fields
        response_body = {
          id: "msg_nullable",
          type: "message",
          role: "assistant",
          content: [
            {
              type: "text",
              text: '{"title":"Test","description":null}'
            }
          ],
          model: "claude-sonnet-4-5-20250929",
          stop_reason: "end_turn",
          stop_sequence: nil,
          usage: {input_tokens: 10, output_tokens: 12}
        }

        stub_message_request(response_body: response_body)

        message = @client.messages.create(
          model: "claude-sonnet-4-5-20250929",
          max_tokens: 100,
          messages: [{role: "user", content: "Give me a title"}],
          output_config: {format: NullableOutput}
        )

        text_block = message.content.find { _1.type == :text }
        parsed = text_block[:parsed]
        assert_instance_of(NullableOutput, parsed)
        assert_equal("Test", parsed.title)
        assert_nil(parsed.description)
      end
    end
  end
end
