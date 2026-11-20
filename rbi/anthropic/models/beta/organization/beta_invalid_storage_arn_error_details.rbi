# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaInvalidStorageARNErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaInvalidStorageARNErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # On Claude Platform on AWS, the External Storage ID in the request is neither a
          # bucket ARN nor an `estrg_` ID, or is the `estrg_` ID of AWS storage. Name AWS
          # storage by its bucket ARN, `arn:<partition>:s3:::<bucket_name>`, which responses
          # return as its `id`.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :invalid_storage_arn)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
