# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUnknownError < Anthropic::Internal::Type::BaseModel
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
                   union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUnknownError::RetryStatus }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUnknownError::Type }

          # @!method initialize(message:, retry_status:, type:)
          #   An unknown or unexpected error occurred during session execution. A fallback
          #   variant; clients that don't recognize a new error code can match on
          #   `retry_status` and `message` alone.
          #
          #   @param message [String] Human-readable error description.
          #
          #   @param retry_status [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal] What the client should do next in response to this error.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError::Type]

          # What the client should do next in response to this error.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError#retry_status
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

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError#type
          module Type
            extend Anthropic::Internal::Type::Enum

            UNKNOWN_ERROR = :unknown_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
