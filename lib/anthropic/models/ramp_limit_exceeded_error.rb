# frozen_string_literal: true

module Anthropic
  module Models
    # The request would exceed a ramp limit, which caps how fast usage can grow. Retry
    # after the time in the `retry-after` header.
    class RampLimitExceededError < Anthropic::Errors::RateLimitError
      # @!method error_code
      #   @return [Symbol, :ramp_limit_exceeded]

      # @return [Anthropic::Models::RampLimitExceededErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::RampLimitExceededErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
