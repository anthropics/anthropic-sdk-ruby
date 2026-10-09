# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagent20261001 < Anthropic::Internal::Type::BaseModel
        # @!attribute advisor
        #   Whether the session's primary thread can consult an advisor model.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabled]
        required :advisor, union: -> { Anthropic::Beta::BetaManagedAgentsMultiagentAdvisor }

        # @!attribute subagents
        #   Whether the agent can spawn session threads.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabled]
        required :subagents, union: -> { Anthropic::Beta::BetaManagedAgentsMultiagentSubagents }

        # @!attribute type
        #
        #   @return [Symbol, :multiagent_20261001]
        required :type, const: :multiagent_20261001

        # @!attribute workflows
        #   Whether the agent can start workflow runs.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled]
        required :workflows, union: -> { Anthropic::Beta::BetaManagedAgentsMultiagentWorkflows }

        # @!method initialize(advisor:, subagents:, workflows:, type: :multiagent_20261001)
        #   Resolved multiagent configuration with three members, each enabled or disabled
        #   on its own.
        #
        #   @param advisor [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabled] Whether the session's primary thread can consult an advisor model.
        #
        #   @param subagents [Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabled] Whether the agent can spawn session threads.
        #
        #   @param workflows [Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled] Whether the agent can start workflow runs.
        #
        #   @param type [Symbol, :multiagent_20261001]
      end
    end

    BetaManagedAgentsMultiagent20261001 = Beta::BetaManagedAgentsMultiagent20261001
  end
end
