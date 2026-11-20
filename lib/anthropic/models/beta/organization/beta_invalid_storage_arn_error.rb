# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # On Claude Platform on AWS, the External Storage ID in the request is neither a
        # bucket ARN nor an `estrg_` ID, or is the `estrg_` ID of AWS storage. Name AWS
        # storage by its bucket ARN, `arn:<partition>:s3:::<bucket_name>`, which responses
        # return as its `id`.
        class BetaInvalidStorageARNError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :invalid_storage_arn]

          # @return [Anthropic::Models::Beta::Organization::BetaInvalidStorageARNErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaInvalidStorageARNErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
