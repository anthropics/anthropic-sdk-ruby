# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # An MCP server host used by the deployment's agent is blocked by the
        # environment's network policy.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :mcp_egress_blocked_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
