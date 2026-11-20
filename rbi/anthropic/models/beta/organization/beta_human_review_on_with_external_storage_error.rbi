# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The request would leave the Workspace with
        # `inference_data_privacy.safeguards_storage` set to External Storage and
        # `inference_data_privacy.human_review` enabled. Anthropic doesn't offer human
        # review of data in a customer's own storage. Set `human_review` to `disabled`, or
        # `safeguards_storage` to `internal`.
        class BetaHumanReviewOnWithExternalStorageError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaHumanReviewOnWithExternalStorageErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
