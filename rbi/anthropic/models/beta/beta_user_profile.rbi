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

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
        # to 512 chars.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :metadata

        # How the entity behind a user profile relates to the platform that owns the API
        # key. `external`: an individual end-user of the platform. `resold`: a company the
        # platform resells Claude access to. `internal`: the platform's own usage.
        sig do
          returns(Anthropic::Beta::BetaUserProfile::Relationship::TaggedSymbol)
        end
        attr_accessor :relationship

        # Trust grants for this profile, keyed by grant name. Key omitted when no grant is
        # active or in flight.
        sig do
          returns(T::Hash[Symbol, Anthropic::Beta::BetaUserProfileTrustGrant])
        end
        attr_accessor :trust_grants

        # Object type. Always `user_profile`.
        sig { returns(Anthropic::Beta::BetaUserProfile::Type::TaggedSymbol) }
        attr_accessor :type

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :updated_at

        # Platform's own identifier for this user. Not enforced unique.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # Display name of the entity this profile represents. For `resold` this is the
        # resold-to company's name.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        sig do
          params(
            id: String,
            created_at: Time,
            metadata: T::Hash[Symbol, String],
            relationship:
              Anthropic::Beta::BetaUserProfile::Relationship::OrSymbol,
            trust_grants:
              T::Hash[
                Symbol,
                Anthropic::Beta::BetaUserProfileTrustGrant::OrHash
              ],
            type: Anthropic::Beta::BetaUserProfile::Type::OrSymbol,
            updated_at: Time,
            external_id: T.nilable(String),
            name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this user profile, prefixed `uprof_`.
          id:,
          # A timestamp in RFC 3339 format
          created_at:,
          # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
          # to 512 chars.
          metadata:,
          # How the entity behind a user profile relates to the platform that owns the API
          # key. `external`: an individual end-user of the platform. `resold`: a company the
          # platform resells Claude access to. `internal`: the platform's own usage.
          relationship:,
          # Trust grants for this profile, keyed by grant name. Key omitted when no grant is
          # active or in flight.
          trust_grants:,
          # Object type. Always `user_profile`.
          type:,
          # A timestamp in RFC 3339 format
          updated_at:,
          # Platform's own identifier for this user. Not enforced unique.
          external_id: nil,
          # Display name of the entity this profile represents. For `resold` this is the
          # resold-to company's name.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              metadata: T::Hash[Symbol, String],
              relationship:
                Anthropic::Beta::BetaUserProfile::Relationship::TaggedSymbol,
              trust_grants:
                T::Hash[Symbol, Anthropic::Beta::BetaUserProfileTrustGrant],
              type: Anthropic::Beta::BetaUserProfile::Type::TaggedSymbol,
              updated_at: Time,
              external_id: T.nilable(String),
              name: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # How the entity behind a user profile relates to the platform that owns the API
        # key. `external`: an individual end-user of the platform. `resold`: a company the
        # platform resells Claude access to. `internal`: the platform's own usage.
        module Relationship
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaUserProfile::Relationship)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXTERNAL =
            T.let(
              :external,
              Anthropic::Beta::BetaUserProfile::Relationship::TaggedSymbol
            )
          RESOLD =
            T.let(
              :resold,
              Anthropic::Beta::BetaUserProfile::Relationship::TaggedSymbol
            )
          INTERNAL =
            T.let(
              :internal,
              Anthropic::Beta::BetaUserProfile::Relationship::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaUserProfile::Relationship::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
      end
    end
  end
end
