# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsMCPAuthenticationFailedError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError,
                Anthropic::Internal::AnyHash
              )
            end

          # Name of the MCP server that failed authentication.
          sig { returns(String) }
          attr_accessor :mcp_server_name

          # Human-readable error description.
          sig { returns(String) }
          attr_accessor :message

          # What the client should do next in response to this error.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::RetryStatus::Variants
            )
          end
          attr_accessor :retry_status

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Authentication to an MCP server failed.
          sig do
            params(
              mcp_server_name: String,
              message: String,
              retry_status:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Name of the MCP server that failed authentication.
            mcp_server_name:,
            # Human-readable error description.
            message:,
            # What the client should do next in response to this error.
            retry_status:,
            type:
          )
          end

          sig do
            override.returns(
              {
                mcp_server_name: String,
                message: String,
                retry_status:
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::RetryStatus::Variants,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # What the client should do next in response to this error.
          module RetryStatus
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::RetryStatus::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MCP_AUTHENTICATION_FAILED_ERROR =
              T.let(
                :mcp_authentication_failed_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::Type::TaggedSymbol
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
end
