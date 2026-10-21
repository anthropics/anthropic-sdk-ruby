# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsUnknownRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :unknown_error]
        required :type, const: :unknown_error

        # @!method initialize(message:, type: :unknown_error)
        #   An unknown or unexpected error caused the run to fail. A fallback variant;
        #   clients that do not recognize a new error type can match on message alone.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :unknown_error]
      end
    end

    BetaManagedAgentsUnknownRunError = Beta::BetaManagedAgentsUnknownRunError
  end
end
