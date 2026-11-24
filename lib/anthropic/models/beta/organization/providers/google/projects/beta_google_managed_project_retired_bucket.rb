# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectRetiredBucket < Anthropic::Internal::Type::BaseModel
                # @!attribute bucket_name
                #   The bucket's Cloud Storage name.
                #
                #   @return [String]
                required :bucket_name, String

                # @!attribute expires_at
                #   When this entry is removed, in RFC 3339 format.
                #
                #   @return [Time]
                required :expires_at, Time

                # @!attribute project_number
                #   The number of the Google Cloud project that holds the bucket, in decimal.
                #
                #   @return [String]
                required :project_number, String

                # @!attribute region
                #   The code of the region that retired the bucket.
                #
                #   @return [String]
                required :region, String

                # @!method initialize(bucket_name:, expires_at:, project_number:, region:)
                #   A bucket that a region has retired. Until `expires_at`, keep the bucket and
                #   Anthropic's access to it as they were when the bucket passed verification.
                #
                #   @param bucket_name [String] The bucket's Cloud Storage name.
                #
                #   @param expires_at [Time] When this entry is removed, in RFC 3339 format.
                #
                #   @param project_number [String] The number of the Google Cloud project that holds the bucket, in decimal.
                #
                #   @param region [String] The code of the region that retired the bucket.
              end
            end
          end
        end
      end
    end
  end
end
