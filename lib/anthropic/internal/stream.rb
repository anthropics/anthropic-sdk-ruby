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
        # rubocop:disable Lint/DuplicateBranch
        @iterator ||= Anthropic::Internal::Util.chain_fused(@stream) do |y|
          @stream.each do |msg|
            case msg
            in {event: "ping"}
              next
            in {event: nil}
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
            in {data: String => data} unless data.chomp.empty?
              decoded = JSON.parse(data, symbolize_names: true)
              unwrapped = Anthropic::Internal::Util.dig(decoded, @unwrap)
              y << Anthropic::Internal::Type::Converter.coerce(@model, unwrapped)
            else
            end
          end
        end
        # rubocop:enable Lint/DuplicateBranch
        # rubocop:enable Metrics/BlockLength
      end
    end
  end
end
