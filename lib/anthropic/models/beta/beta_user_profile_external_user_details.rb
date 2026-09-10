# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaUserProfileExternalUserDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute account_status
        #   The status of the entity's account on the platform, as the platform states it:
        #   `active`; `suspended`, when the platform has restricted the account and may
        #   restore it; or `blocked`, when the platform has barred it. It records the
        #   platform's decision only; the statuses in `trust_grants` are Anthropic's and do
        #   not follow it.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaUserProfileExternalUserDetails::AccountStatus, nil]
        required :account_status,
                 enum: -> { Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus },
                 nil?: true

        # @!attribute country
        #   The country the platform associates with the entity, as an ISO 3166-1 alpha-2
        #   code. `null` until the platform supplies one.
        #
        #   @return [String, nil]
        required :country, String, nil?: true

        # @!attribute email_hash
        #   The platform-computed hash of the entity's email address. `null` until the
        #   platform supplies one.
        #
        #   @return [String, nil]
        required :email_hash, String, nil?: true

        # @!attribute entity_type
        #   What kind of entity the profile represents, as the platform states it:
        #   `individual`, `business`, `non_profit` or `government`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaUserProfileExternalUserDetails::EntityType, nil]
        required :entity_type,
                 enum: -> { Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType },
                 nil?: true

        # @!attribute name_hash
        #   The platform-computed hash of the entity's name. `null` until the platform
        #   supplies one.
        #
        #   @return [String, nil]
        required :name_hash, String, nil?: true

        # @!attribute onboarded_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        required :onboarded_at, Time, nil?: true

        # @!attribute reference_id
        #   The platform's own reference for the entity. `null` until the platform supplies
        #   one.
        #
        #   @return [String, nil]
        required :reference_id, String, nil?: true

        # @!method initialize(account_status:, country:, email_hash:, entity_type:, name_hash:, onboarded_at:, reference_id:)
        #   Details about the entity this profile represents, as the platform states them.
        #   Anthropic does not verify them. Every field is present, `null` until the
        #   platform supplies a value.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaUserProfileExternalUserDetails} for more details.
        #
        #   @param account_status [Symbol, Anthropic::Models::Beta::BetaUserProfileExternalUserDetails::AccountStatus, nil] The status of the entity's account on the platform, as the platform states it: `
        #
        #   @param country [String, nil] The country the platform associates with the entity, as an ISO 3166-1 alpha-2 co
        #
        #   @param email_hash [String, nil] The platform-computed hash of the entity's email address. `null` until the platf
        #
        #   @param entity_type [Symbol, Anthropic::Models::Beta::BetaUserProfileExternalUserDetails::EntityType, nil] What kind of entity the profile represents, as the platform states it: `individu
        #
        #   @param name_hash [String, nil] The platform-computed hash of the entity's name. `null` until the platform suppl
        #
        #   @param onboarded_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param reference_id [String, nil] The platform's own reference for the entity. `null` until the platform supplies

        # The status of the entity's account on the platform, as the platform states it:
        # `active`; `suspended`, when the platform has restricted the account and may
        # restore it; or `blocked`, when the platform has barred it. It records the
        # platform's decision only; the statuses in `trust_grants` are Anthropic's and do
        # not follow it.
        #
        # @see Anthropic::Models::Beta::BetaUserProfileExternalUserDetails#account_status
        module AccountStatus
          extend Anthropic::Internal::Type::Enum

          ACTIVE = :active
          SUSPENDED = :suspended
          BLOCKED = :blocked

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # What kind of entity the profile represents, as the platform states it:
        # `individual`, `business`, `non_profit` or `government`.
        #
        # @see Anthropic::Models::Beta::BetaUserProfileExternalUserDetails#entity_type
        module EntityType
          extend Anthropic::Internal::Type::Enum

          INDIVIDUAL = :individual
          BUSINESS = :business
          NON_PROFIT = :non_profit
          GOVERNMENT = :government

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaUserProfileExternalUserDetails = Beta::BetaUserProfileExternalUserDetails
  end
end
