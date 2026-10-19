# typed: strong

module Anthropic
  module Models
    class UserProfileUpdateParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileUpdateParams,
            Anthropic::Internal::AnyHash
          )
        end

      # The ID of the user profile to update (`uprof_...`).
      sig { returns(String) }
      attr_accessor :user_profile_id

      # If present, replaces the stored access type. Omit to leave unchanged.
      sig { returns(T.nilable(Anthropic::UserProfileAccessType::OrSymbol)) }
      attr_accessor :access_type

      # Details about the entity this profile represents, as the platform states them.
      # Each field sent replaces the stored value; omit a field to leave it unchanged.
      # Once set, a value cannot be cleared and `null` is rejected. Not accepted under
      # the legacy `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta
      # headers.
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

      # Key-value pairs to merge into the stored metadata. Keys provided overwrite
      # existing values. To remove a key, set its value to an empty string. Keys not
      # provided are left unchanged. Maximum 16 keys, with keys up to 64 characters and
      # values up to 512 characters.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # If present, replaces the stored name. Omit to leave unchanged. Maximum 255
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
          user_profile_id: String,
          access_type: T.nilable(Anthropic::UserProfileAccessType::OrSymbol),
          external_user_details:
            Anthropic::UserProfileExternalUserDetailsParams::OrHash,
          metadata: T::Hash[Symbol, String],
          name: T.nilable(String),
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the user profile to update (`uprof_...`).
        user_profile_id:,
        # If present, replaces the stored access type. Omit to leave unchanged.
        access_type: nil,
        # Details about the entity this profile represents, as the platform states them.
        # Each field sent replaces the stored value; omit a field to leave it unchanged.
        # Once set, a value cannot be cleared and `null` is rejected. Not accepted under
        # the legacy `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta
        # headers.
        external_user_details: nil,
        # Key-value pairs to merge into the stored metadata. Keys provided overwrite
        # existing values. To remove a key, set its value to an empty string. Keys not
        # provided are left unchanged. Maximum 16 keys, with keys up to 64 characters and
        # values up to 512 characters.
        metadata: nil,
        # If present, replaces the stored name. Omit to leave unchanged. Maximum 255
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
            user_profile_id: String,
            access_type: T.nilable(Anthropic::UserProfileAccessType::OrSymbol),
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
