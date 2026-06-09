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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type }

        # @!method initialize(message:, type:)
        #   Session creation was rejected due to rate limiting. The schedule keeps firing;
        #   subsequent runs may succeed.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSION_RATE_LIMITED_ERROR = :session_rate_limited_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSessionRateLimitedRunError = Beta::BetaManagedAgentsSessionRateLimitedRunError
  end
end
