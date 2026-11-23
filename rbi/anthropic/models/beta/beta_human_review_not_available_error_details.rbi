# typed: strong

module Anthropic
  module Models
    BetaHumanReviewNotAvailableErrorDetails =
      Beta::BetaHumanReviewNotAvailableErrorDetails

    module Beta
      class BetaHumanReviewNotAvailableErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaHumanReviewNotAvailableErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # Human review can't be set as requested on this Workspace, so the request changed
        # nothing. The error's `message` says what to do instead.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :human_review_not_available)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
