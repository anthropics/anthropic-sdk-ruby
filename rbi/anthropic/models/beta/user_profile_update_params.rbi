# typed: strong

module Anthropic
  module Models
    module Beta
      class UserProfileUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::UserProfileUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The ID of the user profile to update (`uprof_...`).
        sig { returns(String) }
        attr_accessor :user_profile_id

        # If present, replaces the stored access type. Omit to leave unchanged.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::UserProfileUpdateParams::AccessType::OrSymbol
            )
          )
        end
        attr_accessor :access_type

        # If present, replaces the stored external_id. Omit to leave unchanged. Maximum
        # 255 characters. Accepted under the `user-profiles-2026-03-24` and
        # `user-profiles-2026-08-18` beta headers; under `user-profiles-2026-09-04` send
        # `external_user_details.reference_id` instead.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # Details about the entity this profile represents, as the platform states them.
        # Each field sent replaces the stored value; omit a field to leave it unchanged.
        # Once set, a value cannot be cleared and `null` is rejected. Accepted under the
        # `user-profiles-2026-09-04` beta header only.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaUserProfileExternalUserDetailsParams)
          )
        end
        attr_reader :external_user_details

        sig do
          params(
            external_user_details:
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::OrHash
          ).void
        end
        attr_writer :external_user_details

        # If present, replaces the stored account creation time. Omit to leave unchanged;
        # once set, the value cannot be cleared and `null` is rejected. Must be a complete
        # RFC 3339 timestamp no more than 1 minute in the future. Accepted under the
        # `user-profiles-2026-08-18` beta header; under `user-profiles-2026-09-04` send
        # `external_user_details.onboarded_at` instead.
        sig { returns(T.nilable(Time)) }
        attr_reader :external_user_onboarded_at

        sig { params(external_user_onboarded_at: Time).void }
        attr_writer :external_user_onboarded_at

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

        # Optional header to specify the beta version(s) you want to use.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
          ).void
        end
        attr_writer :betas

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
            access_type:
              T.nilable(
                Anthropic::Beta::UserProfileUpdateParams::AccessType::OrSymbol
              ),
            external_id: T.nilable(String),
            external_user_details:
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::OrHash,
            external_user_onboarded_at: Time,
            metadata: T::Hash[Symbol, String],
            name: T.nilable(String),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the user profile to update (`uprof_...`).
          user_profile_id:,
          # If present, replaces the stored access type. Omit to leave unchanged.
          access_type: nil,
          # If present, replaces the stored external_id. Omit to leave unchanged. Maximum
          # 255 characters. Accepted under the `user-profiles-2026-03-24` and
          # `user-profiles-2026-08-18` beta headers; under `user-profiles-2026-09-04` send
          # `external_user_details.reference_id` instead.
          external_id: nil,
          # Details about the entity this profile represents, as the platform states them.
          # Each field sent replaces the stored value; omit a field to leave it unchanged.
          # Once set, a value cannot be cleared and `null` is rejected. Accepted under the
          # `user-profiles-2026-09-04` beta header only.
          external_user_details: nil,
          # If present, replaces the stored account creation time. Omit to leave unchanged;
          # once set, the value cannot be cleared and `null` is rejected. Must be a complete
          # RFC 3339 timestamp no more than 1 minute in the future. Accepted under the
          # `user-profiles-2026-08-18` beta header; under `user-profiles-2026-09-04` send
          # `external_user_details.onboarded_at` instead.
          external_user_onboarded_at: nil,
          # Key-value pairs to merge into the stored metadata. Keys provided overwrite
          # existing values. To remove a key, set its value to an empty string. Keys not
          # provided are left unchanged. Maximum 16 keys, with keys up to 64 characters and
          # values up to 512 characters.
          metadata: nil,
          # If present, replaces the stored name. Omit to leave unchanged. Maximum 255
          # characters.
          name: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
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
              access_type:
                T.nilable(
                  Anthropic::Beta::UserProfileUpdateParams::AccessType::OrSymbol
                ),
              external_id: T.nilable(String),
              external_user_details:
                Anthropic::Beta::BetaUserProfileExternalUserDetailsParams,
              external_user_onboarded_at: Time,
              metadata: T::Hash[Symbol, String],
              name: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # If present, replaces the stored access type. Omit to leave unchanged.
        module AccessType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::UserProfileUpdateParams::AccessType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The user profile represents an individual end-user of a product that the platform builds on the API. New profiles get this value by default.
          APPLICATION =
            T.let(
              :application,
              Anthropic::Beta::UserProfileUpdateParams::AccessType::TaggedSymbol
            )

          # The user profile represents a company that the platform resells Claude access to.
          PASSTHROUGH =
            T.let(
              :passthrough,
              Anthropic::Beta::UserProfileUpdateParams::AccessType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileUpdateParams::AccessType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
