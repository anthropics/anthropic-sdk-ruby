# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentSubagentsEnabledParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :enabled]
        required :type, const: :enabled

        # @!attribute inline_agents
        #   Whether the agent can define inline agents when it spawns session threads.
        #   Defaults to enabled.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams, nil]
        optional :inline_agents,
                 union: -> { Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsParams },
                 nil?: true

        # @!attribute predefined_agents
        #   Predefined agents that this agent can spawn as session threads. At most 20.
        #   Defaults to null. Null and an empty list both mean no predefined agents. This
        #   list is separate from `workflows.predefined_agents`, and an agent in one list is
        #   not added to the other.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, String>, nil]
        optional :predefined_agents,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsMultiagentPredefinedAgentParams]
                 },
                 nil?: true

        # @!method initialize(inline_agents: nil, predefined_agents: nil, type: :enabled)
        #   The agent can spawn session threads. Each thread runs a predefined agent, which
        #   is a saved agent in `predefined_agents`, or an inline agent, which the agent
        #   defines when it spawns the thread and which is not saved. If `inline_agents` is
        #   disabled, `predefined_agents` must name at least one agent.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams} for
        #   more details.
        #
        #   @param inline_agents [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams, nil] Whether the agent can define inline agents when it spawns session threads. Defau
        #
        #   @param predefined_agents [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, String>, nil] Predefined agents that this agent can spawn as session threads. At most 20. Defa
        #
        #   @param type [Symbol, :enabled]
      end
    end

    BetaManagedAgentsMultiagentSubagentsEnabledParams =
      Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams
  end
end
