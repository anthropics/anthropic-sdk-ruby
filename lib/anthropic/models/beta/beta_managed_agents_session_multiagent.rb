# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Resolved multiagent orchestration configuration as returned on a `session`.
      module BetaManagedAgentsSessionMultiagent
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Resolved coordinator topology with full agent definitions for each roster member.
        variant :coordinator, -> { Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator }

        # Resolved multiagent configuration with three members, as copied to the `session` at creation.
        variant :multiagent_20261001, -> { Anthropic::Beta::BetaManagedAgentsSessionMultiagent20261001 }

        module Type
          extend Anthropic::Internal::Type::Enum

          COORDINATOR = :coordinator
          MULTIAGENT_20261001 = :multiagent_20261001

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagent20261001)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagent::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor>] :agents Full `agent` definitions the coordinator may spawn as session threads.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabled] :advisor Whether the session's primary thread can consult an advisor model.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabled] :subagents Whether the agent can spawn session threads.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled] :workflows Whether the agent can start workflow runs.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentCoordinator, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagent20261001]
        def self.new(type:, **args)
          case type.to_sym
          when :coordinator
            Anthropic::Beta::BetaManagedAgentsSessionMultiagentCoordinator.new(**args)
          when :multiagent_20261001
            Anthropic::Beta::BetaManagedAgentsSessionMultiagent20261001.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsSessionMultiagent = Beta::BetaManagedAgentsSessionMultiagent
  end
end
