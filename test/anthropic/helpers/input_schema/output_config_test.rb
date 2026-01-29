# frozen_string_literal: true

require_relative "../../test_helper"

module Anthropic
  module Helpers
    module InputSchema
      class OutputConfigTest < Minitest::Test
        extend Minitest::Serial
        include WebMock::API

        def before_all
          super
          WebMock.enable!
          @original_deprecated_warning = Warning[:deprecated]
          Warning[:deprecated] = false
        end

        def after_all
          Warning[:deprecated] = @original_deprecated_warning
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

        def stub_message_request(response_body:, beta: false, &block) # rubocop:disable Lint/UnusedMethodArgument
          url = beta ? "http://localhost/v1/messages?beta=true" : "http://localhost/v1/messages"
          stub = stub_request(:post, url)
                 .to_return(
                   status: 200,
                   body: response_body.to_json,
                   headers: {"content-type" => "application/json"}
                 )

          yield(stub) if block_given?
          stub
        end

        class OutputModel < Anthropic::Helpers::InputSchema::BaseModel
          doc "Test output model"
          required :result, String
          optional :confidence, Float
        end

        def standard_response_body
          {
            id: "msg_123",
            type: "message",
            role: "assistant",
            content: [
              {
                type: "text",
                text: '{"result":"success","confidence":0.95}'
              }
            ],
            usage: {input_tokens: 10, output_tokens: 20}
          }
        end

        # Test new API works
        def test_output_config_with_model_class
          response_body = standard_response_body

          stub = stub_message_request(response_body: response_body) do |s|
            s.with do |request|
              body = JSON.parse(request.body, symbolize_names: true)

              # Assert output_config is properly formatted
              assert(body.key?(:output_config))
              # Type is stored as symbol but serialized as string in JSON
              type_value = body.dig(:output_config, :format, :type)
              assert(type_value == :json_schema || type_value == "json_schema")
              assert(body.dig(:output_config, :format, :schema).is_a?(Hash))

              # output_config is GA, no beta header needed
              refute(body.key?(:betas), "GA output_config should not auto-inject beta header")

              true
            end
          end

          message = @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test"}],
            output_config: {format: OutputModel}
          )

          assert_equal("msg_123", message.id)
          # Access parsed field using [] since it's added dynamically
          parsed = message.content.first[:parsed]
          assert_instance_of(OutputModel, parsed)
          assert_equal("success", parsed.result)
          assert_equal(0.95, parsed.confidence)
          assert_requested(stub)
        end

        # Test deprecation warning
        def test_output_format_shows_deprecation_warning
          response_body = standard_response_body
          stub_message_request(response_body: response_body)

          # Temporarily enable deprecated warnings for this test
          original_stderr = $stderr
          captured_stderr = StringIO.new
          $stderr = captured_stderr
          Warning[:deprecated] = true

          begin
            @client.messages.create(
              model: "claude-3-opus-20240229",
              max_tokens: 100,
              messages: [{role: "user", content: "Test"}],
              output_format: OutputModel
            )

            # Get the captured output
            captured_stderr.rewind
            warnings = captured_stderr.read

            # Assert deprecation warning was issued
            assert(
              warnings.include?("DEPRECATION") && warnings.include?("output_format"),
              "Expected deprecation warning about output_format. Got: #{warnings.inspect}"
            )
            assert(
              warnings.include?("output_config[:format]"),
              "Expected warning to mention output_config[:format]. Got: #{warnings.inspect}"
            )
          ensure
            # Restore stderr and warning setting
            $stderr = original_stderr
            Warning[:deprecated] = false
          end
        end

        # Test error on conflicting parameters
        def test_error_when_both_output_format_and_output_config_provided
          error = assert_raises(ArgumentError) do
            @client.messages.create(
              model: "claude-3-opus-20240229",
              max_tokens: 100,
              messages: [{role: "user", content: "Test"}],
              output_format: OutputModel,
              output_config: {format: OutputModel}
            )
          end

          assert_match(/Both output_format and output_config\[:format\]/, error.message)
          assert_match(/deprecated/, error.message)
        end

        # Test error when output_config is not a hash
        def test_error_when_output_config_is_not_hash
          error = assert_raises(ArgumentError) do
            @client.messages.create(
              model: "claude-3-opus-20240229",
              max_tokens: 100,
              messages: [{role: "user", content: "Test"}],
              output_format: OutputModel,
              output_config: "not a hash"
            )
          end

          assert_match(/output_config must be a Hash/, error.message)
          assert_match(/String/, error.message)
        end

        # Test that GA output_config does NOT auto-inject beta header
        def test_no_beta_header_with_output_config
          response_body = standard_response_body

          stub = stub_message_request(response_body: response_body) do |s|
            s.with do |request|
              body = JSON.parse(request.body, symbolize_names: true)
              # output_config is GA, should not auto-inject beta header
              refute(body.key?(:betas), "GA output_config should not auto-inject beta header")
              true
            end
          end

          @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test"}],
            output_config: {format: OutputModel}
          )

          assert_requested(stub)
        end

        # Test beta header auto-injection with deprecated output_format
        def test_auto_injects_beta_header_with_output_format
          response_body = standard_response_body

          stub = stub_message_request(response_body: response_body, beta: true) do |s|
            s.with do |request|
              # betas is sent as Anthropic-Beta header, not in body
              beta_header = request.headers["Anthropic-Beta"]
              assert_includes(beta_header, "structured-outputs-2025-12-15")
              true
            end
          end

          @client.beta.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test"}],
            output_format: OutputModel
          )

          assert_requested(stub)
        end

        # Test beta header is not duplicated when already present
        def test_beta_header_deduplication
          response_body = standard_response_body

          stub = stub_message_request(response_body: response_body, beta: true) do |s|
            s.with do |request|
              # betas is sent as Anthropic-Beta header, not in body
              beta_header = request.headers["Anthropic-Beta"]
              # Assert beta header appears only once
              beta_count = beta_header.scan("structured-outputs-2025-12-15").count
              assert_equal(1, beta_count, "Beta header should appear exactly once")
              true
            end
          end

          @client.beta.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test"}],
            output_config: {format: OutputModel},
            betas: ["structured-outputs-2025-12-15"]
          )

          assert_requested(stub)
        end

        # Test output_format with nested schema hash
        def test_output_format_with_nested_schema_hash
          response_body = standard_response_body

          stub = stub_message_request(response_body: response_body) do |s|
            s.with do |request|
              body = JSON.parse(request.body, symbolize_names: true)

              # Assert it was converted to output_config
              assert(body.key?(:output_config))
              refute(body.key?(:output_format), "output_format should be removed")

              true
            end
          end

          @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test"}],
            output_format: {schema: OutputModel}
          )

          assert_requested(stub)
        end

        # Test that output_format is removed after transformation
        def test_output_format_removed_after_transformation
          response_body = standard_response_body

          stub = stub_message_request(response_body: response_body) do |s|
            s.with do |request|
              body = JSON.parse(request.body, symbolize_names: true)

              # Assert output_format was removed
              refute(body.key?(:output_format), "output_format should be removed from request")
              assert(body.key?(:output_config), "output_config should be present")

              true
            end
          end

          @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test"}],
            output_format: OutputModel
          )

          assert_requested(stub)
        end

        # Test that output_format merges with existing output_config
        def test_output_format_merges_with_existing_output_config
          response_body = standard_response_body

          stub = stub_message_request(response_body: response_body) do |s|
            s.with do |request|
              body = JSON.parse(request.body, symbolize_names: true)

              # Verify both format and other_key are present in output_config
              assert(body.key?(:output_config), "output_config should be present")
              assert(body.dig(:output_config, :format), "format should be present in output_config")
              assert_equal("value", body.dig(:output_config, :other_key), "other_key should be preserved")
              refute(body.key?(:output_format), "output_format should be removed from request")

              true
            end
          end

          @client.messages.create(
            model: "claude-3-opus-20240229",
            max_tokens: 100,
            messages: [{role: "user", content: "Test"}],
            output_format: OutputModel,
            output_config: {other_key: "value"}
          )

          assert_requested(stub)
        end
      end
    end
  end
end
