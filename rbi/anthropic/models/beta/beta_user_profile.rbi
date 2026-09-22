# typed: strong

module Anthropic
  module Models
    BetaUserProfile = Beta::BetaUserProfile

    module Beta
      class BetaUserProfile < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaUserProfile,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for this user profile, prefixed `uprof_`.
        sig { returns(String) }
        attr_accessor :id

        # When this user profile was created, in RFC 3339 format.
        sig { returns(Time) }
        attr_accessor :created_at

        # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
        # to 512 chars.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :metadata

        # Trust grants for this profile, keyed by grant name. Key omitted when no grant is
        # active or in flight.
        sig do
          returns(T::Hash[Symbol, Anthropic::Beta::BetaUserProfileTrustGrant])
        end
        attr_accessor :trust_grants

        # Object type. Always `user_profile`.
        sig { returns(Anthropic::Beta::BetaUserProfile::Type::TaggedSymbol) }
        attr_accessor :type

        # When this user profile was last modified, in RFC 3339 format. Trust-grant status
        # changes also bump this timestamp.
        sig { returns(Time) }
        attr_accessor :updated_at

        # How the platform uses the API for this entity: `application` (default) or
        # `passthrough`. Present under the `user-profiles-2026-08-18` and later beta
        # headers.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaUserProfile::AccessType::TaggedSymbol
            )
          )
        end
        attr_reader :access_type

        sig do
          params(
            access_type: Anthropic::Beta::BetaUserProfile::AccessType::OrSymbol
          ).void
        end
        attr_writer :access_type

        # Platform's own identifier for this user. Not enforced unique. Present under the
        # `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta headers; under
        # `user-profiles-2026-09-04` the value is `external_user_details.reference_id`.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # Details about the entity this profile represents, as the platform states them;
        # not verified by Anthropic. Present under the `user-profiles-2026-09-04` beta
        # header, with every field present and `null` until the platform supplies a value;
        # the earlier beta headers serve `reference_id` as the top-level `external_id`,
        # and `user-profiles-2026-08-18` serves `onboarded_at` as
        # `external_user_onboarded_at`.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaUserProfileExternalUserDetails)
          )
        end
        attr_reader :external_user_details

        sig do
          params(
            external_user_details:
              Anthropic::Beta::BetaUserProfileExternalUserDetails::OrHash
          ).void
        end
        attr_writer :external_user_details

        # When the entity this profile represents opened its account with the platform, as
        # stated by the platform, in RFC 3339 format (UTC). `null` until the platform
        # supplies one. Present under the `user-profiles-2026-08-18` beta header; under
        # `user-profiles-2026-09-04` the value is `external_user_details.onboarded_at`.
        sig { returns(T.nilable(Time)) }
        attr_accessor :external_user_onboarded_at

        # Real-world name of the entity this profile represents (company or individual).
        # For a company the platform resells Claude access to (`access_type`
        # `passthrough`) this is that company's name.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # A record of an entity that the platform serves through the API, such as an
        # end-user of the platform's product or a company that the platform resells Claude
        # access to.
        #
        # A Messages, Message Batches or token counting request can send a profile's `id`
        # in the `anthropic-user-profile-id` header to attribute the request to that
        # entity.
        sig do
          params(
            id: String,
            created_at: Time,
            metadata: T::Hash[Symbol, String],
            trust_grants:
              T::Hash[
                Symbol,
                Anthropic::Beta::BetaUserProfileTrustGrant::OrHash
              ],
            type: Anthropic::Beta::BetaUserProfile::Type::OrSymbol,
            updated_at: Time,
            access_type: Anthropic::Beta::BetaUserProfile::AccessType::OrSymbol,
            external_id: T.nilable(String),
            external_user_details:
              Anthropic::Beta::BetaUserProfileExternalUserDetails::OrHash,
            external_user_onboarded_at: T.nilable(Time),
            name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this user profile, prefixed `uprof_`.
          id:,
          # When this user profile was created, in RFC 3339 format.
          created_at:,
          # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
          # to 512 chars.
          metadata:,
          # Trust grants for this profile, keyed by grant name. Key omitted when no grant is
          # active or in flight.
          trust_grants:,
          # Object type. Always `user_profile`.
          type:,
          # When this user profile was last modified, in RFC 3339 format. Trust-grant status
          # changes also bump this timestamp.
          updated_at:,
          # How the platform uses the API for this entity: `application` (default) or
          # `passthrough`. Present under the `user-profiles-2026-08-18` and later beta
          # headers.
          access_type: nil,
          # Platform's own identifier for this user. Not enforced unique. Present under the
          # `user-profiles-2026-03-24` and `user-profiles-2026-08-18` beta headers; under
          # `user-profiles-2026-09-04` the value is `external_user_details.reference_id`.
          external_id: nil,
          # Details about the entity this profile represents, as the platform states them;
          # not verified by Anthropic. Present under the `user-profiles-2026-09-04` beta
          # header, with every field present and `null` until the platform supplies a value;
          # the earlier beta headers serve `reference_id` as the top-level `external_id`,
          # and `user-profiles-2026-08-18` serves `onboarded_at` as
          # `external_user_onboarded_at`.
          external_user_details: nil,
          # When the entity this profile represents opened its account with the platform, as
          # stated by the platform, in RFC 3339 format (UTC). `null` until the platform
          # supplies one. Present under the `user-profiles-2026-08-18` beta header; under
          # `user-profiles-2026-09-04` the value is `external_user_details.onboarded_at`.
          external_user_onboarded_at: nil,
          # Real-world name of the entity this profile represents (company or individual).
          # For a company the platform resells Claude access to (`access_type`
          # `passthrough`) this is that company's name.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              metadata: T::Hash[Symbol, String],
              trust_grants:
                T::Hash[Symbol, Anthropic::Beta::BetaUserProfileTrustGrant],
              type: Anthropic::Beta::BetaUserProfile::Type::TaggedSymbol,
              updated_at: Time,
              access_type:
                Anthropic::Beta::BetaUserProfile::AccessType::TaggedSymbol,
              external_id: T.nilable(String),
              external_user_details:
                Anthropic::Beta::BetaUserProfileExternalUserDetails,
              external_user_onboarded_at: T.nilable(Time),
              name: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Object type. Always `user_profile`.
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaUserProfile::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER_PROFILE =
            T.let(
              :user_profile,
              Anthropic::Beta::BetaUserProfile::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaUserProfile::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        # How the platform uses the API for this entity: `application` (default) or
        # `passthrough`. Present under the `user-profiles-2026-08-18` and later beta
        # headers.
        module AccessType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaUserProfile::AccessType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The user profile represents an individual end-user of a product that the platform builds on the API. New profiles get this value by default.
          APPLICATION =
            T.let(
              :application,
              Anthropic::Beta::BetaUserProfile::AccessType::TaggedSymbol
            )

          # The user profile represents a company that the platform resells Claude access to.
          PASSTHROUGH =
            T.let(
              :passthrough,
              Anthropic::Beta::BetaUserProfile::AccessType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaUserProfile::AccessType::TaggedSymbol
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
