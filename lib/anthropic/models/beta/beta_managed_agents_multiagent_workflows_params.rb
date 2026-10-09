# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether the agent can start workflow runs.
      module BetaManagedAgentsMultiagentWorkflowsParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The agent can start workflow runs. Each run follows a plan, a program that the agent writes. A plan can use predefined agents, which are the saved agents in `predefined_agents`, and inline agents, which it defines itself and which are not saved. If `inline_agents` is disabled, `predefined_agents` must name at least one agent.
        variant :enabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams }

        # The agent cannot start workflow runs.
        variant :disabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsParams} for more
        # details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsParams::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams, nil] :inline_agents Whether a run's plan can define inline agents. Defaults to enabled.
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, String>, nil] :predefined_agents Predefined agents that a run's plan can use. At most 20. Defaults to null. Null
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams.new(**args)
          when :disabled
            Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsMultiagentWorkflowsParams = Beta::BetaManagedAgentsMultiagentWorkflowsParams
  end
end
