# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # An entry in a multiagent roster: an agent ID string, a versioned agent
      # reference, or `self`.
      module BetaManagedAgentsMultiagentRosterEntryParams
        extend Anthropic::Internal::Type::Union

        variant String

        # Specification for an Agent. Provide a specific `version` or use the short-form `agent="agent_id"` for the most recent version
        variant -> { Anthropic::Beta::BetaManagedAgentsAgentParams }

        # Sentinel roster entry meaning "the agent that owns this configuration". Resolved server-side to a concrete agent reference.
        variant -> { Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams }

        # Platform advisor roster entry: a model the session's primary thread may consult mid-turn. At most one per roster; the entry occupies the roster name `anthropic.advisor`.
        variant -> { Anthropic::Beta::BetaManagedAgentsAdvisorParams }

        # @!method self.variants
        #   @return [Array(String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, Anthropic::Models::Beta::BetaManagedAgentsAdvisorParams)]
      end
    end

    BetaManagedAgentsMultiagentRosterEntryParams = Beta::BetaManagedAgentsMultiagentRosterEntryParams
  end
end
