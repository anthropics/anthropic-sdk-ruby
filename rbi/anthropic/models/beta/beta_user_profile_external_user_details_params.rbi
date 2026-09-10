# typed: strong

module Anthropic
  module Models
    BetaUserProfileExternalUserDetailsParams =
      Beta::BetaUserProfileExternalUserDetailsParams

    module Beta
      class BetaUserProfileExternalUserDetailsParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams,
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
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::AccountStatus::OrSymbol
            )
          )
        end
        attr_accessor :account_status

        # The country of the entity (not of the platform), as the platform determines it:
        # an ISO 3166-1 alpha-2 code in upper case, for example `US`. Only the form, two
        # uppercase ASCII letters, is checked.
        sig { returns(T.nilable(String)) }
        attr_accessor :country

        # A hash of the entity's email address, computed by the platform. Anthropic treats
        # it as an opaque string and does not prescribe the hash function. 1 to 255
        # characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :email_hash

        # What kind of entity the profile represents, as the platform states it:
        # `individual`, `business`, `non_profit` or `government`.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType::OrSymbol
            )
          )
        end
        attr_accessor :entity_type

        # A hash of the entity's name, computed by the platform. Anthropic treats it as an
        # opaque string and does not prescribe the hash function. 1 to 255 characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :name_hash

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_reader :onboarded_at

        sig { params(onboarded_at: Time).void }
        attr_writer :onboarded_at

        # The platform's own reference for the entity, for example the key of the
        # end-user's row in the platform's database. Not interpreted by Anthropic and not
        # enforced unique. 1 to 255 characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :reference_id

        sig do
          params(
            account_status:
              T.nilable(
                Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::AccountStatus::OrSymbol
              ),
            country: T.nilable(String),
            email_hash: T.nilable(String),
            entity_type:
              T.nilable(
                Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType::OrSymbol
              ),
            name_hash: T.nilable(String),
            onboarded_at: Time,
            reference_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The status of the entity's account on the platform, as the platform states it:
          # `active`; `suspended`, when the platform has restricted the account and may
          # restore it; or `blocked`, when the platform has barred it. It records the
          # platform's decision only; the statuses in `trust_grants` are Anthropic's and do
          # not follow it.
          account_status: nil,
          # The country of the entity (not of the platform), as the platform determines it:
          # an ISO 3166-1 alpha-2 code in upper case, for example `US`. Only the form, two
          # uppercase ASCII letters, is checked.
          country: nil,
          # A hash of the entity's email address, computed by the platform. Anthropic treats
          # it as an opaque string and does not prescribe the hash function. 1 to 255
          # characters.
          email_hash: nil,
          # What kind of entity the profile represents, as the platform states it:
          # `individual`, `business`, `non_profit` or `government`.
          entity_type: nil,
          # A hash of the entity's name, computed by the platform. Anthropic treats it as an
          # opaque string and does not prescribe the hash function. 1 to 255 characters.
          name_hash: nil,
          # A timestamp in RFC 3339 format
          onboarded_at: nil,
          # The platform's own reference for the entity, for example the key of the
          # end-user's row in the platform's database. Not interpreted by Anthropic and not
          # enforced unique. 1 to 255 characters.
          reference_id: nil
        )
        end

        sig do
          override.returns(
            {
              account_status:
                T.nilable(
                  Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::AccountStatus::OrSymbol
                ),
              country: T.nilable(String),
              email_hash: T.nilable(String),
              entity_type:
                T.nilable(
                  Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType::OrSymbol
                ),
              name_hash: T.nilable(String),
              onboarded_at: Time,
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
                Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::AccountStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::AccountStatus::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::AccountStatus::TaggedSymbol
            )
          BLOCKED =
            T.let(
              :blocked,
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::AccountStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::AccountStatus::TaggedSymbol
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
                Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INDIVIDUAL =
            T.let(
              :individual,
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType::TaggedSymbol
            )
          BUSINESS =
            T.let(
              :business,
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType::TaggedSymbol
            )
          NON_PROFIT =
            T.let(
              :non_profit,
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType::TaggedSymbol
            )
          GOVERNMENT =
            T.let(
              :government,
              Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaUserProfileExternalUserDetailsParams::EntityType::TaggedSymbol
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
