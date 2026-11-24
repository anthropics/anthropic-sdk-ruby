# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageEnabled < Anthropic::Internal::Type::BaseModel
              # @!attribute buckets
              #   The bucket configured for each region, keyed by region code. A region with no
              #   bucket is left out.
              #
              #   @return [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageBucket}]
              required :buckets,
                       -> { Anthropic::Internal::Type::HashOf[Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageBucket] }

              # @!attribute retired_buckets
              #   Buckets that a region has retired, earliest `expires_at` first.
              #
              #   @return [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket>]
              required :retired_buckets,
                       -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket] }

              # @!attribute status
              #   Each region's status for the control, keyed by region code. A region that your
              #   organization is not offered may have no entry, and Anthropic may add regions.
              #
              #   @return [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended}]
              required :status,
                       -> { Anthropic::Internal::Type::HashOf[union: Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus] }

              # @!attribute type
              #
              #   @return [Symbol, :enabled]
              required :type, const: :enabled

              # @!method initialize(buckets:, retired_buckets:, status:, type: :enabled)
              #   The control is on and has a bucket for at least one region.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled}
              #   for more details.
              #
              #   @param buckets [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageBucket}] The bucket configured for each region, keyed by region code. A region with no bu
              #
              #   @param retired_buckets [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket>] Buckets that a region has retired, earliest `expires_at` first.
              #
              #   @param status [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended}] Each region's status for the control, keyed by region code. A region that your o
              #
              #   @param type [Symbol, :enabled]
            end
          end
        end
      end
    end
  end
end
