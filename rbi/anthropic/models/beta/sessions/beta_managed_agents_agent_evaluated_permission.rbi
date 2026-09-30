# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        module BetaManagedAgentsAgentEvaluatedPermission
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALLOW =
            T.let(
              :allow,
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission::TaggedSymbol
            )
          ASK =
            T.let(
              :ask,
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission::TaggedSymbol
            )
          DENY =
            T.let(
              :deny,
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
