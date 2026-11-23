# typed: strong

module Anthropic
  module Models
    module Beta
      # Human review can't be set as requested on this Workspace, so the request changed
      # nothing. The error's `message` says what to do instead.
      class BetaHumanReviewNotAvailableError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Beta::BetaHumanReviewNotAvailableErrorDetails)
        end
        def details
        end
      end
    end
  end
end
