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

        # @!method self.variants
        #   @return [Array(String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams)]
      end
    end

    BetaManagedAgentsMultiagentRosterEntryParams = Beta::BetaManagedAgentsMultiagentRosterEntryParams
  end
end
