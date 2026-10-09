# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionMultiagentSubagentsEnabled < Anthropic::Internal::Type::BaseModel
        # @!attribute inline_agents
        #   Whether the agent can define inline agents, which are not saved, when it spawns
        #   session threads.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled]
        required :inline_agents, union: -> { Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgents }

        # @!attribute predefined_agents
        #   Full `agent` definitions of the predefined agents, which are saved agents that
        #   this agent can spawn as session threads.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent>]
        required :predefined_agents,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsSessionThreadAgent] }

        # @!attribute type
        #
        #   @return [Symbol, :enabled]
        required :type, const: :enabled

        # @!method initialize(inline_agents:, predefined_agents:, type: :enabled)
        #   The agent can spawn session threads.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled}
        #   for more details.
        #
        #   @param inline_agents [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled] Whether the agent can define inline agents, which are not saved, when it spawns
        #
        #   @param predefined_agents [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent>] Full `agent` definitions of the predefined agents, which are saved agents that t
        #
        #   @param type [Symbol, :enabled]
      end
    end

    BetaManagedAgentsSessionMultiagentSubagentsEnabled =
      Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled
  end
end
