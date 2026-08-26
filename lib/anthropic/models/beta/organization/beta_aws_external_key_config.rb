# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAWSExternalKeyConfig < Anthropic::Internal::Type::BaseModel
          # @!attribute kms_arn
          #   Full ARN of the AWS KMS key.
          #
          #   @return [String]
          required :kms_arn, String

          # @!attribute type
          #
          #   @return [Symbol, :aws]
          required :type, const: :aws

          # @!attribute region
          #   AWS region. Derived from `kms_arn` if omitted.
          #
          #   @return [String, nil]
          optional :region, String, nil?: true

          # @!attribute role_arn
          #   @deprecated
          #
          #   IAM role ARN. Deprecated — Anthropic reaches the KMS key via a managed
          #   intermediate role; this field is ignored.
          #
          #   @return [String, nil]
          optional :role_arn, String, nil?: true

          # @!method initialize(kms_arn:, region: nil, role_arn: nil, type: :aws)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig} for more
          #   details.
          #
          #   @param kms_arn [String] Full ARN of the AWS KMS key.
          #
          #   @param region [String, nil] AWS region. Derived from `kms_arn` if omitted.
          #
          #   @param role_arn [String, nil] IAM role ARN. Deprecated — Anthropic reaches the KMS key via a managed intermedi
          #
          #   @param type [Symbol, :aws]
        end
      end
    end
  end
end
