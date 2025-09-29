# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContextManagementResponse < Anthropic::Internal::Type::BaseModel
        # @!attribute applied_edits
        #   List of context management edits that were applied.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse>]
        required :applied_edits,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaClearToolUses20250919EditResponse] }

        # @!method initialize(applied_edits:)
        #   Information about context management operations applied during the request.
        #
        #   @param applied_edits [Array<Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse>] List of context management edits that were applied.
      end
    end

    BetaContextManagementResponse = Beta::BetaContextManagementResponse
  end
end
