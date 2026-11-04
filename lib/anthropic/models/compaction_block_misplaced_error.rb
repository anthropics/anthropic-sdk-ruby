# frozen_string_literal: true

module Anthropic
  module Models
    # The `compaction` block is not the first block of the conversation, or is in a
    # `system` message.
    class CompactionBlockMisplacedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :compaction_block_misplaced]

      # @return [Anthropic::Models::CompactionBlockMisplacedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionBlockMisplacedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
