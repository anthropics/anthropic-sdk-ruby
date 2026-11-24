# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCaseClosed < Anthropic::Internal::Type::BaseModel
            # @!attribute reason
            #   Why the case closed. It doesn't change afterwards.
            #
            #   @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason]
            required :reason, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason }

            # @!attribute type
            #
            #   @return [Symbol, :closed]
            required :type, const: :closed

            # @!method initialize(reason:, type: :closed)
            #   Anthropic has stopped waiting for a response. A closed case stays closed.
            #
            #   @param reason [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason] Why the case closed. It doesn't change afterwards.
            #
            #   @param type [Symbol, :closed]
          end
        end
      end
    end
  end
end
