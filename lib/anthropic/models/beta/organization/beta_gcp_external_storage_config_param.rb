# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaGCPExternalStorageConfigParam < Anthropic::Internal::Type::BaseModel
          # @!attribute bucket_name
          #   The bucket's name, without `gs://`: 3 to 63 lower-case letters, digits and
          #   hyphens, starting and ending with a letter or digit. It can't start with `goog`
          #   or contain `google`.
          #
          #   @return [String]
          required :bucket_name, String

          # @!attribute project_number
          #   Project number, not project ID, of the Google Cloud project that holds the
          #   bucket.
          #
          #   @return [String]
          required :project_number, String

          # @!attribute region
          #   The bucket's Google Cloud region, such as `us-east5`: one of the single regions
          #   that the setup guide lists. Dual-regions and multi-regions aren't supported.
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
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfigParam} for
          #   more details.
          #
          #   @param bucket_name [String] The bucket's name, without `gs://`: 3 to 63 lower-case letters, digits and hyphe
          #
          #   @param project_number [String] Project number, not project ID, of the Google Cloud project that holds the bucke
          #
          #   @param region [String] The bucket's Google Cloud region, such as `us-east5`: one of the single regions
          #
          #   @param type [Symbol, :gcp]
        end
      end
    end
  end
end
