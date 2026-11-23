# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaHumanReviewNotAvailableErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :human_review_not_available]
        required :error_code, const: :human_review_not_available

        # @!method initialize(error_code: :human_review_not_available)
        #   Human review can't be set as requested on this Workspace, so the request changed
        #   nothing. The error's `message` says what to do instead.
        #
        #   @param error_code [Symbol, :human_review_not_available]
      end
    end

    BetaHumanReviewNotAvailableErrorDetails = Beta::BetaHumanReviewNotAvailableErrorDetails
  end
end
