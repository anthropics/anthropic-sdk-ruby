# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageRegionSuspended < Anthropic::Internal::Type::BaseModel
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

              # @!attribute type
              #
              #   @return [Symbol, :suspended]
              required :type, const: :suspended

              # @!method initialize(effective_bucket:, type: :suspended)
              #   Anthropic has withdrawn or paused its approval of customer-owned storage for
              #   this profile, so the region does not apply the control.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended}
              #   for more details.
              #
              #   @param effective_bucket [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil] The bucket that the region applies now. While a replacement bucket is `pending`
              #
              #   @param type [Symbol, :suspended]
            end
          end
        end
      end
    end
  end
end
