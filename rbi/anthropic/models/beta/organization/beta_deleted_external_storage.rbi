# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDeletedExternalStorage < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaDeletedExternalStorage,
                Anthropic::Internal::AnyHash
              )
            end

          # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
          # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
          # partition of the bucket's region.
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
            # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
            # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
            # partition of the bucket's region.
            id:,
            type: :external_storage_deleted
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
