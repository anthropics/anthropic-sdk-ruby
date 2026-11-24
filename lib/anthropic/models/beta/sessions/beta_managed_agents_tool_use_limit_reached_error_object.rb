# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsToolUseLimitReachedErrorObject < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #   Human-readable error description.
          #
          #   @return [String]
          required :message, String

          # @!attribute retry_status
          #   What the client should do next.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal]
          required :retry_status,
                   union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedErrorObject::RetryStatus }

          # @!attribute type
          #
          #   @return [Symbol, :tool_use_limit_reached_error]
          required :type, const: :tool_use_limit_reached_error

          # @!method initialize(message:, retry_status:, type: :tool_use_limit_reached_error)
          #   The turn stopped at one of two limits on tool use, not because a request failed.
          #   One limit is on tool-use rounds (one model response that calls tools, plus
          #   running those tools, is one round). The other is on model responses in a row
          #   that each request a single tool call and are cut off by the model's output or
          #   context limit before the call is complete. None of those calls runs. `message`
          #   states the limit that applied. The thread goes idle with
          #   `stop_reason: retries_exhausted` (a child thread then terminates); the next
          #   `user.message` starts a new turn.
          #
          #   @param message [String] Human-readable error description.
          #
          #   @param retry_status [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal] What the client should do next.
          #
          #   @param type [Symbol, :tool_use_limit_reached_error]

          # What the client should do next.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedErrorObject#retry_status
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
            # @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedErrorObject::RetryStatus::Type, String]
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
