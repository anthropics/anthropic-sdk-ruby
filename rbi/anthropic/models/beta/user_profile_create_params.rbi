# typed: strong

module Anthropic
  module Models
    module Beta
      class UserProfileCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::UserProfileCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # How the platform uses the API for this entity. `application` (default): the
        # profile represents an individual end-user of the platform's product.
        # `passthrough`: the profile identifies a company the platform resells Claude
        # access to.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol
            )
          )
        end
        attr_reader :access_type

        sig do
          params(
            access_type:
              Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol
          ).void
        end
        attr_writer :access_type

        # Platform's own identifier for this user. Not enforced unique. Maximum 255
        # characters. Accepted under the `user-profiles-2026-03-24` and
        # `user-profiles-2026-08-18` beta headers; under `user-profiles-2026-09-04` send
        # `external_user_details.reference_id` instead.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # Details about the entity this profile represents, as the platform states them.
        # Every field is optional. Accepted under the `user-profiles-2026-09-04` beta
        # header only.
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

        # When the entity this profile represents opened its account with the platform, in
        # RFC 3339 format: for an `application` profile, when the end-user signed up; for
        # a `passthrough` profile, when the company became the platform's customer. Must
        # be a complete timestamp no more than 1 minute in the future. Optional. Accepted
        # under the `user-profiles-2026-08-18` beta header; under
        # `user-profiles-2026-09-04` send `external_user_details.onboarded_at` instead.
        sig { returns(T.nilable(Time)) }
        attr_reader :external_user_onboarded_at

        sig { params(external_user_onboarded_at: Time).void }
        attr_writer :external_user_onboarded_at

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
            access_type:
              Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol,
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
          # How the platform uses the API for this entity. `application` (default): the
          # profile represents an individual end-user of the platform's product.
          # `passthrough`: the profile identifies a company the platform resells Claude
          # access to.
          access_type: nil,
          # Platform's own identifier for this user. Not enforced unique. Maximum 255
          # characters. Accepted under the `user-profiles-2026-03-24` and
          # `user-profiles-2026-08-18` beta headers; under `user-profiles-2026-09-04` send
          # `external_user_details.reference_id` instead.
          external_id: nil,
          # Details about the entity this profile represents, as the platform states them.
          # Every field is optional. Accepted under the `user-profiles-2026-09-04` beta
          # header only.
          external_user_details: nil,
          # When the entity this profile represents opened its account with the platform, in
          # RFC 3339 format: for an `application` profile, when the end-user signed up; for
          # a `passthrough` profile, when the company became the platform's customer. Must
          # be a complete timestamp no more than 1 minute in the future. Optional. Accepted
          # under the `user-profiles-2026-08-18` beta header; under
          # `user-profiles-2026-09-04` send `external_user_details.onboarded_at` instead.
          external_user_onboarded_at: nil,
          # Free-form key-value data to attach to this user profile. Maximum 16 keys, with
          # keys up to 64 characters and values up to 512 characters. Values must be
          # non-empty strings.
          metadata: nil,
          # Optional for all profiles. Real-world name of the entity this profile represents
          # (company or individual); for a company the platform resells Claude access to
          # (`access_type` `passthrough`), that company's name where known. Maximum 255
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
              access_type:
                Anthropic::Beta::UserProfileCreateParams::AccessType::OrSymbol,
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

        # How the platform uses the API for this entity. `application` (default): the
        # profile represents an individual end-user of the platform's product.
        # `passthrough`: the profile identifies a company the platform resells Claude
        # access to.
        module AccessType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::UserProfileCreateParams::AccessType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The user profile represents an individual end-user of a product that the platform builds on the API. New profiles get this value by default.
          APPLICATION =
            T.let(
              :application,
              Anthropic::Beta::UserProfileCreateParams::AccessType::TaggedSymbol
            )

          # The user profile represents a company that the platform resells Claude access to.
          PASSTHROUGH =
            T.let(
              :passthrough,
              Anthropic::Beta::UserProfileCreateParams::AccessType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileCreateParams::AccessType::TaggedSymbol
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
