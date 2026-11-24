# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageBucket < Anthropic::Internal::Type::BaseModel
                # @!attribute bucket_name
                #   The bucket's Cloud Storage name.
                #
                #   @return [String]
                required :bucket_name, String

                # @!attribute kms_key_name
                #   The resource name of the Cloud KMS key that the bucket encrypts objects under by
                #   default. `null` until the region has confirmed the bucket, and when the bucket
                #   has no default key.
                #
                #   @return [String, nil]
                required :kms_key_name, String, nil?: true

                # @!attribute location
                #   The bucket's location, as Cloud Storage reports it. `null` until the region has
                #   confirmed the bucket.
                #
                #   @return [String, nil]
                required :location, String, nil?: true

                # @!attribute project_id
                #   The ID of the project that holds the bucket. `null` until the region has
                #   confirmed the bucket.
                #
                #   @return [String, nil]
                required :project_id, String, nil?: true

                # @!attribute project_number
                #   The number of the Google Cloud project that holds the bucket, in decimal.
                #
                #   @return [String]
                required :project_number, String

                # @!method initialize(bucket_name:, kms_key_name:, location:, project_id:, project_number:)
                #   The bucket configured for a region.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket}
                #   for more details.
                #
                #   @param bucket_name [String] The bucket's Cloud Storage name.
                #
                #   @param kms_key_name [String, nil] The resource name of the Cloud KMS key that the bucket encrypts objects under by
                #
                #   @param location [String, nil] The bucket's location, as Cloud Storage reports it. `null` until the region has
                #
                #   @param project_id [String, nil] The ID of the project that holds the bucket. `null` until the region has confirm
                #
                #   @param project_number [String] The number of the Google Cloud project that holds the bucket, in decimal.
              end
            end
          end
        end
      end
    end
  end
end
