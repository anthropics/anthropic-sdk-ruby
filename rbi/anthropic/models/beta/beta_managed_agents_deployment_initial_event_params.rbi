# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentInitialEventParams =
      Beta::BetaManagedAgentsDeploymentInitialEventParams

    module Beta
      # An event sent to a session immediately after it is created. Supports
      # `user.message`, `user.define_outcome`, and `system.message`.
      module BetaManagedAgentsDeploymentInitialEventParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
              Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams,
              Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentInitialEventParams::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
