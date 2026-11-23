# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAWSExternalStorageConfig < Anthropic::Internal::Type::BaseModel
          # @!attribute account_id
          #   12-digit ID of the AWS account that owns the bucket.
          #
          #   @return [String]
          required :account_id, String

          # @!attribute bucket_name
          #   The bucket's name, without `s3://`.
          #
          #   @return [String]
          required :bucket_name, String

          # @!attribute region
          #   The bucket's AWS region.
          #
          #   @return [String]
          required :region, String

          # @!attribute type
          #
          #   @return [Symbol, :aws]
          required :type, const: :aws

          # @!method initialize(account_id:, bucket_name:, region:, type: :aws)
          #   An Amazon S3 bucket.
          #
          #   @param account_id [String] 12-digit ID of the AWS account that owns the bucket.
          #
          #   @param bucket_name [String] The bucket's name, without `s3://`.
          #
          #   @param region [String] The bucket's AWS region.
          #
          #   @param type [Symbol, :aws]
        end
      end
    end
  end
end
