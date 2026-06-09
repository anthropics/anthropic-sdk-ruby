# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionRateLimitedRunError =
      Beta::BetaManagedAgentsSessionRateLimitedRunError

    module Beta
      class BetaManagedAgentsSessionRateLimitedRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Session creation was rejected due to rate limiting. The schedule keeps firing;
        # subsequent runs may succeed.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION_RATE_LIMITED_ERROR =
            T.let(
              :session_rate_limited_error,
              Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type::TaggedSymbol
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
