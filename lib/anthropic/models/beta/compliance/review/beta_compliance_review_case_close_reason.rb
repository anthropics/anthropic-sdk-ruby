# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCaseCloseReason < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   `responded` means that Anthropic recorded a response. `window_ended` means that
            #   the time to respond ended with no response. `ended_by_anthropic` means that
            #   Anthropic ended the case before that time was over. New values can appear, so
            #   accept a value that you don't know.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type]
            required :type,
                     enum: -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type }

            # @!method initialize(type:)
            #   Why a review case closed.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason}
            #   for more details.
            #
            #   @param type [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason::Type] `responded` means that Anthropic recorded a response. `window_ended` means that

            # `responded` means that Anthropic recorded a response. `window_ended` means that
            # the time to respond ended with no response. `ended_by_anthropic` means that
            # Anthropic ended the case before that time was over. New values can appear, so
            # accept a value that you don't know.
            #
            # @see Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason#type
            module Type
              extend Anthropic::Internal::Type::Enum

              RESPONDED = :responded
              WINDOW_ENDED = :window_ended
              ENDED_BY_ANTHROPIC = :ended_by_anthropic

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
