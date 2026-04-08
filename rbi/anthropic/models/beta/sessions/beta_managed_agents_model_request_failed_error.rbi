# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsModelRequestFailedError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError,
                Anthropic::Internal::AnyHash
              )
            end

          # Human-readable error description.
          sig { returns(String) }
          attr_accessor :message

          # What the client should do next in response to this error.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::RetryStatus::Variants
            )
          end
          attr_accessor :retry_status

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A model request failed for a reason other than overload or rate-limiting.
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
                Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::Type::OrSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::RetryStatus::Variants,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::RetryStatus::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MODEL_REQUEST_FAILED_ERROR =
              T.let(
                :model_request_failed_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError::Type::TaggedSymbol
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
