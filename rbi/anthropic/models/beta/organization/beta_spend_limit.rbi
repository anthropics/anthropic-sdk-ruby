# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimit < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSpendLimit,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique tagged ID of the spend limit (`spl_...`).
          sig { returns(String) }
          attr_accessor :id

          # Limit amount as a non-negative integer decimal string in the minor unit of
          # `currency` (cents for USD): "50000" is $500.00. `null` means no numeric cap is
          # configured at this scope — see the effective report for whether a limit applies.
          sig { returns(T.nilable(String)) }
          attr_accessor :amount

          # RFC 3339 datetime at which the spend limit was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # ISO 4217 code of the organization's billing currency; the unit for `amount`.
          sig { returns(String) }
          attr_accessor :currency

          # Length of the window the limit resets over. `amount` caps spend within each
          # period.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol
            )
          end
          attr_accessor :period

          # What the limit applies to. A tagged union on `type`; each variant carries the
          # identifier for its scope.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaSpendLimit::Scope::Variants
            )
          end
          attr_accessor :scope

          # Object type. Always `spend_limit`.
          sig { returns(Symbol) }
          attr_accessor :type

          # RFC 3339 datetime at which the spend limit was last modified.
          sig { returns(Time) }
          attr_accessor :updated_at

          # A configured spend limit: a cap on metered spend for one scope and period.
          sig do
            params(
              id: String,
              amount: T.nilable(String),
              created_at: Time,
              currency: String,
              period:
                Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol,
              scope:
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitSeatTierScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitRBACGroupScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationServiceScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope::OrHash
                ),
              updated_at: Time,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique tagged ID of the spend limit (`spl_...`).
            id:,
            # Limit amount as a non-negative integer decimal string in the minor unit of
            # `currency` (cents for USD): "50000" is $500.00. `null` means no numeric cap is
            # configured at this scope — see the effective report for whether a limit applies.
            amount:,
            # RFC 3339 datetime at which the spend limit was created.
            created_at:,
            # ISO 4217 code of the organization's billing currency; the unit for `amount`.
            currency:,
            # Length of the window the limit resets over. `amount` caps spend within each
            # period.
            period:,
            # What the limit applies to. A tagged union on `type`; each variant carries the
            # identifier for its scope.
            scope:,
            # RFC 3339 datetime at which the spend limit was last modified.
            updated_at:,
            # Object type. Always `spend_limit`.
            type: :spend_limit
          )
          end

          sig do
            override.returns(
              {
                id: String,
                amount: T.nilable(String),
                created_at: Time,
                currency: String,
                period:
                  Anthropic::Beta::Organization::BetaSpendLimitPeriod::TaggedSymbol,
                scope:
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Variants,
                type: Symbol,
                updated_at: Time
              }
            )
          end
          def to_hash
          end

          # What the limit applies to. A tagged union on `type`; each variant carries the
          # identifier for its scope.
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
                    Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER =
                T.let(
                  :user,
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type::TaggedSymbol
                )
              SEAT_TIER =
                T.let(
                  :seat_tier,
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type::TaggedSymbol
                )
              RBAC_GROUP =
                T.let(
                  :rbac_group,
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type::TaggedSymbol
                )
              ORGANIZATION_SERVICE =
                T.let(
                  :organization_service,
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type::TaggedSymbol
                )
              ORGANIZATION =
                T.let(
                  :organization,
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type::TaggedSymbol
                )
              WORKSPACE =
                T.let(
                  :workspace,
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Variants
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
                  Anthropic::Beta::Organization::BetaSpendLimit::Scope::Type::OrSymbol,
                user_id: String,
                seat_tier: String,
                rbac_group_id: String,
                service: String,
                workspace_id: String
              ).returns(
                Anthropic::Beta::Organization::BetaSpendLimit::Scope::Variants
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
