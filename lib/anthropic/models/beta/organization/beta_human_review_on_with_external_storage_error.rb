# frozen_string_literal: true

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
          # @!method error_code
          #   @return [Symbol, :human_review_on_with_external_storage]

          # @return [Anthropic::Models::Beta::Organization::BetaHumanReviewOnWithExternalStorageErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaHumanReviewOnWithExternalStorageErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
