# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Resolved multiagent orchestration configuration as returned in API responses.
      module BetaManagedAgentsMultiagent
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Resolved coordinator topology with a concrete agent roster.
        variant :coordinator, -> { Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator }

        # Resolved multiagent configuration with three members, each enabled or disabled on its own.
        variant :multiagent_20261001, -> { Anthropic::Beta::BetaManagedAgentsMultiagent20261001 }

        module Type
          extend Anthropic::Internal::Type::Enum

          COORDINATOR = :coordinator
          MULTIAGENT_20261001 = :multiagent_20261001

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsMultiagentCoordinator, Anthropic::Models::Beta::BetaManagedAgentsMultiagent20261001)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsMultiagent} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagent::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentReference, Anthropic::Models::Beta::BetaManagedAgentsAdvisor>] :agents Agents the coordinator may spawn as session threads, each resolved to a specific
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabled] :advisor Whether the session's primary thread can consult an advisor model.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabled] :subagents Whether the agent can spawn session threads.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled] :workflows Whether the agent can start workflow runs.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentCoordinator, Anthropic::Models::Beta::BetaManagedAgentsMultiagent20261001]
        def self.new(type:, **args)
          case type.to_sym
          when :coordinator
            Anthropic::Beta::BetaManagedAgentsMultiagentCoordinator.new(**args)
          when :multiagent_20261001
            Anthropic::Beta::BetaManagedAgentsMultiagent20261001.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsMultiagent = Beta::BetaManagedAgentsMultiagent
  end
end
