# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tracing
      class << self
        # Returns `nil` when the client's spans are disabled, or when the span cannot start. A failure
        # to read `params` is logged, and the span then starts without attributes.
        #
        # @param client [Anthropic::Client]
        # @param params [Hash{Symbol=>Object}] the runner's, as the application gave them
        #
        # @return [OpenTelemetry::Trace::Span, nil]
        def start_tool_runner_span(client, params)
          tracer = client.open_telemetry_tracer
          return nil if tracer.nil?

          names = Anthropic::Internal::Tracing
          attributes = recording("the tool runner") do
            {
              **client.open_telemetry_attributes,
              names::GEN_AI_OPERATION_NAME => GEN_AI_OPERATION_NAME_VALUE_INVOKE_AGENT,
              names::GEN_AI_REQUEST_MODEL => params[:model]&.to_s,
              GEN_AI_CONVERSATION_ID => conversation_id(params[:request_options]),
              GEN_AI_OUTPUT_TYPE => (GEN_AI_OUTPUT_TYPE_VALUE_JSON if json_output_format?(params))
            }.compact
          end
          recording("the tool runner") do
            tracer.start_span("anthropic.messages.tool_runner", kind: :internal, attributes: attributes)
          end
        end

        # The status is `ERROR` for `error`, `OK` for a loop that returned, and unset when the
        # application stopped the loop.
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param returned [Boolean] whether the loop returned
        # @param error [StandardError, nil] what the loop failed with
        def end_tool_runner_span(span, returned:, error:)
          recording("the tool runner") do
            if error
              Anthropic::Internal::Tracing.set_error_status(span, error)
            elsif returned
              span.status = OpenTelemetry::Trace::Status.ok
            end
            span.finish
          end
        end

        # Returns `nil` when the client's spans are disabled, or when the span cannot start.
        # {end_tool_use_span} ends the span.
        #
        # @param client [Anthropic::Client]
        # @param tool [Anthropic::Helpers::Tools::BaseTool] the tool that runs
        # @param tool_use [Anthropic::Models::Beta::BetaToolUseBlock]
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [OpenTelemetry::Trace::Span, nil]
        def start_tool_use_span(client, tool, tool_use, request_options)
          tracer = client.open_telemetry_tracer
          return nil if tracer.nil?

          mcp = tool.is_a?(Anthropic::Helpers::Tools::Mcp::Tool)
          operation = mcp ? "anthropic.mcp_tool_use" : "anthropic.custom_tool_use"
          attributes = {
            **client.open_telemetry_attributes,
            Anthropic::Internal::Tracing::GEN_AI_OPERATION_NAME => GEN_AI_OPERATION_NAME_VALUE_EXECUTE_TOOL,
            GEN_AI_TOOL_NAME => tool_use.name,
            GEN_AI_TOOL_CALL_ID => tool_use.id,
            GEN_AI_TOOL_TYPE => GEN_AI_TOOL_TYPE_VALUE_FUNCTION
          }
          # Read as it is, so that a value of another type sets no attribute and raises nothing.
          toolset_name = tool_use[:toolset_name]
          attributes[ANTHROPIC_TOOLSET_NAME] = toolset_name if toolset_name.is_a?(String)
          description = tool_description(tool)
          attributes[GEN_AI_TOOL_DESCRIPTION] = description unless description.nil?
          # Options that cannot be read set no ID, and do not fail the run.
          id = begin
            conversation_id(request_options)
          rescue StandardError
            nil
          end
          attributes[GEN_AI_CONVERSATION_ID] = id unless id.nil?
          recording("the tool run") do
            tracer.start_span(
              "#{operation} #{tool_use.name}",
              kind: :internal,
              attributes: attributes
            )
          end
        end

        # `nil` for no description, an empty one, or one that is not text ({utf8_text}): it can come from
        # an MCP server.
        #
        # @param tool [Anthropic::Helpers::Tools::BaseTool]
        #
        # @return [String, nil]
        def tool_description(tool)
          description = tool.class.doc_string
          return nil unless description.is_a?(String) && !description.empty?

          utf8_text(description)
        end

        # @param client [Anthropic::Client]
        # @param span [OpenTelemetry::Trace::Span]
        # @param input [Hash{Symbol=>Object}] the `input` of the `tool_use` block
        # @param result [Hash{Symbol=>Object}, nil] the `tool_result` block, or `nil` for a run that was
        #   interrupted, which leaves the status unset
        def end_tool_use_span(client, span, input, result)
          recording("the tool run") do
            next unless span.recording? && client.open_telemetry_content?

            set_content_attributes(
              span,
              nil,
              {
                GEN_AI_TOOL_CALL_ARGUMENTS => input,
                ANTHROPIC_TOOL_RESULT_CONTENT => (tool_result_content(result[:content]) unless result.nil?)
              },
              limit: client.open_telemetry_max_content_bytes
            )
          end
          recording("the tool run") do
            if result&.[](:is_error)
              span.status = OpenTelemetry::Trace::Status.error
              span.set_attribute(Anthropic::Internal::Tracing::ERROR_TYPE, "tool_error")
            elsif result
              span.status = OpenTelemetry::Trace::Status.ok
            end
            span.finish
          end
        end
      end
    end
  end
end
