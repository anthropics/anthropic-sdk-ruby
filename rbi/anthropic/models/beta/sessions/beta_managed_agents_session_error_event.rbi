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
                  Anthropic::Beta::Sessions::BetaManagedAgentsBillingError::OrHash
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsBillingError
                )
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
