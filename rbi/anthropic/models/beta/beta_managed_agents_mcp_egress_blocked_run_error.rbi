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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # An MCP server host used by the deployment's agent is blocked by the
        # environment's network policy.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MCP_EGRESS_BLOCKED_ERROR =
            T.let(
              :mcp_egress_blocked_error,
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type::TaggedSymbol
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
