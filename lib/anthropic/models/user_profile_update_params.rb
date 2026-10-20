# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::UserProfiles#update
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
      #   @return [Symbol, Anthropic::Models::UserProfileAccessType, nil]
      optional :access_type, enum: -> { Anthropic::UserProfileAccessType }, nil?: true

      # @!attribute external_user_details
      #   Details about the entity this profile represents, as the platform states them.
      #   Each field sent replaces the stored value; omit a field to leave it unchanged.
      #   Once set, a value cannot be cleared and `null` is rejected. Not accepted under
      #   the legacy `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta
      #   headers.
      #
      #   @return [Anthropic::Models::UserProfileExternalUserDetailsParams, nil]
      optional :external_user_details, -> { Anthropic::UserProfileExternalUserDetailsParams }

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

      # @!method initialize(user_profile_id:, access_type: nil, external_user_details: nil, metadata: nil, name: nil, workspace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileUpdateParams} for more details.
      #
      #   @param user_profile_id [String] The ID of the user profile to update (`uprof_...`).
      #
      #   @param access_type [Symbol, Anthropic::Models::UserProfileAccessType, nil] If present, replaces the stored access type. Omit to leave unchanged.
      #
      #   @param external_user_details [Anthropic::Models::UserProfileExternalUserDetailsParams] Details about the entity this profile represents, as the platform states them. E
      #
      #   @param metadata [Hash{Symbol=>String}] Key-value pairs to merge into the stored metadata. Keys provided overwrite exist
      #
      #   @param name [String, nil] If present, replaces the stored name. Omit to leave unchanged. Maximum 255 chara
      #
      #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
