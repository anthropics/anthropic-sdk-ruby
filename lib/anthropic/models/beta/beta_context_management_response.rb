# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContextManagementResponse < Anthropic::Internal::Type::BaseModel
        # @!attribute applied_edits
        #   List of context management edits that were applied.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse, Anthropic::Models::Beta::BetaClearThinking20251015EditResponse>]
        required :applied_edits,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaContextManagementResponse::AppliedEdit] }

        # @!method initialize(applied_edits:)
        #   @param applied_edits [Array<Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse, Anthropic::Models::Beta::BetaClearThinking20251015EditResponse>] List of context management edits that were applied.

        module AppliedEdit
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :clear_tool_uses_20250919, -> { Anthropic::Beta::BetaClearToolUses20250919EditResponse }

          variant :clear_thinking_20251015, -> { Anthropic::Beta::BetaClearThinking20251015EditResponse }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse, Anthropic::Models::Beta::BetaClearThinking20251015EditResponse)]
        end
      end
    end

    BetaContextManagementResponse = Beta::BetaContextManagementResponse
  end
end
