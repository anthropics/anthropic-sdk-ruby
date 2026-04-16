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
        #   A timestamp in RFC 3339 format
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
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :updated_at, Time

        # @!attribute external_id
        #   Platform's own identifier for this user. Not enforced unique.
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!method initialize(id:, created_at:, metadata:, trust_grants:, type:, updated_at:, external_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaUserProfile} for more details.
        #
        #   @param id [String] Unique identifier for this user profile, prefixed `uprof_`.
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up t
        #
        #   @param trust_grants [Hash{Symbol=>Anthropic::Models::Beta::BetaUserProfileTrustGrant}] Trust grants for this profile, keyed by grant name. Key omitted when no grant is
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaUserProfile::Type] Object type. Always `user_profile`.
        #
        #   @param updated_at [Time] A timestamp in RFC 3339 format
        #
        #   @param external_id [String, nil] Platform's own identifier for this user. Not enforced unique.

        # Object type. Always `user_profile`.
        #
        # @see Anthropic::Models::Beta::BetaUserProfile#type
        module Type
          extend Anthropic::Internal::Type::Enum

          USER_PROFILE = :user_profile

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaUserProfile = Beta::BetaUserProfile
  end
end
