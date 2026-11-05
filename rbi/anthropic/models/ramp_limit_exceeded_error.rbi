# typed: strong

module Anthropic
  module Models
    # The request would exceed a ramp limit, which caps how fast usage can grow. Retry
    # after the time in the `retry-after` header.
    class RampLimitExceededError < Anthropic::Errors::RateLimitError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::RampLimitExceededErrorDetails) }
      def details
      end
    end
  end
end
