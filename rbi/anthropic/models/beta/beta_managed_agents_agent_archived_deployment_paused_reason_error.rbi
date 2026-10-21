# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsAgentArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError,
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
