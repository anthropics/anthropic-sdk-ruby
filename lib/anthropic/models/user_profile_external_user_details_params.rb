# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileExternalUserDetailsParams < Anthropic::Internal::Type::BaseModel
      # @!attribute account_status
      #   The status of the entity's account on the platform: `active`, `suspended` or
      #   `blocked`.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileExternalUserAccountStatus, nil]
      optional :account_status, enum: -> { Anthropic::UserProfileExternalUserAccountStatus }, nil?: true

      # @!attribute country
      #   The country of the entity (not of the platform), as the platform determines it:
      #   an ISO 3166-1 alpha-2 code in upper case, for example `US`. Only the form, two
      #   uppercase ASCII letters, is checked.
      #
      #   @return [String, nil]
      optional :country, String, nil?: true

      # @!attribute email_hash
      #   A hash of the entity's email address, computed by the platform. Anthropic treats
      #   it as an opaque string and does not prescribe the hash function. 1 to 255
      #   characters.
      #
      #   @return [String, nil]
      optional :email_hash, String, nil?: true

      # @!attribute entity_type
      #   What kind of entity the profile represents: `individual`, `business`,
      #   `non_profit` or `government`.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileExternalUserEntityType, nil]
      optional :entity_type, enum: -> { Anthropic::UserProfileExternalUserEntityType }, nil?: true

      # @!attribute name_hash
      #   A hash of the entity's name, computed by the platform. Anthropic treats it as an
      #   opaque string and does not prescribe the hash function. 1 to 255 characters.
      #
      #   @return [String, nil]
      optional :name_hash, String, nil?: true

      # @!attribute onboarded_at
      #   When the entity opened its account with the platform, in RFC 3339 format: for an
      #   `application` profile, when the end-user signed up; for a `passthrough` profile,
      #   when the company became the platform's customer. Must be a complete timestamp no
      #   more than 1 minute in the future.
      #
      #   @return [Time, nil]
      optional :onboarded_at, Time

      # @!attribute reference_id
      #   The platform's own reference for the entity, for example the key of the
      #   end-user's row in the platform's database. Not interpreted by Anthropic and not
      #   enforced unique. 1 to 255 characters.
      #
      #   @return [String, nil]
      optional :reference_id, String, nil?: true

      # @!method initialize(account_status: nil, country: nil, email_hash: nil, entity_type: nil, name_hash: nil, onboarded_at: nil, reference_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileExternalUserDetailsParams} for more details.
      #
      #   @param account_status [Symbol, Anthropic::Models::UserProfileExternalUserAccountStatus, nil] The status of the entity's account on the platform: `active`, `suspended` or `bl
      #
      #   @param country [String, nil] The country of the entity (not of the platform), as the platform determines it:
      #
      #   @param email_hash [String, nil] A hash of the entity's email address, computed by the platform. Anthropic treats
      #
      #   @param entity_type [Symbol, Anthropic::Models::UserProfileExternalUserEntityType, nil] What kind of entity the profile represents: `individual`, `business`, `non_profi
      #
      #   @param name_hash [String, nil] A hash of the entity's name, computed by the platform. Anthropic treats it as an
      #
      #   @param onboarded_at [Time] When the entity opened its account with the platform, in RFC 3339 format: for an
      #
      #   @param reference_id [String, nil] The platform's own reference for the entity, for example the key of the end-user
    end
  end
end
