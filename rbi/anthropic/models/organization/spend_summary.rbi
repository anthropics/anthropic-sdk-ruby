# typed: strong

module Anthropic
  module Models
    module Organization
      class SpendSummary < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::SpendSummary,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Organization::SpendSummary::Actor::Variants) }
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
        sig { returns(Anthropic::Organization::SpendLimitPeriod::TaggedSymbol) }
        attr_accessor :period

        # The member's spend so far in the current period, as a non-negative decimal
        # string in the minor unit of `currency` (cents for USD). May carry fractional
        # minor units up to three decimal places (e.g. `"12050.5"`) — metered usage is not
        # rounded to whole cents. Reads as `"0"` when the spend reading is temporarily
        # unavailable.
        sig { returns(String) }
        attr_accessor :period_to_date_spend

        sig { returns(Anthropic::Organization::SpendSummary::Scope::Variants) }
        attr_accessor :scope

        sig { returns(Anthropic::Organization::SpendSummary::Source::Variants) }
        attr_accessor :source

        sig { returns(String) }
        attr_accessor :spend_limit_id

        # Per-member effective-limit report row (`GET /spend_limits/effective`).
        sig do
          params(
            actor:
              T.any(
                Anthropic::Organization::SpendLimitUserActor::OrHash,
                Anthropic::Organization::SpendLimitScopedAPIKeyActor::OrHash
              ),
            amount: T.nilable(String),
            currency: String,
            period: Anthropic::Organization::SpendLimitPeriod::OrSymbol,
            period_to_date_spend: String,
            scope:
              T.any(
                Anthropic::Organization::SpendLimitUserScope::OrHash,
                Anthropic::Organization::SpendLimitSeatTierScope::OrHash,
                Anthropic::Organization::SpendLimitRBACGroupScope::OrHash,
                Anthropic::Organization::SpendLimitOrganizationServiceScope::OrHash,
                Anthropic::Organization::SpendLimitOrganizationScope::OrHash,
                Anthropic::Organization::SpendLimitWorkspaceScope::OrHash,
                Anthropic::Organization::SpendLimitUsageTierScope::OrHash
              ),
            source:
              T.any(
                Anthropic::Organization::SpendLimitUserScope::OrHash,
                Anthropic::Organization::SpendLimitSeatTierScope::OrHash,
                Anthropic::Organization::SpendLimitRBACGroupScope::OrHash,
                Anthropic::Organization::SpendLimitOrganizationServiceScope::OrHash,
                Anthropic::Organization::SpendLimitOrganizationScope::OrHash,
                Anthropic::Organization::SpendLimitWorkspaceScope::OrHash,
                Anthropic::Organization::SpendLimitUsageTierScope::OrHash
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
              actor: Anthropic::Organization::SpendSummary::Actor::Variants,
              amount: T.nilable(String),
              currency: String,
              period: Anthropic::Organization::SpendLimitPeriod::TaggedSymbol,
              period_to_date_spend: String,
              scope: Anthropic::Organization::SpendSummary::Scope::Variants,
              source: Anthropic::Organization::SpendSummary::Source::Variants,
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
                Anthropic::Organization::SpendLimitUserActor,
                Anthropic::Organization::SpendLimitScopedAPIKeyActor
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Organization::SpendSummary::Actor::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_ACTOR =
              T.let(
                :user_actor,
                Anthropic::Organization::SpendSummary::Actor::Type::TaggedSymbol
              )
            SCOPED_API_KEY_ACTOR =
              T.let(
                :scoped_api_key_actor,
                Anthropic::Organization::SpendSummary::Actor::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::SpendSummary::Actor::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Organization::SpendSummary::Actor::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Organization::SpendSummary::Actor::Type::OrSymbol,
              deleted: T::Boolean,
              email_address: T.nilable(String),
              name: T.nilable(String),
              user_id: String,
              scoped_api_key_id: String
            ).returns(Anthropic::Organization::SpendSummary::Actor::Variants)
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
                Anthropic::Organization::SpendLimitUserScope,
                Anthropic::Organization::SpendLimitSeatTierScope,
                Anthropic::Organization::SpendLimitRBACGroupScope,
                Anthropic::Organization::SpendLimitOrganizationServiceScope,
                Anthropic::Organization::SpendLimitOrganizationScope,
                Anthropic::Organization::SpendLimitWorkspaceScope,
                Anthropic::Organization::SpendLimitUsageTierScope
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Organization::SpendSummary::Scope::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER =
              T.let(
                :user,
                Anthropic::Organization::SpendSummary::Scope::Type::TaggedSymbol
              )
            SEAT_TIER =
              T.let(
                :seat_tier,
                Anthropic::Organization::SpendSummary::Scope::Type::TaggedSymbol
              )
            RBAC_GROUP =
              T.let(
                :rbac_group,
                Anthropic::Organization::SpendSummary::Scope::Type::TaggedSymbol
              )
            ORGANIZATION_SERVICE =
              T.let(
                :organization_service,
                Anthropic::Organization::SpendSummary::Scope::Type::TaggedSymbol
              )
            ORGANIZATION =
              T.let(
                :organization,
                Anthropic::Organization::SpendSummary::Scope::Type::TaggedSymbol
              )
            WORKSPACE =
              T.let(
                :workspace,
                Anthropic::Organization::SpendSummary::Scope::Type::TaggedSymbol
              )
            USAGE_TIER =
              T.let(
                :usage_tier,
                Anthropic::Organization::SpendSummary::Scope::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::SpendSummary::Scope::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Organization::SpendSummary::Scope::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Organization::SpendSummary::Scope::Type::OrSymbol,
              user_id: String,
              seat_tier: String,
              rbac_group_id: String,
              service: String,
              workspace_id: String
            ).returns(Anthropic::Organization::SpendSummary::Scope::Variants)
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
                Anthropic::Organization::SpendLimitUserScope,
                Anthropic::Organization::SpendLimitSeatTierScope,
                Anthropic::Organization::SpendLimitRBACGroupScope,
                Anthropic::Organization::SpendLimitOrganizationServiceScope,
                Anthropic::Organization::SpendLimitOrganizationScope,
                Anthropic::Organization::SpendLimitWorkspaceScope,
                Anthropic::Organization::SpendLimitUsageTierScope
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Organization::SpendSummary::Source::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER =
              T.let(
                :user,
                Anthropic::Organization::SpendSummary::Source::Type::TaggedSymbol
              )
            SEAT_TIER =
              T.let(
                :seat_tier,
                Anthropic::Organization::SpendSummary::Source::Type::TaggedSymbol
              )
            RBAC_GROUP =
              T.let(
                :rbac_group,
                Anthropic::Organization::SpendSummary::Source::Type::TaggedSymbol
              )
            ORGANIZATION_SERVICE =
              T.let(
                :organization_service,
                Anthropic::Organization::SpendSummary::Source::Type::TaggedSymbol
              )
            ORGANIZATION =
              T.let(
                :organization,
                Anthropic::Organization::SpendSummary::Source::Type::TaggedSymbol
              )
            WORKSPACE =
              T.let(
                :workspace,
                Anthropic::Organization::SpendSummary::Source::Type::TaggedSymbol
              )
            USAGE_TIER =
              T.let(
                :usage_tier,
                Anthropic::Organization::SpendSummary::Source::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::SpendSummary::Source::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Organization::SpendSummary::Source::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Organization::SpendSummary::Source::Type::OrSymbol,
              user_id: String,
              seat_tier: String,
              rbac_group_id: String,
              service: String,
              workspace_id: String
            ).returns(Anthropic::Organization::SpendSummary::Source::Variants)
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
