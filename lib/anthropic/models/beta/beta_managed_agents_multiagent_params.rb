# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Multiagent orchestration configuration.
      module BetaManagedAgentsMultiagentParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # A coordinator topology: the session's primary thread orchestrates work by spawning session threads, each running an agent drawn from the `agents` roster.
        variant :coordinator, -> { Anthropic::Beta::BetaManagedAgentsMultiagentCoordinatorParams }

        # Multiagent configuration with three members, each enabled or disabled on its own. On an update, if the agent's stored `multiagent` also has type `multiagent_20261001`, this configuration is merged into the stored one, level by level, instead of replacing it. A key that the update omits keeps its stored value. A key sent as null takes its default, on create as well, so `"workflows": null` enables workflows. An object sent with a `type` other than the stored one replaces the stored object, and the keys that it omits take their defaults. A `predefined_agents` list that is sent replaces the stored list. Every object that is sent needs its `type`, and an enabled `advisor` needs its `model`. Other validation applies to the merged result.
        variant :multiagent_20261001, -> { Anthropic::Beta::BetaManagedAgentsMultiagent20261001Params }

        module Type
          extend Anthropic::Internal::Type::Enum

          COORDINATOR = :coordinator
          MULTIAGENT_20261001 = :multiagent_20261001

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsMultiagentCoordinatorParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagent20261001Params)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentParams::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, Anthropic::Models::Beta::BetaManagedAgentsAdvisorParams, String>] :agents Agents the coordinator may spawn as session threads. 1–20 entries. Each entry is
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams, nil] :advisor Whether the session's primary thread can consult an advisor model. Defaults to d
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams, nil] :subagents Whether the agent can spawn session threads. Defaults to enabled.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams, nil] :workflows Whether the agent can start workflow runs. Defaults to enabled.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentCoordinatorParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagent20261001Params]
        def self.new(type:, **args)
          case type.to_sym
          when :coordinator
            Anthropic::Beta::BetaManagedAgentsMultiagentCoordinatorParams.new(**args)
          when :multiagent_20261001
            Anthropic::Beta::BetaManagedAgentsMultiagent20261001Params.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsMultiagentParams = Beta::BetaManagedAgentsMultiagentParams
  end
end
