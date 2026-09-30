# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AWSExternalKeyConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute kms_arn
        #   Full ARN of the AWS KMS key. On Claude Platform on AWS the key must be a
        #   single-Region key in your organization's own AWS account; cross-account keys,
        #   multi-Region keys, and alias ARNs are rejected.
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

        # @!method initialize(kms_arn:, region: nil, type: :aws)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AWSExternalKeyConfig} for more details.
        #
        #   @param kms_arn [String] Full ARN of the AWS KMS key. On Claude Platform on AWS the key must be a single-
        #
        #   @param region [String, nil] AWS region. Derived from `kms_arn` if omitted.
        #
        #   @param type [Symbol, :aws]
      end
    end
  end
end
