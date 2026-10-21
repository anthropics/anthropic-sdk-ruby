# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRepositoryAuthenticationError < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #   Human-readable error description.
          #
          #   @return [String]
          required :message, String

          # @!attribute repository_url
          #   URL of the repository that could not be cloned. Null when it could not be
          #   identified.
          #
          #   @return [String, nil]
          required :repository_url, String, nil?: true

          # @!attribute retry_status
          #   What the client should do next. Always `retrying`: the session keeps running
          #   without the repository.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal]
          required :retry_status,
                   union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus }

          # @!attribute type
          #
          #   @return [Symbol, :repository_authentication_error]
          required :type, const: :repository_authentication_error

          # @!method initialize(message:, repository_url:, retry_status:, type: :repository_authentication_error)
          #   The repository host rejected the credentials, or required credentials and
          #   received none.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError}
          #   for more details.
          #
          #   @param message [String] Human-readable error description.
          #
          #   @param repository_url [String, nil] URL of the repository that could not be cloned. Null when it could not be identi
          #
          #   @param retry_status [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal] What the client should do next. Always `retrying`: the session keeps running wit
          #
          #   @param type [Symbol, :repository_authentication_error]

          # What the client should do next. Always `retrying`: the session keeps running
          # without the repository.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError#retry_status
          module RetryStatus
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # The server is retrying automatically. Client should wait; the same error type may fire again as retrying, then once as exhausted when the retry budget runs out.
            variant :retrying, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying }

            # This turn is dead; queued inputs are flushed and the session returns to idle. Client may send a new prompt.
            variant :exhausted, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted }

            # The session encountered a terminal error and will transition to `terminated` state.
            variant :terminal, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal }

            module Type
              extend Anthropic::Internal::Type::Enum

              RETRYING = :retrying
              EXHAUSTED = :exhausted
              TERMINAL = :terminal

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError::RetryStatus::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal]
            def self.new(type:, **args)
              case type.to_sym
              when :retrying
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying.new(**args)
              when :exhausted
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted.new(**args)
              when :terminal
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end
    end
  end
end
