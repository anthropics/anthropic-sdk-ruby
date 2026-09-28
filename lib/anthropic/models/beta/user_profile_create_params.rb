# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#create
      class UserProfileCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute access_type
        #   How the platform uses the API for this entity. `application` (default): the
        #   profile represents an individual end-user of the platform's product.
        #   `passthrough`: the profile identifies a company the platform resells Claude
        #   access to.
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::AccessType, nil]
        optional :access_type, enum: -> { Anthropic::Beta::UserProfileCreateParams::AccessType }

        # @!attribute external_id
        #   Platform's own identifier for this user. Not enforced unique. Maximum 255
        #   characters. Accepted under the `user-profiles-2026-03-24` and
        #   `user-profiles-2026-08-18` beta headers; under `user-profiles-2026-09-04` send
        #   `external_user_details.reference_id` instead.
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!attribute external_user_details
        #   Details about the entity this profile represents, as the platform states them.
        #   Every field is optional. Accepted under the `user-profiles-2026-09-04` beta
        #   header only.
        #
        #   @return [Anthropic::Models::Beta::BetaUserProfileExternalUserDetailsParams, nil]
        optional :external_user_details, -> { Anthropic::Beta::BetaUserProfileExternalUserDetailsParams }

        # @!attribute external_user_onboarded_at
        #   When the entity this profile represents opened its account with the platform, in
        #   RFC 3339 format: for an `application` profile, when the end-user signed up; for
        #   a `passthrough` profile, when the company became the platform's customer. Must
        #   be a complete timestamp no more than 1 minute in the future. Optional. Accepted
        #   under the `user-profiles-2026-08-18` beta header; under
        #   `user-profiles-2026-09-04` send `external_user_details.onboarded_at` instead.
        #
        #   @return [Time, nil]
        optional :external_user_onboarded_at, Time

        # @!attribute metadata
        #   Free-form key-value data to attach to this user profile. Maximum 16 keys, with
        #   keys up to 64 characters and values up to 512 characters. Values must be
        #   non-empty strings.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute name
        #   Optional for all profiles. Real-world name of the entity this profile represents
        #   (company or individual); for a company the platform resells Claude access to
        #   (`access_type` `passthrough`), that company's name where known. Maximum 255
        #   characters.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!attribute workspace_id
        #   Optional header to select the Workspace for this request. The value is a
        #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        #   Only needed for credentials that can act on more than one Workspace. A
        #   credential that belongs to a specific Workspace may omit it; if sent, it must
        #   match that Workspace.
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!method initialize(access_type: nil, external_id: nil, external_user_details: nil, external_user_onboarded_at: nil, metadata: nil, name: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::UserProfileCreateParams} for more details.
        #
        #   @param access_type [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::AccessType] How the platform uses the API for this entity. `application` (default): the prof
        #
        #   @param external_id [String, nil] Platform's own identifier for this user. Not enforced unique. Maximum 255 charac
        #
        #   @param external_user_details [Anthropic::Models::Beta::BetaUserProfileExternalUserDetailsParams] Details about the entity this profile represents, as the platform states them. E
        #
        #   @param external_user_onboarded_at [Time] When the entity this profile represents opened its account with the platform, in
        #
        #   @param metadata [Hash{Symbol=>String}] Free-form key-value data to attach to this user profile. Maximum 16 keys, with k
        #
        #   @param name [String, nil] Optional for all profiles. Real-world name of the entity this profile represents
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # How the platform uses the API for this entity. `application` (default): the
        # profile represents an individual end-user of the platform's product.
        # `passthrough`: the profile identifies a company the platform resells Claude
        # access to.
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
  end
end
