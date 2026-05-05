# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentRosterEntryParams =
      Beta::BetaManagedAgentsMultiagentRosterEntryParams

    module Beta
      # An entry in a multiagent roster: an agent ID string, a versioned agent
      # reference, or `self`.
      module BetaManagedAgentsMultiagentRosterEntryParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              Anthropic::Beta::BetaManagedAgentsAgentParams,
              Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsMultiagentRosterEntryParams::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
