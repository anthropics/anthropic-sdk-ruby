# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # On Claude Platform on AWS, the External Storage ID in the request is neither a
        # bucket ARN nor an `estrg_` ID, or is the `estrg_` ID of AWS storage. Name AWS
        # storage by its bucket ARN, `arn:<partition>:s3:::<bucket_name>`, which responses
        # return as its `id`.
        class BetaInvalidStorageARNError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaInvalidStorageARNErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
