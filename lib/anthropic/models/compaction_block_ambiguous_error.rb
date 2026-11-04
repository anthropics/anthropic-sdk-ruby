# frozen_string_literal: true

module Anthropic
  module Models
    # `messages` holds more than one `compaction` block with content. Send only the
    # block the conversation returned last.
    class CompactionBlockAmbiguousError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :compaction_block_ambiguous]

      # @return [Anthropic::Models::CompactionBlockAmbiguousErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionBlockAmbiguousErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
