# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaHumanReviewOnWithExternalStorageErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :human_review_on_with_external_storage]
          required :error_code, const: :human_review_on_with_external_storage

          # @!method initialize(error_code: :human_review_on_with_external_storage)
          #   The request would leave the Workspace with
          #   `inference_data_privacy.safeguards_storage` set to External Storage and
          #   `inference_data_privacy.human_review` enabled. Anthropic doesn't offer human
          #   review of data in a customer's own storage. Set `human_review` to `disabled`, or
          #   `safeguards_storage` to `internal`.
          #
          #   @param error_code [Symbol, :human_review_on_with_external_storage]
        end
      end
    end
  end
end
