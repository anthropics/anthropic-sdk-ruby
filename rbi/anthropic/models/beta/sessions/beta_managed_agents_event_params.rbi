# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # Union type for event parameters that can be sent to a session.
        module BetaManagedAgentsEventParams
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsEventParams::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
