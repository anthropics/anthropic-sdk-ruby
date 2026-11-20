# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAWSExternalStorageConfigParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAWSExternalStorageConfigParam,
                Anthropic::Internal::AnyHash
              )
            end

          # 12-digit ID of the AWS account that owns the bucket.
          sig { returns(String) }
          attr_accessor :account_id

          # The bucket's name, without `s3://`: 3 to 63 lower-case letters, digits and
          # hyphens, starting and ending with a letter or digit.
          sig { returns(String) }
          attr_accessor :bucket_name

          # The bucket's AWS region. Activating the storage fails if Anthropic can't use
          # buckets in that region.
          sig { returns(String) }
          attr_accessor :region

          sig { returns(Symbol) }
          attr_accessor :type

          # An Amazon S3 bucket.
          sig do
            params(
              account_id: String,
              bucket_name: String,
              region: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # 12-digit ID of the AWS account that owns the bucket.
            account_id:,
            # The bucket's name, without `s3://`: 3 to 63 lower-case letters, digits and
            # hyphens, starting and ending with a letter or digit.
            bucket_name:,
            # The bucket's AWS region. Activating the storage fails if Anthropic can't use
            # buckets in that region.
            region:,
            type: :aws
          )
          end

          sig do
            override.returns(
              {
                account_id: String,
                bucket_name: String,
                region: String,
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
