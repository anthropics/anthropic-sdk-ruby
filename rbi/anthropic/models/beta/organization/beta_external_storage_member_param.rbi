# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageMemberParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaExternalStorageMemberParam,
                Anthropic::Internal::AnyHash
              )
            end

          # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
          # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
          # partition of the bucket's region.
          sig { returns(String) }
          attr_accessor :external_storage_id

          sig { returns(Symbol) }
          attr_accessor :type

          # The organization's External Storage that `external_storage_id` names.
          sig do
            params(external_storage_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
            # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
            # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
            # partition of the bucket's region.
            external_storage_id:,
            type: :external
          )
          end

          sig do
            override.returns({ external_storage_id: String, type: Symbol })
          end
          def to_hash
          end
        end
      end
    end
  end
end
