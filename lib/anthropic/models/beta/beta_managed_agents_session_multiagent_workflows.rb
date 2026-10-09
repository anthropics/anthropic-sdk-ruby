# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether the agent can start workflow runs.
      module BetaManagedAgentsSessionMultiagentWorkflows
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The agent can start workflow runs.
        variant :enabled, -> { Anthropic::Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled }

        # The agent cannot start workflow runs.
        variant :disabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentWorkflows} for more
        # details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentWorkflows::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled] :inline_agents Whether a run's plan can define inline agents, which are not saved.
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent>] :predefined_agents Full `agent` definitions of the predefined agents, which are saved agents that a
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled.new(**args)
          when :disabled
            Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsSessionMultiagentWorkflows = Beta::BetaManagedAgentsSessionMultiagentWorkflows
  end
end
