# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionCreationRejectedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :session_creation_rejected_error]
        required :type, const: :session_creation_rejected_error

        # @!method initialize(message:, type: :session_creation_rejected_error)
        #   The session create request was rejected with a non-retryable validation error.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :session_creation_rejected_error]
      end
    end

    BetaManagedAgentsSessionCreationRejectedRunError = Beta::BetaManagedAgentsSessionCreationRejectedRunError
  end
end
