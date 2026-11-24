# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedBucketReference < Anthropic::Internal::Type::BaseModel
              # @!attribute bucket_name
              #   The bucket's Cloud Storage name.
              #
              #   @return [String]
              required :bucket_name, String

              # @!attribute project_number
              #   The number of the Google Cloud project that holds the bucket, in decimal.
              #
              #   @return [String]
              required :project_number, String

              # @!method initialize(bucket_name:, project_number:)
              #   A Cloud Storage bucket, named by the project that holds it and by its own name.
              #
              #   @param bucket_name [String] The bucket's Cloud Storage name.
              #
              #   @param project_number [String] The number of the Google Cloud project that holds the bucket, in decimal.
            end
          end
        end
      end
    end
  end
end
