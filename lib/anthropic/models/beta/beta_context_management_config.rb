# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContextManagementConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute edits
        #   List of context management edits to apply
        #
        #   @return [Array<Anthropic::Models::Beta::BetaClearToolUses20250919Edit>, nil]
        optional :edits, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaClearToolUses20250919Edit] }

        # @!method initialize(edits: nil)
        #   Configuration for context management operations.
        #
        #   @param edits [Array<Anthropic::Models::Beta::BetaClearToolUses20250919Edit>] List of context management edits to apply
      end
    end

    BetaContextManagementConfig = Beta::BetaContextManagementConfig
  end
end
