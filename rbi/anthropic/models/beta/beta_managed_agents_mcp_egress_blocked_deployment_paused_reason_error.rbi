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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # An MCP server host used by the deployment's agent is blocked by the
        # environment's network policy.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MCP_EGRESS_BLOCKED_ERROR =
            T.let(
              :mcp_egress_blocked_error,
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
