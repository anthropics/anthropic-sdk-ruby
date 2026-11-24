# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectCMEKEnabled < Anthropic::Internal::Type::BaseModel
                # @!attribute external_key_ids
                #   The ID of the External Key configured for each region (`ekey_...`), keyed by
                #   region code. A region with no key is left out.
                #
                #   @return [Hash{Symbol=>String}]
                required :external_key_ids, Anthropic::Internal::Type::HashOf[String]

                # @!attribute retired_keys
                #   Keys that a region has retired, earliest `expires_at` first.
                #
                #   @return [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey>]
                required :retired_keys,
                         -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey] }

                # @!attribute status
                #   Each region's status for the control, keyed by region code. A region that your
                #   organization is not offered may have no entry, and Anthropic may add regions.
                #
                #   @return [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionNotConfigured, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionPending, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionActive, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionFailed, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionSuspended}]
                required :status,
                         -> do
                           Anthropic::Internal::Type::HashOf[
                             union: Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionStatus
                           ]
                         end

                # @!attribute type
                #
                #   @return [Symbol, :enabled]
                required :type, const: :enabled

                # @!method initialize(external_key_ids:, retired_keys:, status:, type: :enabled)
                #   The control is on and has a key for at least one region.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled}
                #   for more details.
                #
                #   @param external_key_ids [Hash{Symbol=>String}] The ID of the External Key configured for each region (`ekey_...`), keyed by reg
                #
                #   @param retired_keys [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey>] Keys that a region has retired, earliest `expires_at` first.
                #
                #   @param status [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionNotConfigured, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionPending, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionActive, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionFailed, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionSuspended}] Each region's status for the control, keyed by region code. A region that your o
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
