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

        # @!attribute access_type
        #   How the platform uses the API on behalf of the entity this profile represents.
        #   `application`: the platform sells a product that uses the API behind the scenes,
        #   and the profile represents an individual end-user of that product.
        #   `passthrough`: the platform resells raw inference, and the profile identifies
        #   the resold-to company.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaUserProfile::AccessType, nil]
        optional :access_type, enum: -> { Anthropic::Beta::BetaUserProfile::AccessType }

        # @!attribute external_id
        #   Platform's own identifier for this user. Not enforced unique.
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!attribute external_user_onboarded_at
        #   A timestamp in RFC 3339 format
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

        # @!method initialize(id:, created_at:, metadata:, trust_grants:, type:, updated_at:, access_type: nil, external_id: nil, external_user_onboarded_at: nil, name: nil)
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
        #   @param access_type [Symbol, Anthropic::Models::Beta::BetaUserProfile::AccessType] How the platform uses the API on behalf of the entity this profile represents. `
        #
        #   @param external_id [String, nil] Platform's own identifier for this user. Not enforced unique.
        #
        #   @param external_user_onboarded_at [Time, nil] A timestamp in RFC 3339 format
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

        # How the platform uses the API on behalf of the entity this profile represents.
        # `application`: the platform sells a product that uses the API behind the scenes,
        # and the profile represents an individual end-user of that product.
        # `passthrough`: the platform resells raw inference, and the profile identifies
        # the resold-to company.
        #
        # @see Anthropic::Models::Beta::BetaUserProfile#access_type
        module AccessType
          extend Anthropic::Internal::Type::Enum

          APPLICATION = :application
          PASSTHROUGH = :passthrough

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaUserProfile = Beta::BetaUserProfile
  end
end
