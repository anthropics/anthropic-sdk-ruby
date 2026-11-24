# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageRegionPending < Anthropic::Internal::Type::BaseModel
              # @!attribute effective_bucket
              #   The bucket that the region applies now. While a replacement bucket is `pending`
              #   or `failed`, this is the previous bucket. `null` when the region applies no
              #   bucket.
              #
              #   @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil]
              required :effective_bucket,
                       -> {
                         Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference
                       },
                       nil?: true

              # @!attribute failed_checks
              #   The checks that the latest reported verification attempt failed. Empty when none
              #   has failed.
              #
              #   @return [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck>]
              required :failed_checks,
                       -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck] }

              # @!attribute type
              #
              #   @return [Symbol, :pending]
              required :type, const: :pending

              # @!method initialize(effective_bucket:, failed_checks:, type: :pending)
              #   The region is verifying the configured bucket.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending}
              #   for more details.
              #
              #   @param effective_bucket [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil] The bucket that the region applies now. While a replacement bucket is `pending`
              #
              #   @param failed_checks [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck>] The checks that the latest reported verification attempt failed. Empty when none
              #
              #   @param type [Symbol, :pending]
            end
          end
        end
      end
    end
  end
end
