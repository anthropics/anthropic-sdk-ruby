# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsTriggerContext = Beta::BetaManagedAgentsTriggerContext

    module Beta
      # Describes what triggered a deployment run, with trigger-specific metadata.
      module BetaManagedAgentsTriggerContext
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext,
              Anthropic::Beta::BetaManagedAgentsManualTriggerContext
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsTriggerContext::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
