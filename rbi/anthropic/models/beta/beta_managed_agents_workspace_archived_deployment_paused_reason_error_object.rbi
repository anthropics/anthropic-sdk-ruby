# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject

    module Beta
      class BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The deployment's workspace was archived.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :workspace_archived_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
