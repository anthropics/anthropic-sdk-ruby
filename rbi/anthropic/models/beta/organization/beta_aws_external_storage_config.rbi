# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAWSExternalStorageConfig < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAWSExternalStorageConfig,
                Anthropic::Internal::AnyHash
              )
            end

          # 12-digit ID of the AWS account that owns the bucket.
          sig { returns(String) }
          attr_accessor :account_id

          # The bucket's name, without `s3://`.
          sig { returns(String) }
          attr_accessor :bucket_name

          # The bucket's AWS region.
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
            # The bucket's name, without `s3://`.
            bucket_name:,
            # The bucket's AWS region.
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
