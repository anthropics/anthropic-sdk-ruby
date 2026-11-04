# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionBlockAmbiguousErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_block_ambiguous]
      required :error_code, const: :compaction_block_ambiguous

      # @!method initialize(error_code: :compaction_block_ambiguous)
      #   `messages` holds more than one `compaction` block with content. Send only the
      #   block the conversation returned last.
      #
      #   @param error_code [Symbol, :compaction_block_ambiguous]
    end
  end
end
