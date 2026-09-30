# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendSummary < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSpendSummary,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaSpendSummary::Actor::Variants
            )
          end
          attr_accessor :actor

          # Effective limit amount as a non-negative integer decimal string in the minor
          # unit of `currency` (cents for USD). `null` means no limit applies for this row's
          # `period` — each period resolves independently, so another period may still cap
          # this member.
          sig { returns(T.nilable(String)) }
          attr_accessor :amount

          # ISO 4217 code of the organization's billing currency; the unit for `amount` and
          # `period_to_date_spend`.
          sig { returns(String) }
          attr_accessor :currency

          # Period this row's effective limit and spend are reported for.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol
            )
          end
          attr_accessor :period

          # The member's spend so far in the current period, as a non-negative decimal
          # string in the minor unit of `currency` (cents for USD). May carry fractional
          # minor units up to three decimal places (e.g. `"12050.5"`) — metered usage is not
          # rounded to whole cents. Reads as `"0"` when the spend reading is temporarily
          # unavailable.
          sig { returns(String) }
          attr_accessor :period_to_date_spend

          sig do
            returns(
              Anthropic::Beta::Organization::BetaSpendSummary::Scope::Variants
            )
          end
          attr_accessor :scope

          sig do
            returns(
              Anthropic::Beta::Organization::BetaSpendSummary::Source::Variants
            )
          end
          attr_accessor :source

          sig { returns(String) }
          attr_accessor :spend_limit_id

          # Per-member effective-limit report row (`GET /spend_limits/effective`).
          sig do
            params(
              actor:
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserActor::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor::OrHash
                ),
              amount: T.nilable(String),
              currency: String,
              period:
                Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol,
              period_to_date_spend: String,
              scope:
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitSeatTierScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitRBACGroupScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationServiceScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope::OrHash
                ),
              source:
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitSeatTierScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitRBACGroupScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationServiceScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope::OrHash
                ),
              spend_limit_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            actor:,
            # Effective limit amount as a non-negative integer decimal string in the minor
            # unit of `currency` (cents for USD). `null` means no limit applies for this row's
            # `period` — each period resolves independently, so another period may still cap
            # this member.
            amount:,
            # ISO 4217 code of the organization's billing currency; the unit for `amount` and
            # `period_to_date_spend`.
            currency:,
            # Period this row's effective limit and spend are reported for.
            period:,
            # The member's spend so far in the current period, as a non-negative decimal
            # string in the minor unit of `currency` (cents for USD). May carry fractional
            # minor units up to three decimal places (e.g. `"12050.5"`) — metered usage is not
            # rounded to whole cents. Reads as `"0"` when the spend reading is temporarily
            # unavailable.
            period_to_date_spend:,
            scope:,
            source:,
            spend_limit_id:
          )
          end

          sig do
            override.returns(
              {
                actor:
                  Anthropic::Beta::Organization::BetaSpendSummary::Actor::Variants,
                amount: T.nilable(String),
                currency: String,
                period:
                  Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol,
                period_to_date_spend: String,
                scope:
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Variants,
                source:
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Variants,
                spend_limit_id: String
              }
            )
          end
          def to_hash
          end

          module Actor
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserActor,
                  Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaSpendSummary::Actor::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER_ACTOR =
                T.let(
                  :user_actor,
                  Anthropic::Beta::Organization::BetaSpendSummary::Actor::Type::TaggedSymbol
                )
              SCOPED_API_KEY_ACTOR =
                T.let(
                  :scoped_api_key_actor,
                  Anthropic::Beta::Organization::BetaSpendSummary::Actor::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaSpendSummary::Actor::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaSpendSummary::Actor::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Organization::BetaSpendSummary::Actor::Type::OrSymbol,
                deleted: T::Boolean,
                email_address: T.nilable(String),
                name: T.nilable(String),
                user_id: String,
                scoped_api_key_id: String
              ).returns(
                Anthropic::Beta::Organization::BetaSpendSummary::Actor::Variants
              )
            end
            def self.new(
              type:,
              # True only when the underlying account has been deleted.
              deleted: nil,
              # The user's email address. Null when the account is unavailable or has been
              # deleted.
              email_address: nil,
              # The user's current display name. Null when the account is unavailable, has been
              # deleted, or has no name set.
              name: nil,
              # Tagged ID of the user.
              user_id: nil,
              scoped_api_key_id: nil
            )
            end
          end

          module Scope
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserScope,
                  Anthropic::Beta::Organization::BetaSpendLimitSeatTierScope,
                  Anthropic::Beta::Organization::BetaSpendLimitRBACGroupScope,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationServiceScope,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope,
                  Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER =
                T.let(
                  :user,
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type::TaggedSymbol
                )
              SEAT_TIER =
                T.let(
                  :seat_tier,
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type::TaggedSymbol
                )
              RBAC_GROUP =
                T.let(
                  :rbac_group,
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type::TaggedSymbol
                )
              ORGANIZATION_SERVICE =
                T.let(
                  :organization_service,
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type::TaggedSymbol
                )
              ORGANIZATION =
                T.let(
                  :organization,
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type::TaggedSymbol
                )
              WORKSPACE =
                T.let(
                  :workspace,
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Organization::BetaSpendSummary::Scope::Type::OrSymbol,
                user_id: String,
                seat_tier: String,
                rbac_group_id: String,
                service: String,
                workspace_id: String
              ).returns(
                Anthropic::Beta::Organization::BetaSpendSummary::Scope::Variants
              )
            end
            def self.new(
              type:,
              # Tagged ID of the member the spend limit applies to.
              user_id: nil,
              seat_tier: nil,
              rbac_group_id: nil,
              service: nil,
              # Tagged ID of the workspace the spend limit applies to.
              workspace_id: nil
            )
            end
          end

          module Source
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserScope,
                  Anthropic::Beta::Organization::BetaSpendLimitSeatTierScope,
                  Anthropic::Beta::Organization::BetaSpendLimitRBACGroupScope,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationServiceScope,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope,
                  Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaSpendSummary::Source::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER =
                T.let(
                  :user,
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Type::TaggedSymbol
                )
              SEAT_TIER =
                T.let(
                  :seat_tier,
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Type::TaggedSymbol
                )
              RBAC_GROUP =
                T.let(
                  :rbac_group,
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Type::TaggedSymbol
                )
              ORGANIZATION_SERVICE =
                T.let(
                  :organization_service,
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Type::TaggedSymbol
                )
              ORGANIZATION =
                T.let(
                  :organization,
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Type::TaggedSymbol
                )
              WORKSPACE =
                T.let(
                  :workspace,
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaSpendSummary::Source::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Organization::BetaSpendSummary::Source::Type::OrSymbol,
                user_id: String,
                seat_tier: String,
                rbac_group_id: String,
                service: String,
                workspace_id: String
              ).returns(
                Anthropic::Beta::Organization::BetaSpendSummary::Source::Variants
              )
            end
            def self.new(
              type:,
              # Tagged ID of the member the spend limit applies to.
              user_id: nil,
              seat_tier: nil,
              rbac_group_id: nil,
              service: nil,
              # Tagged ID of the workspace the spend limit applies to.
              workspace_id: nil
            )
            end
          end
        end
      end
    end
  end
end
