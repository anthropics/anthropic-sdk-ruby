# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendSummary < Anthropic::Internal::Type::BaseModel
          # @!attribute actor
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor]
          required :actor, union: -> { Anthropic::Beta::Organization::BetaSpendSummary::Actor }

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
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod]
          required :period, enum: -> { Anthropic::Beta::Organization::BetaSpendLimitPeriod }

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
          #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitSeatTierScope, Anthropic::Models::Beta::Organization::BetaSpendLimitRBACGroupScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationServiceScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope]
          required :scope, union: -> { Anthropic::Beta::Organization::BetaSpendSummary::Scope }

          # @!attribute source
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitSeatTierScope, Anthropic::Models::Beta::Organization::BetaSpendLimitRBACGroupScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationServiceScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope]
          required :source, union: -> { Anthropic::Beta::Organization::BetaSpendSummary::Source }

          # @!attribute spend_limit_id
          #
          #   @return [String]
          required :spend_limit_id, String

          # @!method initialize(actor:, amount:, currency:, period:, period_to_date_spend:, scope:, source:, spend_limit_id:)
          #   Per-member effective-limit report row (`GET /spend_limits/effective`).
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaSpendSummary} for more details.
          #
          #   @param actor [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor]
          #
          #   @param amount [String, nil] Effective limit amount as a non-negative integer decimal string in the minor uni
          #
          #   @param currency [String] ISO 4217 code of the organization's billing currency; the unit for `amount` and
          #
          #   @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod] Period this row's effective limit and spend are reported for.
          #
          #   @param period_to_date_spend [String] The member's spend so far in the current period, as a non-negative decimal strin
          #
          #   @param scope [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitSeatTierScope, Anthropic::Models::Beta::Organization::BetaSpendLimitRBACGroupScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationServiceScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope]
          #
          #   @param source [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitSeatTierScope, Anthropic::Models::Beta::Organization::BetaSpendLimitRBACGroupScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationServiceScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope]
          #
          #   @param spend_limit_id [String]

          # @see Anthropic::Models::Beta::Organization::BetaSpendSummary#actor
          module Actor
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # A user within the organization. `name` and `email_address` are
            # null when the underlying account is unavailable or has been deleted;
            # `deleted` is true only for deleted accounts.
            variant :user_actor, -> { Anthropic::Beta::Organization::BetaSpendLimitUserActor }

            # A scoped Admin API key acting on behalf of the organization.
            variant :scoped_api_key_actor, -> { Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor }

            module Type
              extend Anthropic::Internal::Type::Enum

              USER_ACTOR = :user_actor
              SCOPED_API_KEY_ACTOR = :scoped_api_key_actor

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::BetaSpendSummary::Actor} for more
            # details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaSpendSummary::Actor::Type, String]
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
            # @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor]
            def self.new(type:, **args)
              case type.to_sym
              when :user_actor
                Anthropic::Beta::Organization::BetaSpendLimitUserActor.new(**args)
              when :scoped_api_key_actor
                Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # @see Anthropic::Models::Beta::Organization::BetaSpendSummary#scope
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
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaSpendSummary::Scope::Type, String]
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

          # @see Anthropic::Models::Beta::Organization::BetaSpendSummary#source
          module Source
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
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaSpendSummary::Source::Type, String]
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
