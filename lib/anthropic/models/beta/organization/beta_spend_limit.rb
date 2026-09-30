# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::SpendLimits#retrieve
        class BetaSpendLimit < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique tagged ID of the spend limit (`spl_...`).
          #
          #   @return [String]
          required :id, String

          # @!attribute amount
          #   Limit amount as a non-negative integer decimal string in the minor unit of
          #   `currency` (cents for USD): "50000" is $500.00. `null` means no numeric cap is
          #   configured at this scope — see the effective report for whether a limit applies.
          #
          #   @return [String, nil]
          required :amount, String, nil?: true

          # @!attribute created_at
          #   RFC 3339 datetime at which the spend limit was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute currency
          #   ISO 4217 code of the organization's billing currency; the unit for `amount`.
          #
          #   @return [String]
          required :currency, String

          # @!attribute period
          #   Length of the window the limit resets over. `amount` caps spend within each
          #   period.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod]
          required :period, enum: -> { Anthropic::Beta::Organization::BetaSpendLimitPeriod }

          # @!attribute scope
          #   What the limit applies to. A tagged union on `type`; each variant carries the
          #   identifier for its scope.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitSeatTierScope, Anthropic::Models::Beta::Organization::BetaSpendLimitRBACGroupScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationServiceScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope]
          required :scope, union: -> { Anthropic::Beta::Organization::BetaSpendLimit::Scope }

          # @!attribute type
          #   Object type. Always `spend_limit`.
          #
          #   @return [Symbol, :spend_limit]
          required :type, const: :spend_limit

          # @!attribute updated_at
          #   RFC 3339 datetime at which the spend limit was last modified.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!method initialize(id:, amount:, created_at:, currency:, period:, scope:, updated_at:, type: :spend_limit)
          #   A configured spend limit: a cap on metered spend for one scope and period.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaSpendLimit} for more details.
          #
          #   @param id [String] Unique tagged ID of the spend limit (`spl_...`).
          #
          #   @param amount [String, nil] Limit amount as a non-negative integer decimal string in the minor unit of `curr
          #
          #   @param created_at [Time] RFC 3339 datetime at which the spend limit was created.
          #
          #   @param currency [String] ISO 4217 code of the organization's billing currency; the unit for `amount`.
          #
          #   @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod] Length of the window the limit resets over. `amount` caps spend within each peri
          #
          #   @param scope [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitSeatTierScope, Anthropic::Models::Beta::Organization::BetaSpendLimitRBACGroupScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationServiceScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope] What the limit applies to. A tagged union on `type`; each variant carries the id
          #
          #   @param updated_at [Time] RFC 3339 datetime at which the spend limit was last modified.
          #
          #   @param type [Symbol, :spend_limit] Object type. Always `spend_limit`.

          # What the limit applies to. A tagged union on `type`; each variant carries the
          # identifier for its scope.
          #
          # @see Anthropic::Models::Beta::Organization::BetaSpendLimit#scope
          module Scope
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Scope selecting a single member of the organization.
            variant :user, -> { Anthropic::Beta::Organization::BetaSpendLimitUserScope }

            variant :seat_tier, -> { Anthropic::Beta::Organization::BetaSpendLimitSeatTierScope }

            variant :rbac_group, -> { Anthropic::Beta::Organization::BetaSpendLimitRBACGroupScope }

            variant :organization_service,
                    -> { Anthropic::Beta::Organization::BetaSpendLimitOrganizationServiceScope }

            variant :organization, -> { Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope }

            # Scope selecting one workspace of a Claude Console organization.
            variant :workspace, -> { Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope }

            module Type
              extend Anthropic::Internal::Type::Enum

              USER = :user
              SEAT_TIER = :seat_tier
              RBAC_GROUP = :rbac_group
              ORGANIZATION_SERVICE = :organization_service
              ORGANIZATION = :organization
              WORKSPACE = :workspace

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitSeatTierScope, Anthropic::Models::Beta::Organization::BetaSpendLimitRBACGroupScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationServiceScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimit::Scope::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :user_id Tagged ID of the member the spend limit applies to.
            #
            #   @option args [String] :seat_tier
            #
            #   @option args [String] :rbac_group_id
            #
            #   @option args [String] :service
            #
            #   @option args [String] :workspace_id Tagged ID of the workspace the spend limit applies to.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitSeatTierScope, Anthropic::Models::Beta::Organization::BetaSpendLimitRBACGroupScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationServiceScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope]
            def self.new(type:, **args)
              case type.to_sym
              when :user
                Anthropic::Beta::Organization::BetaSpendLimitUserScope.new(**args)
              when :seat_tier
                Anthropic::Beta::Organization::BetaSpendLimitSeatTierScope.new(**args)
              when :rbac_group
                Anthropic::Beta::Organization::BetaSpendLimitRBACGroupScope.new(**args)
              when :organization_service
                Anthropic::Beta::Organization::BetaSpendLimitOrganizationServiceScope.new(**args)
              when :organization
                Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope.new(**args)
              when :workspace
                Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end
    end
  end
end
