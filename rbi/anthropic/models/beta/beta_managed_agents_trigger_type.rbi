# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsTriggerType = Beta::BetaManagedAgentsTriggerType

    module Beta
      # What triggered a deployment run.
      module BetaManagedAgentsTriggerType
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaManagedAgentsTriggerType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The run was fired by the deployment's cron schedule.
        SCHEDULE =
          T.let(
            :schedule,
            Anthropic::Beta::BetaManagedAgentsTriggerType::TaggedSymbol
          )

        # The run was started manually by creating a session directly against the deployment.
        MANUAL =
          T.let(
            :manual,
            Anthropic::Beta::BetaManagedAgentsTriggerType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsTriggerType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
