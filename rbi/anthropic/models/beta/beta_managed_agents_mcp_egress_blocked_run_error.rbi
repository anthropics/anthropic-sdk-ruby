# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMCPEgressBlockedRunError =
      Beta::BetaManagedAgentsMCPEgressBlockedRunError

    module Beta
      class BetaManagedAgentsMCPEgressBlockedRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        # An MCP server host used by the deployment's agent is blocked by the
        # environment's network policy.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :mcp_egress_blocked_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
