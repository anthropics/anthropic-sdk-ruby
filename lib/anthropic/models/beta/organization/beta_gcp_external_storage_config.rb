# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaGCPExternalStorageConfig < Anthropic::Internal::Type::BaseModel
          # @!attribute bucket_name
          #   The bucket's name, without `gs://`.
          #
          #   @return [String]
          required :bucket_name, String

          # @!attribute project_number
          #   Number of the Google Cloud project that holds the bucket.
          #
          #   @return [String]
          required :project_number, String

          # @!attribute region
          #   The bucket's Google Cloud region.
          #
          #   @return [String]
          required :region, String

          # @!attribute type
          #
          #   @return [Symbol, :gcp]
          required :type, const: :gcp

          # @!method initialize(bucket_name:, project_number:, region:, type: :gcp)
          #   A Google Cloud Storage bucket.
          #
          #   @param bucket_name [String] The bucket's name, without `gs://`.
          #
          #   @param project_number [String] Number of the Google Cloud project that holds the bucket.
          #
          #   @param region [String] The bucket's Google Cloud region.
          #
          #   @param type [Symbol, :gcp]
        end
      end
    end
  end
end
