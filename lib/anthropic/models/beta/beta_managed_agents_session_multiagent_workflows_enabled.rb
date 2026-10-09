# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionMultiagentWorkflowsEnabled < Anthropic::Internal::Type::BaseModel
        # @!attribute inline_agents
        #   Whether a run's plan can define inline agents, which are not saved.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled]
        required :inline_agents, union: -> { Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgents }

        # @!attribute predefined_agents
        #   Full `agent` definitions of the predefined agents, which are saved agents that a
        #   run's plan can use.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent>]
        required :predefined_agents,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsSessionThreadAgent] }

        # @!attribute type
        #
        #   @return [Symbol, :enabled]
        required :type, const: :enabled

        # @!method initialize(inline_agents:, predefined_agents:, type: :enabled)
        #   The agent can start workflow runs.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled}
        #   for more details.
        #
        #   @param inline_agents [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled] Whether a run's plan can define inline agents, which are not saved.
        #
        #   @param predefined_agents [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent>] Full `agent` definitions of the predefined agents, which are saved agents that a
        #
        #   @param type [Symbol, :enabled]
      end
    end

    BetaManagedAgentsSessionMultiagentWorkflowsEnabled =
      Beta::BetaManagedAgentsSessionMultiagentWorkflowsEnabled
  end
end
