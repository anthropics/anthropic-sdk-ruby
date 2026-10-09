# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagent20261001Params < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :multiagent_20261001]
        required :type, const: :multiagent_20261001

        # @!attribute advisor
        #   Whether the session's primary thread can consult an advisor model. Defaults to
        #   disabled.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams, nil]
        optional :advisor, union: -> { Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorParams }, nil?: true

        # @!attribute subagents
        #   Whether the agent can spawn session threads. Defaults to enabled.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams, nil]
        optional :subagents,
                 union: -> {
                   Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsParams
                 },
                 nil?: true

        # @!attribute workflows
        #   Whether the agent can start workflow runs. Defaults to enabled.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams, nil]
        optional :workflows,
                 union: -> {
                   Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsParams
                 },
                 nil?: true

        # @!method initialize(advisor: nil, subagents: nil, workflows: nil, type: :multiagent_20261001)
        #   Multiagent configuration with three members, each enabled or disabled on its
        #   own. On an update, if the agent's stored `multiagent` also has type
        #   `multiagent_20261001`, this configuration is merged into the stored one, level
        #   by level, instead of replacing it. A key that the update omits keeps its stored
        #   value. A key sent as null takes its default, on create as well, so
        #   `"workflows": null` enables workflows. An object sent with a `type` other than
        #   the stored one replaces the stored object, and the keys that it omits take their
        #   defaults. A `predefined_agents` list that is sent replaces the stored list.
        #   Every object that is sent needs its `type`, and an enabled `advisor` needs its
        #   `model`. Other validation applies to the merged result.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMultiagent20261001Params} for more
        #   details.
        #
        #   @param advisor [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams, nil] Whether the session's primary thread can consult an advisor model. Defaults to d
        #
        #   @param subagents [Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams, nil] Whether the agent can spawn session threads. Defaults to enabled.
        #
        #   @param workflows [Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabledParams, nil] Whether the agent can start workflow runs. Defaults to enabled.
        #
        #   @param type [Symbol, :multiagent_20261001]
      end
    end

    BetaManagedAgentsMultiagent20261001Params = Beta::BetaManagedAgentsMultiagent20261001Params
  end
end
