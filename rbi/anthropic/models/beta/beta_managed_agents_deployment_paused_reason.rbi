# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentPausedReason =
      Beta::BetaManagedAgentsDeploymentPausedReason

    module Beta
      # Why a deployment is paused. Non-null exactly when `status` is `paused`.
      module BetaManagedAgentsDeploymentPausedReason
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason,
              Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
