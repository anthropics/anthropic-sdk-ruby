# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject

    module Beta
      class BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The deployment's environment was archived.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :environment_archived_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
