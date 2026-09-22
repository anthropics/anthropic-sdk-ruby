# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#create
      class BetaUserProfile < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this user profile, prefixed `uprof_`.
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   When this user profile was created, in RFC 3339 format.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute metadata
        #   Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
        #   to 512 chars.
        #
        #   @return [Hash{Symbol=>String}]
        required :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute trust_grants
        #   Trust grants for this profile, keyed by grant name. Key omitted when no grant is
        #   active or in flight.
        #
        #   @return [Hash{Symbol=>Anthropic::Models::Beta::BetaUserProfileTrustGrant}]
        required :trust_grants,
                 -> { Anthropic::Internal::Type::HashOf[Anthropic::Beta::BetaUserProfileTrustGrant] }

        # @!attribute type
        #   Object type. Always `user_profile`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaUserProfile::Type]
        required :type, enum: -> { Anthropic::Beta::BetaUserProfile::Type }

        # @!attribute updated_at
        #   When this user profile was last modified, in RFC 3339 format. Trust-grant status
        #   changes also bump this timestamp.
        #
        #   @return [Time]
        required :updated_at, Time

        # @!attribute access_type
        #   How the platform uses the API for this entity: `application` (default) or
        #   `passthrough`. Present under the `user-profiles-2026-08-18` and later beta
        #   headers.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaUserProfile::AccessType, nil]
        optional :access_type, enum: -> { Anthropic::Beta::BetaUserProfile::AccessType }

        # @!attribute external_id
        #   Platform's own identifier for this user. Not enforced unique. Present under the
        #   `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta headers; under
        #   `user-profiles-2026-09-04` the value is `external_user_details.reference_id`.
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!attribute external_user_details
        #   Details about the entity this profile represents, as the platform states them;
        #   not verified by Anthropic. Present under the `user-profiles-2026-09-04` beta
        #   header, with every field present and `null` until the platform supplies a value;
        #   the earlier beta headers serve `reference_id` as the top-level `external_id`,
        #   and `user-profiles-2026-08-18` serves `onboarded_at` as
        #   `external_user_onboarded_at`.
        #
        #   @return [Anthropic::Models::Beta::BetaUserProfileExternalUserDetails, nil]
        optional :external_user_details, -> { Anthropic::Beta::BetaUserProfileExternalUserDetails }

        # @!attribute external_user_onboarded_at
        #   When the entity this profile represents opened its account with the platform, as
        #   stated by the platform, in RFC 3339 format (UTC). `null` until the platform
        #   supplies one. Present under the `user-profiles-2026-08-18` beta header; under
        #   `user-profiles-2026-09-04` the value is `external_user_details.onboarded_at`.
        #
        #   @return [Time, nil]
        optional :external_user_onboarded_at, Time, nil?: true

        # @!attribute name
        #   Real-world name of the entity this profile represents (company or individual).
        #   For a company the platform resells Claude access to (`access_type`
        #   `passthrough`) this is that company's name.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!method initialize(id:, created_at:, metadata:, trust_grants:, type:, updated_at:, access_type: nil, external_id: nil, external_user_details: nil, external_user_onboarded_at: nil, name: nil)
        #   A record of an entity that the platform serves through the API, such as an
        #   end-user of the platform's product or a company that the platform resells Claude
        #   access to.
        #
        #   A Messages, Message Batches or token counting request can send a profile's `id`
        #   in the `anthropic-user-profile-id` header to attribute the request to that
        #   entity.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaUserProfile} for more details.
        #
        #   @param id [String] Unique identifier for this user profile, prefixed `uprof_`.
        #
        #   @param created_at [Time] When this user profile was created, in RFC 3339 format.
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up t
        #
        #   @param trust_grants [Hash{Symbol=>Anthropic::Models::Beta::BetaUserProfileTrustGrant}] Trust grants for this profile, keyed by grant name. Key omitted when no grant is
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaUserProfile::Type] Object type. Always `user_profile`.
        #
        #   @param updated_at [Time] When this user profile was last modified, in RFC 3339 format. Trust-grant status
        #
        #   @param access_type [Symbol, Anthropic::Models::Beta::BetaUserProfile::AccessType] How the platform uses the API for this entity: `application` (default) or `passt
        #
        #   @param external_id [String, nil] Platform's own identifier for this user. Not enforced unique. Present under the
        #
        #   @param external_user_details [Anthropic::Models::Beta::BetaUserProfileExternalUserDetails] Details about the entity this profile represents, as the platform states them; n
        #
        #   @param external_user_onboarded_at [Time, nil] When the entity this profile represents opened its account with the platform, as
        #
        #   @param name [String, nil] Real-world name of the entity this profile represents (company or individual). F

        # Object type. Always `user_profile`.
        #
        # @see Anthropic::Models::Beta::BetaUserProfile#type
        module Type
          extend Anthropic::Internal::Type::Enum

          USER_PROFILE = :user_profile

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # How the platform uses the API for this entity: `application` (default) or
        # `passthrough`. Present under the `user-profiles-2026-08-18` and later beta
        # headers.
        #
        # @see Anthropic::Models::Beta::BetaUserProfile#access_type
        module AccessType
          extend Anthropic::Internal::Type::Enum

          # The user profile represents an individual end-user of a product that the platform builds on the API. New profiles get this value by default.
          APPLICATION = :application

          # The user profile represents a company that the platform resells Claude access to.
          PASSTHROUGH = :passthrough

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaUserProfile = Beta::BetaUserProfile
  end
end
