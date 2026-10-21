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

        sig { returns(Symbol) }
        attr_accessor :type

        # Session creation was rejected due to rate limiting. The schedule keeps firing;
        # subsequent runs may succeed.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :session_rate_limited_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
