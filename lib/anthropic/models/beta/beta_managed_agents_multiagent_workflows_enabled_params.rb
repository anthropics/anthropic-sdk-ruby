# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentWorkflowsEnabledParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :enabled]
        required :type, const: :enabled

        # @!attribute inline_agents
        #   Whether a run's plan can define inline agents. Defaults to enabled.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams, nil]
        optional :inline_agents,
                 union: -> { Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams },
                 nil?: true

        # @!attribute predefined_agents
        #   Predefined agents that a run's plan can use. At most 20. Defaults to null. Null
        #   and an empty list both mean no predefined agents. This list is separate from
        #   `subagents.predefined_agents`, and an agent in one list is not added to the
        #   other.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, String>, nil]
        optional :predefined_agents,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsMultiagentPredefinedAgentParams]
                 },
                 nil?: true

        # @!method initialize(inline_agents: nil, predefined_agents: nil, type: :enabled)
        #   The agent can start workflow runs. Each run follows a plan, a program that the
        #   agent writes. A plan can use predefined agents, which are the saved agents in
        #   `predefined_agents`, and inline agents, which it defines itself and which are
        #   not saved. If `inline_agents` is disabled, `predefined_agents` must name at
        #   least one agent.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams} for
        #   more details.
        #
        #   @param inline_agents [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams, nil] Whether a run's plan can define inline agents. Defaults to enabled.
        #
        #   @param predefined_agents [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, String>, nil] Predefined agents that a run's plan can use. At most 20. Defaults to null. Null
        #
        #   @param type [Symbol, :enabled]
      end
    end

    BetaManagedAgentsMultiagentWorkflowsEnabledParams =
      Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams
  end
end
