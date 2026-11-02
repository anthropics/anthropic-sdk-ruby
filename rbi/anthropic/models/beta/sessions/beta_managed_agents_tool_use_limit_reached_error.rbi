# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsToolUseLimitReachedError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError,
                Anthropic::Internal::AnyHash
              )
            end

          # Human-readable error description.
          sig { returns(String) }
          attr_accessor :message

          # What the client should do next.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Variants
            )
          end
          attr_accessor :retry_status

          sig { returns(Symbol) }
          attr_accessor :type

          # The turn stopped because the agent loop reached its limit on tool-use rounds
          # (one model response that calls tools, plus running those tools, is one round),
          # not because a request failed. The thread goes idle with
          # `stop_reason: retries_exhausted` (a child thread then terminates); the next
          # `user.message` starts a new turn.
          sig do
            params(
              message: String,
              retry_status:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Human-readable error description.
            message:,
            # What the client should do next.
            retry_status:,
            type: :tool_use_limit_reached_error
          )
          end

          sig do
            override.returns(
              {
                message: String,
                retry_status:
                  Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Variants,
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # What the client should do next.
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

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              RETRYING =
                T.let(
                  :retrying,
                  Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Type::TaggedSymbol
                )
              EXHAUSTED =
                T.let(
                  :exhausted,
                  Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Type::TaggedSymbol
                )
              TERMINAL =
                T.let(
                  :terminal,
                  Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Type::OrSymbol
              ).returns(
                Anthropic::Beta::Sessions::BetaManagedAgentsToolUseLimitReachedError::RetryStatus::Variants
              )
            end
            def self.new(type:)
            end
          end
        end
      end
    end
  end
end
