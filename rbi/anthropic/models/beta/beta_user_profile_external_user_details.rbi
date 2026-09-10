# typed: strong

module Anthropic
  module Models
    BetaUserProfileExternalUserDetails =
      Beta::BetaUserProfileExternalUserDetails

    module Beta
      class BetaUserProfileExternalUserDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaUserProfileExternalUserDetails,
              Anthropic::Internal::AnyHash
            )
          end

        # The status of the entity's account on the platform, as the platform states it:
        # `active`; `suspended`, when the platform has restricted the account and may
        # restore it; or `blocked`, when the platform has barred it. It records the
        # platform's decision only; the statuses in `trust_grants` are Anthropic's and do
        # not follow it.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus::TaggedSymbol
            )
          )
        end
        attr_accessor :account_status

        # The country the platform associates with the entity, as an ISO 3166-1 alpha-2
        # code. `null` until the platform supplies one.
        sig { returns(T.nilable(String)) }
        attr_accessor :country

        # The platform-computed hash of the entity's email address. `null` until the
        # platform supplies one.
        sig { returns(T.nilable(String)) }
        attr_accessor :email_hash

        # What kind of entity the profile represents, as the platform states it:
        # `individual`, `business`, `non_profit` or `government`.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType::TaggedSymbol
            )
          )
        end
        attr_accessor :entity_type

        # The platform-computed hash of the entity's name. `null` until the platform
        # supplies one.
        sig { returns(T.nilable(String)) }
        attr_accessor :name_hash

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :onboarded_at

        # The platform's own reference for the entity. `null` until the platform supplies
        # one.
        sig { returns(T.nilable(String)) }
        attr_accessor :reference_id

        # Details about the entity this profile represents, as the platform states them.
        # Anthropic does not verify them. Every field is present, `null` until the
        # platform supplies a value.
        sig do
          params(
            account_status:
              T.nilable(
                Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus::OrSymbol
              ),
            country: T.nilable(String),
            email_hash: T.nilable(String),
            entity_type:
              T.nilable(
                Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType::OrSymbol
              ),
            name_hash: T.nilable(String),
            onboarded_at: T.nilable(Time),
            reference_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The status of the entity's account on the platform, as the platform states it:
          # `active`; `suspended`, when the platform has restricted the account and may
          # restore it; or `blocked`, when the platform has barred it. It records the
          # platform's decision only; the statuses in `trust_grants` are Anthropic's and do
          # not follow it.
          account_status:,
          # The country the platform associates with the entity, as an ISO 3166-1 alpha-2
          # code. `null` until the platform supplies one.
          country:,
          # The platform-computed hash of the entity's email address. `null` until the
          # platform supplies one.
          email_hash:,
          # What kind of entity the profile represents, as the platform states it:
          # `individual`, `business`, `non_profit` or `government`.
          entity_type:,
          # The platform-computed hash of the entity's name. `null` until the platform
          # supplies one.
          name_hash:,
          # A timestamp in RFC 3339 format
          onboarded_at:,
          # The platform's own reference for the entity. `null` until the platform supplies
          # one.
          reference_id:
        )
        end

        sig do
          override.returns(
            {
              account_status:
                T.nilable(
                  Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus::TaggedSymbol
                ),
              country: T.nilable(String),
              email_hash: T.nilable(String),
              entity_type:
                T.nilable(
                  Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType::TaggedSymbol
                ),
              name_hash: T.nilable(String),
              onboarded_at: T.nilable(Time),
              reference_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # The status of the entity's account on the platform, as the platform states it:
        # `active`; `suspended`, when the platform has restricted the account and may
        # restore it; or `blocked`, when the platform has barred it. It records the
        # platform's decision only; the statuses in `trust_grants` are Anthropic's and do
        # not follow it.
        module AccountStatus
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus::TaggedSymbol
            )
          BLOCKED =
            T.let(
              :blocked,
              Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaUserProfileExternalUserDetails::AccountStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # What kind of entity the profile represents, as the platform states it:
        # `individual`, `business`, `non_profit` or `government`.
        module EntityType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INDIVIDUAL =
            T.let(
              :individual,
              Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType::TaggedSymbol
            )
          BUSINESS =
            T.let(
              :business,
              Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType::TaggedSymbol
            )
          NON_PROFIT =
            T.let(
              :non_profit,
              Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType::TaggedSymbol
            )
          GOVERNMENT =
            T.let(
              :government,
              Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaUserProfileExternalUserDetails::EntityType::TaggedSymbol
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
