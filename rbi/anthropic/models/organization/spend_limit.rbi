# typed: strong

module Anthropic
  module Models
    module Organization
      class SpendLimit < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::SpendLimit,
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

        # Read-only. `false` when extra usage is switched off for this organization
        # (`organization` limit); `amount` is kept and applies again when it's switched
        # back on. Always `true` for other limits.
        sig { returns(T::Boolean) }
        attr_accessor :is_enabled

        # Length of the window the limit resets over. `amount` caps spend within each
        # period.
        sig { returns(Anthropic::Organization::SpendLimitPeriod::TaggedSymbol) }
        attr_accessor :period

        # What the limit applies to. A tagged union on `type`; each variant carries the
        # identifier for its scope.
        sig { returns(Anthropic::Organization::SpendLimit::Scope::Variants) }
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
            is_enabled: T::Boolean,
            period: Anthropic::Organization::SpendLimitPeriod::OrSymbol,
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
          # Read-only. `false` when extra usage is switched off for this organization
          # (`organization` limit); `amount` is kept and applies again when it's switched
          # back on. Always `true` for other limits.
          is_enabled:,
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
              is_enabled: T::Boolean,
              period: Anthropic::Organization::SpendLimitPeriod::TaggedSymbol,
              scope: Anthropic::Organization::SpendLimit::Scope::Variants,
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
                T.all(Symbol, Anthropic::Organization::SpendLimit::Scope::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER =
              T.let(
                :user,
                Anthropic::Organization::SpendLimit::Scope::Type::TaggedSymbol
              )
            SEAT_TIER =
              T.let(
                :seat_tier,
                Anthropic::Organization::SpendLimit::Scope::Type::TaggedSymbol
              )
            RBAC_GROUP =
              T.let(
                :rbac_group,
                Anthropic::Organization::SpendLimit::Scope::Type::TaggedSymbol
              )
            ORGANIZATION_SERVICE =
              T.let(
                :organization_service,
                Anthropic::Organization::SpendLimit::Scope::Type::TaggedSymbol
              )
            ORGANIZATION =
              T.let(
                :organization,
                Anthropic::Organization::SpendLimit::Scope::Type::TaggedSymbol
              )
            WORKSPACE =
              T.let(
                :workspace,
                Anthropic::Organization::SpendLimit::Scope::Type::TaggedSymbol
              )
            USAGE_TIER =
              T.let(
                :usage_tier,
                Anthropic::Organization::SpendLimit::Scope::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::SpendLimit::Scope::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Organization::SpendLimit::Scope::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: Anthropic::Organization::SpendLimit::Scope::Type::OrSymbol,
              user_id: String,
              seat_tier: String,
              rbac_group_id: String,
              service: String,
              workspace_id: String
            ).returns(Anthropic::Organization::SpendLimit::Scope::Variants)
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
