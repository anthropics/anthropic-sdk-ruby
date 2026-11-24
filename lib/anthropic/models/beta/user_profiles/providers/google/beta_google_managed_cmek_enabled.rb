# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedCMEKEnabled < Anthropic::Internal::Type::BaseModel
              # @!attribute external_key_ids
              #   The ID of the External Key configured for each region (`ekey_...`), keyed by
              #   region code. A region with no key is left out.
              #
              #   @return [Hash{Symbol=>String}]
              required :external_key_ids, Anthropic::Internal::Type::HashOf[String]

              # @!attribute retired_keys
              #   Keys that a region has retired, earliest `expires_at` first.
              #
              #   @return [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredKey>]
              required :retired_keys,
                       -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredKey] }

              # @!attribute status
              #   Each region's status for the control, keyed by region code. A region that your
              #   organization is not offered may have no entry, and Anthropic may add regions.
              #
              #   @return [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended}]
              required :status,
                       -> { Anthropic::Internal::Type::HashOf[union: Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus] }

              # @!attribute type
              #
              #   @return [Symbol, :enabled]
              required :type, const: :enabled

              # @!method initialize(external_key_ids:, retired_keys:, status:, type: :enabled)
              #   The control is on and has a key for at least one region.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled}
              #   for more details.
              #
              #   @param external_key_ids [Hash{Symbol=>String}] The ID of the External Key configured for each region (`ekey_...`), keyed by reg
              #
              #   @param retired_keys [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredKey>] Keys that a region has retired, earliest `expires_at` first.
              #
              #   @param status [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended}] Each region's status for the control, keyed by region code. A region that your o
              #
              #   @param type [Symbol, :enabled]
            end
          end
        end
      end
    end
  end
end
