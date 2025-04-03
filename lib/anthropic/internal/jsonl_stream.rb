# frozen_string_literal: true

module Anthropic
  module Internal
    # @generic Elem
    #
    # @example
    #   stream.each do |batch|
    #     puts(batch)
    #   end
    class JsonLStream
      include Anthropic::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable<generic<Elem>>]
      private def iterator
        @iterator ||= Anthropic::Internal::Util.chain_fused(@stream) do |y|
          @stream.each do
            y << Anthropic::Internal::Type::Converter.coerce(@model, _1)
          end
        end
      end
    end
  end
end
