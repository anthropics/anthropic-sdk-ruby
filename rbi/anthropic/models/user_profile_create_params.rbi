# typed: strong

module Anthropic
  module Models
    class UserProfileCreateParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileCreateParams,
            Anthropic::Internal::AnyHash
          )
        end

      # How the platform uses the API for this entity. `application` (default): the
      # profile represents an individual end-user of the platform's product.
      # `passthrough`: the profile identifies a company the platform resells Claude
      # access to.
      sig { returns(T.nilable(Anthropic::UserProfileAccessType::OrSymbol)) }
      attr_reader :access_type

      sig do
        params(access_type: Anthropic::UserProfileAccessType::OrSymbol).void
      end
      attr_writer :access_type

      # Details about the entity this profile represents, as the platform states them.
      # Every field is optional. Not accepted under the legacy
      # `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta headers, which
      # take the top-level `external_id` (and, under `user-profiles-2026-08-18`,
      # `external_user_onboarded_at`) instead.
      sig do
        returns(T.nilable(Anthropic::UserProfileExternalUserDetailsParams))
      end
      attr_reader :external_user_details

      sig do
        params(
          external_user_details:
            Anthropic::UserProfileExternalUserDetailsParams::OrHash
        ).void
      end
      attr_writer :external_user_details

      # Free-form key-value data to attach to this user profile. Maximum 16 keys, with
      # keys up to 64 characters and values up to 512 characters. Values must be
      # non-empty strings.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Optional for all profiles. Real-world name of the entity this profile represents
      # (company or individual); for a company the platform resells Claude access to
      # (`access_type` `passthrough`), that company's name where known. Maximum 255
      # characters.
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Optional header to select the Workspace for this request. The value is a
      # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
      #
      # Only needed for credentials that can act on more than one Workspace. A
      # credential that belongs to a specific Workspace may omit it; if sent, it must
      # match that Workspace.
      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig do
        params(
          access_type: Anthropic::UserProfileAccessType::OrSymbol,
          external_user_details:
            Anthropic::UserProfileExternalUserDetailsParams::OrHash,
          metadata: T::Hash[Symbol, String],
          name: T.nilable(String),
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # How the platform uses the API for this entity. `application` (default): the
        # profile represents an individual end-user of the platform's product.
        # `passthrough`: the profile identifies a company the platform resells Claude
        # access to.
        access_type: nil,
        # Details about the entity this profile represents, as the platform states them.
        # Every field is optional. Not accepted under the legacy
        # `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta headers, which
        # take the top-level `external_id` (and, under `user-profiles-2026-08-18`,
        # `external_user_onboarded_at`) instead.
        external_user_details: nil,
        # Free-form key-value data to attach to this user profile. Maximum 16 keys, with
        # keys up to 64 characters and values up to 512 characters. Values must be
        # non-empty strings.
        metadata: nil,
        # Optional for all profiles. Real-world name of the entity this profile represents
        # (company or individual); for a company the platform resells Claude access to
        # (`access_type` `passthrough`), that company's name where known. Maximum 255
        # characters.
        name: nil,
        # Optional header to select the Workspace for this request. The value is a
        # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        # Only needed for credentials that can act on more than one Workspace. A
        # credential that belongs to a specific Workspace may omit it; if sent, it must
        # match that Workspace.
        workspace_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            access_type: Anthropic::UserProfileAccessType::OrSymbol,
            external_user_details:
              Anthropic::UserProfileExternalUserDetailsParams,
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            workspace_id: String,
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
