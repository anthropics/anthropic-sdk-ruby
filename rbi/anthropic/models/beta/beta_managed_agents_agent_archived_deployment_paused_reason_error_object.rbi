# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject

    module Beta
      class BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The deployment's agent was archived.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :agent_archived_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
