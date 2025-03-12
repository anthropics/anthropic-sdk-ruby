# frozen_string_literal: true

module Anthropic
  # @private
  #
  class Stream < Anthropic::BaseStream
    # @private
    #
    # @return [Enumerable]
    #
    private def iterator
      # rubocop:disable Metrics/BlockLength
      @iterator ||= Anthropic::Util.chain_fused(@messages) do |y|
        @messages.each do |msg|
          case msg
          in {event: "completion", data: String => data}
            decoded = JSON.parse(data, symbolize_names: true)
            y << Anthropic::Converter.coerce(@model, decoded)
          in {
            event: "message_start" | "message_delta" | "message_stop" | "content_block_start" | "content_block_delta" | "content_block_stop",
            data: String => data
          }
            decoded = JSON.parse(data, symbolize_names: true)
            y << Anthropic::Converter.coerce(@model, decoded)
          in {event: "ping"}
            next
          in {event: "error", data: String => data}
            decoded = Kernel.then do
              JSON.parse(data, symbolize_names: true)
            rescue JSON::ParserError
              data
            end
            Anthropic::APIError.for(
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
      # rubocop:enable Metrics/BlockLength
    end
  end
end
