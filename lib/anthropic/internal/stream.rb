# frozen_string_literal: true

module Anthropic
  module Internal
    # @generic Elem
    #
    # @example
    #   stream.each do |event|
    #     puts(event)
    #   end
    class Stream
      include Anthropic::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable<generic<Elem>>]
      private def iterator
        # rubocop:disable Metrics/BlockLength
        # rubocop:disable Layout/LineLength
        # rubocop:disable Lint/DuplicateBranch
        @iterator ||= Anthropic::Internal::Util.chain_fused(@stream) do |y|
          @stream.each do |msg|
            case msg
            in {event: "completion", data: String => data}
              decoded = JSON.parse(data, symbolize_names: true)
              unwrapped = Anthropic::Internal::Util.dig(decoded, @unwrap)
              y << Anthropic::Internal::Type::Converter.coerce(@model, unwrapped)
            in {
              event: "message_start" | "message_delta" | "message_stop" | "content_block_start" | "content_block_delta" | "content_block_stop" | "message" | "user.message" | "user.interrupt" | "user.tool_confirmation" | "user.custom_tool_result" | "agent.message" | "agent.thinking" | "agent.tool_use" | "agent.tool_result" | "agent.mcp_tool_use" | "agent.mcp_tool_result" | "agent.custom_tool_use" | "agent.thread_context_compacted" | "session.status_running" | "session.status_idle" | "session.status_rescheduled" | "session.status_terminated" | "session.error" | "session.deleted" | "span.model_request_start" | "span.model_request_end",
              data: String => data
            }
              decoded = JSON.parse(data, symbolize_names: true)
              unwrapped = Anthropic::Internal::Util.dig(decoded, @unwrap)
              y << Anthropic::Internal::Type::Converter.coerce(@model, unwrapped)
            in {event: "ping"}
              next
            in {event: "error", data: String => data}
              decoded = Kernel.then do
                JSON.parse(data, symbolize_names: true)
              rescue JSON::ParserError
                data
              end
              err = Anthropic::Errors::APIStatusError.for(
                url: @url,
                status: @status,
                headers: @headers,
                body: decoded,
                request: nil,
                response: @response
              )
              raise err
            else
            end
          end
        end
        # rubocop:enable Lint/DuplicateBranch
        # rubocop:enable Layout/LineLength
        # rubocop:enable Metrics/BlockLength
      end
    end
  end
end
