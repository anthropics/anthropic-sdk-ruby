# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentInitialEvent =
      Beta::BetaManagedAgentsDeploymentInitialEvent

    module Beta
      # An event sent to a session immediately after it is created. Supports
      # `user.message`, `user.define_outcome`, and `system.message`.
      module BetaManagedAgentsDeploymentInitialEvent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent,
              Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent,
              Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
