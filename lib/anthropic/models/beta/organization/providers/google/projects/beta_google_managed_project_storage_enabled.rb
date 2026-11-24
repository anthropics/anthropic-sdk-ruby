# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageEnabled < Anthropic::Internal::Type::BaseModel
                # @!attribute buckets
                #   The bucket configured for each region, keyed by region code. A region with no
                #   bucket is left out.
                #
                #   @return [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket}]
                required :buckets,
                         -> { Anthropic::Internal::Type::HashOf[Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket] }

                # @!attribute retired_buckets
                #   Buckets that a region has retired, earliest `expires_at` first.
                #
                #   @return [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket>]
                required :retired_buckets,
                         -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket] }

                # @!attribute status
                #   Each region's status for the control, keyed by region code. A region that your
                #   organization is not offered may have no entry, and Anthropic may add regions.
                #
                #   @return [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended}]
                required :status,
                         -> do
                           Anthropic::Internal::Type::HashOf[
                             union: Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus
                           ]
                         end

                # @!attribute type
                #
                #   @return [Symbol, :enabled]
                required :type, const: :enabled

                # @!method initialize(buckets:, retired_buckets:, status:, type: :enabled)
                #   The control is on and has a bucket for at least one region.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled}
                #   for more details.
                #
                #   @param buckets [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket}] The bucket configured for each region, keyed by region code. A region with no bu
                #
                #   @param retired_buckets [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket>] Buckets that a region has retired, earliest `expires_at` first.
                #
                #   @param status [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended}] Each region's status for the control, keyed by region code. A region that your o
                #
                #   @param type [Symbol, :enabled]
              end
            end
          end
        end
      end
    end
  end
end
