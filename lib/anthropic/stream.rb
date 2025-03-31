# frozen_string_literal: true

module Anthropic
  # @example
  #   stream.each do |event|
  #     puts(event)
  #   end
  #
  # @example
  #   events =
  #     stream
  #     .lazy
  #     .select { _1.object_id.even? }
  #     .map(&:itself)
  #     .take(2)
  #     .to_a
  #
  #   events => Array
  class Stream
    include Anthropic::Type::BaseStream

    # @api private
    #
    # @return [Enumerable]
    private def iterator
      # rubocop:disable Metrics/BlockLength
      # rubocop:disable Layout/LineLength
      # rubocop:disable Lint/DuplicateBranch
      @iterator ||= Anthropic::Util.chain_fused(@stream) do |y|
        @stream.each do |msg|
          case msg
          in {event: "completion", data: String => data}
            decoded = JSON.parse(data, symbolize_names: true)
            y << Anthropic::Type::Converter.coerce(@model, decoded)
          in {
            event: "message_start" | "message_delta" | "message_stop" | "content_block_start" | "content_block_delta" | "content_block_stop",
            data: String => data
          }
            decoded = JSON.parse(data, symbolize_names: true)
            y << Anthropic::Type::Converter.coerce(@model, decoded)
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
      # rubocop:enable Lint/DuplicateBranch
      # rubocop:enable Layout/LineLength
      # rubocop:enable Metrics/BlockLength
    end
  end
end
