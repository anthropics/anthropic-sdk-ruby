# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContextManagementConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute edits
        #   List of context management edits to apply
        #
        #   @return [Array<Anthropic::Models::Beta::BetaClearToolUses20250919Edit, Anthropic::Models::Beta::BetaClearThinking20251015Edit, Anthropic::Models::Beta::BetaCompact20260112Edit>, nil]
        optional :edits,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaContextManagementConfig::Edit] }

        # @!method initialize(edits: nil)
        #   @param edits [Array<Anthropic::Models::Beta::BetaClearToolUses20250919Edit, Anthropic::Models::Beta::BetaClearThinking20251015Edit, Anthropic::Models::Beta::BetaCompact20260112Edit>] List of context management edits to apply

        # Automatically compact older context when reaching the configured trigger
        # threshold.
        module Edit
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :clear_tool_uses_20250919, -> { Anthropic::Beta::BetaClearToolUses20250919Edit }

          variant :clear_thinking_20251015, -> { Anthropic::Beta::BetaClearThinking20251015Edit }

          # Automatically compact older context when reaching the configured trigger threshold.
          variant :compact_20260112, -> { Anthropic::Beta::BetaCompact20260112Edit }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaClearToolUses20250919Edit, Anthropic::Models::Beta::BetaClearThinking20251015Edit, Anthropic::Models::Beta::BetaCompact20260112Edit)]
        end
      end
    end

    BetaContextManagementConfig = Beta::BetaContextManagementConfig
  end
end
