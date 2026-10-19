# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileExternalUserDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute account_status
      #   The status of the entity's account on the platform: `active`, `suspended` or
      #   `blocked`. `null` until the platform supplies one.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileExternalUserAccountStatus, nil]
      required :account_status, enum: -> { Anthropic::UserProfileExternalUserAccountStatus }, nil?: true

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
      #   What kind of entity the profile represents: `individual`, `business`,
      #   `non_profit` or `government`. `null` until the platform supplies one.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileExternalUserEntityType, nil]
      required :entity_type, enum: -> { Anthropic::UserProfileExternalUserEntityType }, nil?: true

      # @!attribute name_hash
      #   The platform-computed hash of the entity's name. `null` until the platform
      #   supplies one.
      #
      #   @return [String, nil]
      required :name_hash, String, nil?: true

      # @!attribute onboarded_at
      #   When the entity opened its account with the platform, as stated by the platform,
      #   in RFC 3339 format (UTC). `null` until the platform supplies one.
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
      #   {Anthropic::Models::UserProfileExternalUserDetails} for more details.
      #
      #   @param account_status [Symbol, Anthropic::Models::UserProfileExternalUserAccountStatus, nil] The status of the entity's account on the platform: `active`, `suspended` or `bl
      #
      #   @param country [String, nil] The country the platform associates with the entity, as an ISO 3166-1 alpha-2 co
      #
      #   @param email_hash [String, nil] The platform-computed hash of the entity's email address. `null` until the platf
      #
      #   @param entity_type [Symbol, Anthropic::Models::UserProfileExternalUserEntityType, nil] What kind of entity the profile represents: `individual`, `business`, `non_profi
      #
      #   @param name_hash [String, nil] The platform-computed hash of the entity's name. `null` until the platform suppl
      #
      #   @param onboarded_at [Time, nil] When the entity opened its account with the platform, as stated by the platform,
      #
      #   @param reference_id [String, nil] The platform's own reference for the entity. `null` until the platform supplies
    end
  end
end
