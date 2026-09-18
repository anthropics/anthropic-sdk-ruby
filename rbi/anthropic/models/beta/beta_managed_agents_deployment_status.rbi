# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentStatus = Beta::BetaManagedAgentsDeploymentStatus

    module Beta
      # Lifecycle status of a deployment.
      module BetaManagedAgentsDeploymentStatus
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaManagedAgentsDeploymentStatus)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The deployment is active and can run sessions. Archived deployments also report this status; check `archived_at` to distinguish them.
        ACTIVE =
          T.let(
            :active,
            Anthropic::Beta::BetaManagedAgentsDeploymentStatus::TaggedSymbol
          )

        # The deployment is paused. Autonomous triggers are suppressed; manual runs are still permitted.
        PAUSED =
          T.let(
            :paused,
            Anthropic::Beta::BetaManagedAgentsDeploymentStatus::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentStatus::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
