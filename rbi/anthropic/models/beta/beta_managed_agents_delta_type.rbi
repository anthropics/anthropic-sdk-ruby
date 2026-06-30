# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeltaType = Beta::BetaManagedAgentsDeltaType

    module Beta
      # EventDeltaType enum
      module BetaManagedAgentsDeltaType
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaManagedAgentsDeltaType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGENT_MESSAGE =
          T.let(
            :"agent.message",
            Anthropic::Beta::BetaManagedAgentsDeltaType::TaggedSymbol
          )
        AGENT_THINKING =
          T.let(
            :"agent.thinking",
            Anthropic::Beta::BetaManagedAgentsDeltaType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsDeltaType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
