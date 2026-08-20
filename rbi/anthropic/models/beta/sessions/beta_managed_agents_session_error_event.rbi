# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionErrorEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # An unknown or unexpected error occurred during session execution. A fallback
          # variant; clients that don't recognize a new error code can match on
          # `retry_status` and `message` alone.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Variants
            )
          end
          attr_accessor :error

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # An error event indicating a problem occurred during session execution.
          sig do
            params(
              id: String,
              error:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUnknownError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRateLimitedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsBillingError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::OrHash
                ),
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # An unknown or unexpected error occurred during session execution. A fallback
            # variant; clients that don't recognize a new error code can match on
            # `retry_status` and `message` alone.
            error:,
            # A timestamp in RFC 3339 format
            processed_at:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                error:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Variants,
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # An unknown or unexpected error occurred during session execution. A fallback
          # variant; clients that don't recognize a new error code can match on
          # `retry_status` and `message` alone.
          module Error
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUnknownError,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRateLimitedError,
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError,
                  Anthropic::Beta::Sessions::BetaManagedAgentsBillingError,
                  Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              UNKNOWN_ERROR =
                T.let(
                  :unknown_error,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                )
              MODEL_OVERLOADED_ERROR =
                T.let(
                  :model_overloaded_error,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                )
              MODEL_RATE_LIMITED_ERROR =
                T.let(
                  :model_rate_limited_error,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                )
              MODEL_REQUEST_FAILED_ERROR =
                T.let(
                  :model_request_failed_error,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                )
              MCP_CONNECTION_FAILED_ERROR =
                T.let(
                  :mcp_connection_failed_error,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                )
              MCP_AUTHENTICATION_FAILED_ERROR =
                T.let(
                  :mcp_authentication_failed_error,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                )
              BILLING_ERROR =
                T.let(
                  :billing_error,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                )
              CREDENTIAL_HOST_UNREACHABLE_ERROR =
                T.let(
                  :credential_host_unreachable_error,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type: T.any(Symbol, String),
                message: String,
                retry_status:
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::OrHash
                  ),
                mcp_server_name: String,
                credential_id: String,
                vault_id: String
              ).returns(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Variants
              )
            end
            def self.new(
              type:,
              # Human-readable error description.
              message:,
              # What the client should do next in response to this error.
              retry_status:,
              # Name of the MCP server that failed to connect.
              mcp_server_name: nil,
              # ID of the affected credential.
              credential_id: nil,
              # ID of the vault containing the affected credential.
              vault_id: nil
            )
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_ERROR =
              T.let(
                :"session.error",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type::TaggedSymbol
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
