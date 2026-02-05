# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCompact20260112Edit < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :compact_20260112]
        required :type, const: :compact_20260112

        # @!attribute instructions
        #   Additional instructions for summarization.
        #
        #   @return [String, nil]
        optional :instructions, String, nil?: true

        # @!attribute pause_after_compaction
        #   Whether to pause after compaction and return the compaction block to the user.
        #
        #   @return [Boolean, nil]
        optional :pause_after_compaction, Anthropic::Internal::Type::Boolean

        # @!attribute trigger
        #   When to trigger compaction. Defaults to 150000 input tokens.
        #
        #   @return [Anthropic::Models::Beta::BetaInputTokensTrigger, nil]
        optional :trigger, -> { Anthropic::Beta::BetaInputTokensTrigger }, nil?: true

        # @!method initialize(instructions: nil, pause_after_compaction: nil, trigger: nil, type: :compact_20260112)
        #   Automatically compact older context when reaching the configured trigger
        #   threshold.
        #
        #   @param instructions [String, nil] Additional instructions for summarization.
        #
        #   @param pause_after_compaction [Boolean] Whether to pause after compaction and return the compaction block to the user.
        #
        #   @param trigger [Anthropic::Models::Beta::BetaInputTokensTrigger, nil] When to trigger compaction. Defaults to 150000 input tokens.
        #
        #   @param type [Symbol, :compact_20260112]
      end
    end

    BetaCompact20260112Edit = Beta::BetaCompact20260112Edit
  end
end
