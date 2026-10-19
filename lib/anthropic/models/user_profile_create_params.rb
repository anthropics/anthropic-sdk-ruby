# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::UserProfiles#create
    class UserProfileCreateParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute access_type
      #   How the platform uses the API for this entity. `application` (default): the
      #   profile represents an individual end-user of the platform's product.
      #   `passthrough`: the profile identifies a company the platform resells Claude
      #   access to.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileAccessType, nil]
      optional :access_type, enum: -> { Anthropic::UserProfileAccessType }

      # @!attribute external_user_details
      #   Details about the entity this profile represents, as the platform states them.
      #   Every field is optional. Not accepted under the legacy
      #   `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta headers, which
      #   take the top-level `external_id` (and, under `user-profiles-2026-08-18`,
      #   `external_user_onboarded_at`) instead.
      #
      #   @return [Anthropic::Models::UserProfileExternalUserDetailsParams, nil]
      optional :external_user_details, -> { Anthropic::UserProfileExternalUserDetailsParams }

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

      # @!method initialize(access_type: nil, external_user_details: nil, metadata: nil, name: nil, workspace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileCreateParams} for more details.
      #
      #   @param access_type [Symbol, Anthropic::Models::UserProfileAccessType] How the platform uses the API for this entity. `application` (default): the prof
      #
      #   @param external_user_details [Anthropic::Models::UserProfileExternalUserDetailsParams] Details about the entity this profile represents, as the platform states them. E
      #
      #   @param metadata [Hash{Symbol=>String}] Free-form key-value data to attach to this user profile. Maximum 16 keys, with k
      #
      #   @param name [String, nil] Optional for all profiles. Real-world name of the entity this profile represents
      #
      #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
