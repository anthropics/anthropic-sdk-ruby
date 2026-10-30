# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class SpendSummary < Anthropic::Internal::Type::BaseModel
        # @!attribute actor
        #
        #   @return [Anthropic::Models::Organization::SpendLimitUserActor, Anthropic::Models::Organization::SpendLimitScopedAPIKeyActor]
        required :actor, union: -> { Anthropic::Organization::SpendSummary::Actor }

        # @!attribute amount
        #   Effective limit amount as a non-negative integer decimal string in the minor
        #   unit of `currency` (cents for USD). `null` means no limit applies for this row's
        #   `period` — each period resolves independently, so another period may still cap
        #   this member.
        #
        #   @return [String, nil]
        required :amount, String, nil?: true

        # @!attribute currency
        #   ISO 4217 code of the organization's billing currency; the unit for `amount` and
        #   `period_to_date_spend`.
        #
        #   @return [String]
        required :currency, String

        # @!attribute period
        #   Period this row's effective limit and spend are reported for.
        #
        #   @return [Symbol, Anthropic::Models::Organization::SpendLimitPeriod]
        required :period, enum: -> { Anthropic::Organization::SpendLimitPeriod }

        # @!attribute period_to_date_spend
        #   The member's spend so far in the current period, as a non-negative decimal
        #   string in the minor unit of `currency` (cents for USD). May carry fractional
        #   minor units up to three decimal places (e.g. `"12050.5"`) — metered usage is not
        #   rounded to whole cents. Reads as `"0"` when the spend reading is temporarily
        #   unavailable.
        #
        #   @return [String]
        required :period_to_date_spend, String

        # @!attribute scope
        #
        #   @return [Anthropic::Models::Organization::SpendLimitUserScope, Anthropic::Models::Organization::SpendLimitSeatTierScope, Anthropic::Models::Organization::SpendLimitRBACGroupScope, Anthropic::Models::Organization::SpendLimitOrganizationServiceScope, Anthropic::Models::Organization::SpendLimitOrganizationScope, Anthropic::Models::Organization::SpendLimitWorkspaceScope, Anthropic::Models::Organization::SpendLimitUsageTierScope]
        required :scope, union: -> { Anthropic::Organization::SpendSummary::Scope }

        # @!attribute source
        #
        #   @return [Anthropic::Models::Organization::SpendLimitUserScope, Anthropic::Models::Organization::SpendLimitSeatTierScope, Anthropic::Models::Organization::SpendLimitRBACGroupScope, Anthropic::Models::Organization::SpendLimitOrganizationServiceScope, Anthropic::Models::Organization::SpendLimitOrganizationScope, Anthropic::Models::Organization::SpendLimitWorkspaceScope, Anthropic::Models::Organization::SpendLimitUsageTierScope]
        required :source, union: -> { Anthropic::Organization::SpendSummary::Source }

        # @!attribute spend_limit_id
        #
        #   @return [String]
        required :spend_limit_id, String

        # @!method initialize(actor:, amount:, currency:, period:, period_to_date_spend:, scope:, source:, spend_limit_id:)
        #   Per-member effective-limit report row (`GET /spend_limits/effective`).
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::SpendSummary} for more details.
        #
        #   @param actor [Anthropic::Models::Organization::SpendLimitUserActor, Anthropic::Models::Organization::SpendLimitScopedAPIKeyActor]
        #
        #   @param amount [String, nil] Effective limit amount as a non-negative integer decimal string in the minor uni
        #
        #   @param currency [String] ISO 4217 code of the organization's billing currency; the unit for `amount` and
        #
        #   @param period [Symbol, Anthropic::Models::Organization::SpendLimitPeriod] Period this row's effective limit and spend are reported for.
        #
        #   @param period_to_date_spend [String] The member's spend so far in the current period, as a non-negative decimal strin
        #
        #   @param scope [Anthropic::Models::Organization::SpendLimitUserScope, Anthropic::Models::Organization::SpendLimitSeatTierScope, Anthropic::Models::Organization::SpendLimitRBACGroupScope, Anthropic::Models::Organization::SpendLimitOrganizationServiceScope, Anthropic::Models::Organization::SpendLimitOrganizationScope, Anthropic::Models::Organization::SpendLimitWorkspaceScope, Anthropic::Models::Organization::SpendLimitUsageTierScope]
        #
        #   @param source [Anthropic::Models::Organization::SpendLimitUserScope, Anthropic::Models::Organization::SpendLimitSeatTierScope, Anthropic::Models::Organization::SpendLimitRBACGroupScope, Anthropic::Models::Organization::SpendLimitOrganizationServiceScope, Anthropic::Models::Organization::SpendLimitOrganizationScope, Anthropic::Models::Organization::SpendLimitWorkspaceScope, Anthropic::Models::Organization::SpendLimitUsageTierScope]
        #
        #   @param spend_limit_id [String]

        # @see Anthropic::Models::Organization::SpendSummary#actor
        module Actor
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # A user within the organization. `name` and `email_address` are
          # null when the underlying account is unavailable or has been deleted;
          # `deleted` is true only for deleted accounts.
          variant :user_actor, -> { Anthropic::Organization::SpendLimitUserActor }

          # A scoped Admin API key acting on behalf of the organization.
          variant :scoped_api_key_actor, -> { Anthropic::Organization::SpendLimitScopedAPIKeyActor }

          module Type
            extend Anthropic::Internal::Type::Enum

            USER_ACTOR = :user_actor
            SCOPED_API_KEY_ACTOR = :scoped_api_key_actor

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Organization::SpendLimitUserActor, Anthropic::Models::Organization::SpendLimitScopedAPIKeyActor)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::SpendSummary::Actor} for more details.
          #
          # @param type [Symbol, Anthropic::Models::Organization::SpendSummary::Actor::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Boolean] :deleted True only when the underlying account has been deleted.
          #
          #   @option args [String, nil] :email_address The user's email address. Null when the account is unavailable or has been delet
          #
          #   @option args [String, nil] :name The user's current display name. Null when the account is unavailable, has been
          #
          #   @option args [String] :user_id Tagged ID of the user.
          #
          #   @option args [String] :scoped_api_key_id
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Organization::SpendLimitUserActor, Anthropic::Models::Organization::SpendLimitScopedAPIKeyActor]
          def self.new(type:, **args)
            case type.to_sym
            when :user_actor
              Anthropic::Organization::SpendLimitUserActor.new(**args)
            when :scoped_api_key_actor
              Anthropic::Organization::SpendLimitScopedAPIKeyActor.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # @see Anthropic::Models::Organization::SpendSummary#scope
        module Scope
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Scope selecting a single member of the organization.
          variant :user, -> { Anthropic::Organization::SpendLimitUserScope }

          variant :seat_tier, -> { Anthropic::Organization::SpendLimitSeatTierScope }

          variant :rbac_group, -> { Anthropic::Organization::SpendLimitRBACGroupScope }

          variant :organization_service, -> { Anthropic::Organization::SpendLimitOrganizationServiceScope }

          variant :organization, -> { Anthropic::Organization::SpendLimitOrganizationScope }

          # Scope selecting one workspace of a Claude Console organization.
          variant :workspace, -> { Anthropic::Organization::SpendLimitWorkspaceScope }

          # Scope of the monthly spend cap Anthropic sets for a Claude Console
          # organization from its usage tier, or a higher cap Anthropic granted the
          # organization. Read-only; its `created_at` and `updated_at` are the
          # organization's creation time, so `amount` can change while `updated_at` stays
          # the same.
          variant :usage_tier, -> { Anthropic::Organization::SpendLimitUsageTierScope }

          module Type
            extend Anthropic::Internal::Type::Enum

            USER = :user
            SEAT_TIER = :seat_tier
            RBAC_GROUP = :rbac_group
            ORGANIZATION_SERVICE = :organization_service
            ORGANIZATION = :organization
            WORKSPACE = :workspace
            USAGE_TIER = :usage_tier

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Organization::SpendLimitUserScope, Anthropic::Models::Organization::SpendLimitSeatTierScope, Anthropic::Models::Organization::SpendLimitRBACGroupScope, Anthropic::Models::Organization::SpendLimitOrganizationServiceScope, Anthropic::Models::Organization::SpendLimitOrganizationScope, Anthropic::Models::Organization::SpendLimitWorkspaceScope, Anthropic::Models::Organization::SpendLimitUsageTierScope)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Organization::SpendSummary::Scope::Type, String]
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
          # @return [Anthropic::Models::Organization::SpendLimitUserScope, Anthropic::Models::Organization::SpendLimitSeatTierScope, Anthropic::Models::Organization::SpendLimitRBACGroupScope, Anthropic::Models::Organization::SpendLimitOrganizationServiceScope, Anthropic::Models::Organization::SpendLimitOrganizationScope, Anthropic::Models::Organization::SpendLimitWorkspaceScope, Anthropic::Models::Organization::SpendLimitUsageTierScope]
          def self.new(type:, **args)
            case type.to_sym
            when :user
              Anthropic::Organization::SpendLimitUserScope.new(**args)
            when :seat_tier
              Anthropic::Organization::SpendLimitSeatTierScope.new(**args)
            when :rbac_group
              Anthropic::Organization::SpendLimitRBACGroupScope.new(**args)
            when :organization_service
              Anthropic::Organization::SpendLimitOrganizationServiceScope.new(**args)
            when :organization
              Anthropic::Organization::SpendLimitOrganizationScope.new(**args)
            when :workspace
              Anthropic::Organization::SpendLimitWorkspaceScope.new(**args)
            when :usage_tier
              Anthropic::Organization::SpendLimitUsageTierScope.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # @see Anthropic::Models::Organization::SpendSummary#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Scope selecting a single member of the organization.
          variant :user, -> { Anthropic::Organization::SpendLimitUserScope }

          variant :seat_tier, -> { Anthropic::Organization::SpendLimitSeatTierScope }

          variant :rbac_group, -> { Anthropic::Organization::SpendLimitRBACGroupScope }

          variant :organization_service, -> { Anthropic::Organization::SpendLimitOrganizationServiceScope }

          variant :organization, -> { Anthropic::Organization::SpendLimitOrganizationScope }

          # Scope selecting one workspace of a Claude Console organization.
          variant :workspace, -> { Anthropic::Organization::SpendLimitWorkspaceScope }

          # Scope of the monthly spend cap Anthropic sets for a Claude Console
          # organization from its usage tier, or a higher cap Anthropic granted the
          # organization. Read-only; its `created_at` and `updated_at` are the
          # organization's creation time, so `amount` can change while `updated_at` stays
          # the same.
          variant :usage_tier, -> { Anthropic::Organization::SpendLimitUsageTierScope }

          module Type
            extend Anthropic::Internal::Type::Enum

            USER = :user
            SEAT_TIER = :seat_tier
            RBAC_GROUP = :rbac_group
            ORGANIZATION_SERVICE = :organization_service
            ORGANIZATION = :organization
            WORKSPACE = :workspace
            USAGE_TIER = :usage_tier

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Organization::SpendLimitUserScope, Anthropic::Models::Organization::SpendLimitSeatTierScope, Anthropic::Models::Organization::SpendLimitRBACGroupScope, Anthropic::Models::Organization::SpendLimitOrganizationServiceScope, Anthropic::Models::Organization::SpendLimitOrganizationScope, Anthropic::Models::Organization::SpendLimitWorkspaceScope, Anthropic::Models::Organization::SpendLimitUsageTierScope)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Organization::SpendSummary::Source::Type, String]
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
          # @return [Anthropic::Models::Organization::SpendLimitUserScope, Anthropic::Models::Organization::SpendLimitSeatTierScope, Anthropic::Models::Organization::SpendLimitRBACGroupScope, Anthropic::Models::Organization::SpendLimitOrganizationServiceScope, Anthropic::Models::Organization::SpendLimitOrganizationScope, Anthropic::Models::Organization::SpendLimitWorkspaceScope, Anthropic::Models::Organization::SpendLimitUsageTierScope]
          def self.new(type:, **args)
            case type.to_sym
            when :user
              Anthropic::Organization::SpendLimitUserScope.new(**args)
            when :seat_tier
              Anthropic::Organization::SpendLimitSeatTierScope.new(**args)
            when :rbac_group
              Anthropic::Organization::SpendLimitRBACGroupScope.new(**args)
            when :organization_service
              Anthropic::Organization::SpendLimitOrganizationServiceScope.new(**args)
            when :organization
              Anthropic::Organization::SpendLimitOrganizationScope.new(**args)
            when :workspace
              Anthropic::Organization::SpendLimitWorkspaceScope.new(**args)
            when :usage_tier
              Anthropic::Organization::SpendLimitUsageTierScope.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
