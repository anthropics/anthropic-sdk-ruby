# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsCredentialHostUnreachableError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the affected credential.
          sig { returns(String) }
          attr_accessor :credential_id

          # Human-readable error description.
          sig { returns(String) }
          attr_accessor :message

          # What the client should do next in response to this error.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::RetryStatus::Variants
            )
          end
          attr_accessor :retry_status

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # ID of the vault containing the affected credential.
          sig { returns(String) }
          attr_accessor :vault_id

          # An `environment_variable` credential's `auth.networking.allowed_hosts` includes
          # a host the environment's network policy does not permit.
          sig do
            params(
              credential_id: String,
              message: String,
              retry_status:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type::OrSymbol,
              vault_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the affected credential.
            credential_id:,
            # Human-readable error description.
            message:,
            # What the client should do next in response to this error.
            retry_status:,
            type:,
            # ID of the vault containing the affected credential.
            vault_id:
          )
          end

          sig do
            override.returns(
              {
                credential_id: String,
                message: String,
                retry_status:
                  Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::RetryStatus::Variants,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type::TaggedSymbol,
                vault_id: String
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::RetryStatus::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CREDENTIAL_HOST_UNREACHABLE_ERROR =
              T.let(
                :credential_host_unreachable_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type::TaggedSymbol
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
