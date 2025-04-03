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
              y << Anthropic::Internal::Type::Converter.coerce(@model, decoded)
            in {
              event: "message_start" | "message_delta" | "message_stop" | "content_block_start" | "content_block_delta" | "content_block_stop",
              data: String => data
            }
              decoded = JSON.parse(data, symbolize_names: true)
              y << Anthropic::Internal::Type::Converter.coerce(@model, decoded)
            in {event: "ping"}
              next
            in {event: "error", data: String => data}
              decoded = Kernel.then do
                JSON.parse(data, symbolize_names: true)
              rescue JSON::ParserError
                data
              end
              Anthropic::Errors::APIStatusError.for(
                url: @url,
                status: @status,
                body: decoded,
                request: nil,
                response: @response
              )
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
