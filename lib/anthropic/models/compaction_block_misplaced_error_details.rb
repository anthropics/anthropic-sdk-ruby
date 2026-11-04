# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionBlockMisplacedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_block_misplaced]
      required :error_code, const: :compaction_block_misplaced

      # @!method initialize(error_code: :compaction_block_misplaced)
      #   The `compaction` block is not the first block of the conversation, or is in a
      #   `system` message.
      #
      #   @param error_code [Symbol, :compaction_block_misplaced]
    end
  end
end
