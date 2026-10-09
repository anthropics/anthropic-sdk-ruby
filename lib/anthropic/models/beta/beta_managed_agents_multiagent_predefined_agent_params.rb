# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # One agent in a `predefined_agents` list. It is an agent ID string, an `agent`
      # reference with an optional `version`, or `self` for the agent that owns this
      # configuration.
      module BetaManagedAgentsMultiagentPredefinedAgentParams
        extend Anthropic::Internal::Type::Union

        # Specification for an Agent. Provide a specific `version` or use the short-form `agent="agent_id"` for the most recent version
        variant -> { Anthropic::Beta::BetaManagedAgentsAgentParams }

        # Sentinel roster entry meaning "the agent that owns this configuration". Resolved server-side to a concrete agent reference.
        variant -> { Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams }

        variant String

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, String)]
      end
    end

    BetaManagedAgentsMultiagentPredefinedAgentParams = Beta::BetaManagedAgentsMultiagentPredefinedAgentParams
  end
end
