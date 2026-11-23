# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInvalidStorageARNErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :invalid_storage_arn]
          required :error_code, const: :invalid_storage_arn

          # @!method initialize(error_code: :invalid_storage_arn)
          #   On Claude Platform on AWS, the External Storage ID in the request is neither a
          #   bucket ARN nor an `estrg_` ID, or is the `estrg_` ID of AWS storage. Name AWS
          #   storage by its bucket ARN, `arn:<partition>:s3:::<bucket_name>`, which responses
          #   return as its `id`.
          #
          #   @param error_code [Symbol, :invalid_storage_arn]
        end
      end
    end
  end
end
