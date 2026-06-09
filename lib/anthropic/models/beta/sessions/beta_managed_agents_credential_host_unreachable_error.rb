# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsCredentialHostUnreachableError < Anthropic::Internal::Type::BaseModel
          # @!attribute credential_id
          #   ID of the affected credential.
          #
          #   @return [String]
          required :credential_id, String

          # @!attribute message
          #   Human-readable error description.
          #
          #   @return [String]
          required :message, String

          # @!attribute retry_status
          #   What the client should do next in response to this error.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal]
          required :retry_status,
                   union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::RetryStatus }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type }

          # @!attribute vault_id
          #   ID of the vault containing the affected credential.
          #
          #   @return [String]
          required :vault_id, String

          # @!method initialize(credential_id:, message:, retry_status:, type:, vault_id:)
          #   An `environment_variable` credential's `auth.networking.allowed_hosts` includes
          #   a host the environment's network policy does not permit.
          #
          #   @param credential_id [String] ID of the affected credential.
          #
          #   @param message [String] Human-readable error description.
          #
          #   @param retry_status [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal] What the client should do next in response to this error.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError::Type]
          #
          #   @param vault_id [String] ID of the vault containing the affected credential.

          # What the client should do next in response to this error.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError#retry_status
          module RetryStatus
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # The server is retrying automatically. Client should wait; the same error type may fire again as retrying, then once as exhausted when the retry budget runs out.
            variant :retrying, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying }

            # This turn is dead; queued inputs are flushed and the session returns to idle. Client may send a new prompt.
            variant :exhausted, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted }

            # The session encountered a terminal error and will transition to `terminated` state.
            variant :terminal, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError#type
          module Type
            extend Anthropic::Internal::Type::Enum

            CREDENTIAL_HOST_UNREACHABLE_ERROR = :credential_host_unreachable_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
