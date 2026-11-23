# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Human review can't be set as requested on this Workspace, so the request changed
      # nothing. The error's `message` says what to do instead.
      class BetaHumanReviewNotAvailableError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :human_review_not_available]

        # @return [Anthropic::Models::Beta::BetaHumanReviewNotAvailableErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaHumanReviewNotAvailableErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
