# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionRateLimitedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :session_rate_limited_error]
        required :type, const: :session_rate_limited_error

        # @!method initialize(message:, type: :session_rate_limited_error)
        #   Session creation was rejected due to rate limiting. The schedule keeps firing;
        #   subsequent runs may succeed.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :session_rate_limited_error]
      end
    end

    BetaManagedAgentsSessionRateLimitedRunError = Beta::BetaManagedAgentsSessionRateLimitedRunError
  end
end
