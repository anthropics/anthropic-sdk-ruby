# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#update
      class UserProfileUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute user_profile_id
        #   The ID of the user profile to update (`uprof_...`).
        #
        #   @return [String]
        required :user_profile_id, String

        # @!attribute access_type
        #   If present, replaces the stored access type. Omit to leave unchanged.
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileUpdateParams::AccessType, nil]
        optional :access_type, enum: -> { Anthropic::Beta::UserProfileUpdateParams::AccessType }, nil?: true

        # @!attribute external_id
        #   If present, replaces the stored external_id. Omit to leave unchanged. Maximum
        #   255 characters. Accepted under the `user-profiles-2026-03-24` and
        #   `user-profiles-2026-08-18` beta headers; under `user-profiles-2026-09-04` send
        #   `external_user_details.reference_id` instead.
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!attribute external_user_details
        #   Details about the entity this profile represents, as the platform states them.
        #   Each field sent replaces the stored value; omit a field to leave it unchanged.
        #   Once set, a value cannot be cleared and `null` is rejected. Accepted under the
        #   `user-profiles-2026-09-04` beta header only.
        #
        #   @return [Anthropic::Models::Beta::BetaUserProfileExternalUserDetailsParams, nil]
        optional :external_user_details, -> { Anthropic::Beta::BetaUserProfileExternalUserDetailsParams }

        # @!attribute external_user_onboarded_at
        #   If present, replaces the stored account creation time. Omit to leave unchanged;
        #   once set, the value cannot be cleared and `null` is rejected. Must be a complete
        #   RFC 3339 timestamp no more than 1 minute in the future. Accepted under the
        #   `user-profiles-2026-08-18` beta header; under `user-profiles-2026-09-04` send
        #   `external_user_details.onboarded_at` instead.
        #
        #   @return [Time, nil]
        optional :external_user_onboarded_at, Time

        # @!attribute metadata
        #   Key-value pairs to merge into the stored metadata. Keys provided overwrite
        #   existing values. To remove a key, set its value to an empty string. Keys not
        #   provided are left unchanged. Maximum 16 keys, with keys up to 64 characters and
        #   values up to 512 characters.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute name
        #   If present, replaces the stored name. Omit to leave unchanged. Maximum 255
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

        # @!method initialize(user_profile_id:, access_type: nil, external_id: nil, external_user_details: nil, external_user_onboarded_at: nil, metadata: nil, name: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::UserProfileUpdateParams} for more details.
        #
        #   @param user_profile_id [String] The ID of the user profile to update (`uprof_...`).
        #
        #   @param access_type [Symbol, Anthropic::Models::Beta::UserProfileUpdateParams::AccessType, nil] If present, replaces the stored access type. Omit to leave unchanged.
        #
        #   @param external_id [String, nil] If present, replaces the stored external_id. Omit to leave unchanged. Maximum 25
        #
        #   @param external_user_details [Anthropic::Models::Beta::BetaUserProfileExternalUserDetailsParams] Details about the entity this profile represents, as the platform states them. E
        #
        #   @param external_user_onboarded_at [Time] If present, replaces the stored account creation time. Omit to leave unchanged;
        #
        #   @param metadata [Hash{Symbol=>String}] Key-value pairs to merge into the stored metadata. Keys provided overwrite exist
        #
        #   @param name [String, nil] If present, replaces the stored name. Omit to leave unchanged. Maximum 255 chara
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # If present, replaces the stored access type. Omit to leave unchanged.
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
