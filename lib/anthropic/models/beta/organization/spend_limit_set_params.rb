# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::SpendLimits#set
        class SpendLimitSetParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute amount
          #   Limit amount as a non-negative integer decimal string in the minor unit of the
          #   organization's billing currency (cents for USD): "50000" is $500.00. `null` sets
          #   an explicit no-limit override for this scope and `period` only — each period
          #   resolves independently, so caps for other periods still apply.
          #
          #   @return [String, nil]
          required :amount, String, nil?: true

          # @!attribute scope
          #   What the limit applies to. Claude Enterprise organizations set `user` limits.
          #   Claude Console organizations set `organization` and `workspace` limits. Any
          #   other combination returns 400. Setting `organization` and `workspace` limits
          #   through the API is in an early access preview. To request access, contact your
          #   Anthropic account team.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope]
          required :scope, union: -> { Anthropic::Beta::Organization::SpendLimitSetParams::Scope }

          # @!attribute period
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod, nil]
          optional :period, enum: -> { Anthropic::Beta::Organization::BetaSpendLimitPeriod }

          # @!method initialize(amount:, scope:, period: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::SpendLimitSetParams} for more details.
          #
          #   @param amount [String, nil] Limit amount as a non-negative integer decimal string in the minor unit of the o
          #
          #   @param scope [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope] What the limit applies to. Claude Enterprise organizations set `user` limits. Cl
          #
          #   @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod]
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # What the limit applies to. Claude Enterprise organizations set `user` limits.
          # Claude Console organizations set `organization` and `workspace` limits. Any
          # other combination returns 400. Setting `organization` and `workspace` limits
          # through the API is in an early access preview. To request access, contact your
          # Anthropic account team.
          module Scope
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Scope selecting a single member of the organization.
            variant :user, -> { Anthropic::Beta::Organization::BetaSpendLimitUserScope }

            variant :organization, -> { Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope }

            # Scope selecting one workspace of a Claude Console organization.
            variant :workspace, -> { Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope }

            module Type
              extend Anthropic::Internal::Type::Enum

              USER = :user
              ORGANIZATION = :organization
              WORKSPACE = :workspace

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::SpendLimitSetParams::Scope::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :user_id Tagged ID of the member the spend limit applies to.
            #
            #   @option args [String] :workspace_id Tagged ID of the workspace the spend limit applies to.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope]
            def self.new(type:, **args)
              case type.to_sym
              when :user
                Anthropic::Beta::Organization::BetaSpendLimitUserScope.new(**args)
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
