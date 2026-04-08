# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsModelOverloadedError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError,
                Anthropic::Internal::AnyHash
              )
            end

          # Human-readable error description.
          sig { returns(String) }
          attr_accessor :message

          # What the client should do next in response to this error.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::RetryStatus::Variants
            )
          end
          attr_accessor :retry_status

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The model is currently overloaded. Emitted after automatic retries are
          # exhausted.
          sig do
            params(
              message: String,
              retry_status:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
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
                message: String,
                retry_status:
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::RetryStatus::Variants,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::RetryStatus::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MODEL_OVERLOADED_ERROR =
              T.let(
                :model_overloaded_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError::Type::TaggedSymbol
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
