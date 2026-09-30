# typed: strong

module Anthropic
  module Models
    module Organization
      class AWSExternalKeyConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AWSExternalKeyConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # Full ARN of the AWS KMS key. On Claude Platform on AWS the key must be a
        # single-Region key in your organization's own AWS account; cross-account keys,
        # multi-Region keys, and alias ARNs are rejected.
        sig { returns(String) }
        attr_accessor :kms_arn

        sig { returns(Symbol) }
        attr_accessor :type

        # AWS region. Derived from `kms_arn` if omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :region

        sig do
          params(
            kms_arn: String,
            region: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Full ARN of the AWS KMS key. On Claude Platform on AWS the key must be a
          # single-Region key in your organization's own AWS account; cross-account keys,
          # multi-Region keys, and alias ARNs are rejected.
          kms_arn:,
          # AWS region. Derived from `kms_arn` if omitted.
          region: nil,
          type: :aws
        )
        end

        sig do
          override.returns(
            { kms_arn: String, type: Symbol, region: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
