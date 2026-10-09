# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentPredefinedAgentParams =
      Beta::BetaManagedAgentsMultiagentPredefinedAgentParams

    module Beta
      # One agent in a `predefined_agents` list. It is an agent ID string, an `agent`
      # reference with an optional `version`, or `self` for the agent that owns this
      # configuration.
      module BetaManagedAgentsMultiagentPredefinedAgentParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentParams,
              Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams,
              String
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentPredefinedAgentParams::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
