# frozen_string_literal: true

module Anthropic
  module Models
    class RampLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :ramp_limit_exceeded]
      required :error_code, const: :ramp_limit_exceeded

      # @!method initialize(error_code: :ramp_limit_exceeded)
      #   The request would exceed a ramp limit, which caps how fast usage can grow. Retry
      #   after the time in the `retry-after` header.
      #
      #   @param error_code [Symbol, :ramp_limit_exceeded]
    end
  end
end
