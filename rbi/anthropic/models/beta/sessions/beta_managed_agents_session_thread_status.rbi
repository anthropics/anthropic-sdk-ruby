# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # SessionThreadStatus enum
        module BetaManagedAgentsSessionThreadStatus
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RUNNING =
            T.let(
              :running,
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::TaggedSymbol
            )
          IDLE =
            T.let(
              :idle,
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::TaggedSymbol
            )
          RESCHEDULING =
            T.let(
              :rescheduling,
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::TaggedSymbol
            )
          TERMINATED =
            T.let(
              :terminated,
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::TaggedSymbol
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
