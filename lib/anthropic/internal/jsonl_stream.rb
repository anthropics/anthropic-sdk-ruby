# frozen_string_literal: true

module Anthropic
  module Internal
    # @example
    #   stream.each do |batch|
    #     puts(batch)
    #   end
    #
    # @example
    #   batches =
    #     stream
    #     .lazy
    #     .select { _1.object_id.even? }
    #     .map(&:itself)
    #     .take(2)
    #     .to_a
    #
    #   batches => Array
    class JsonLStream
      include Anthropic::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable]
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
