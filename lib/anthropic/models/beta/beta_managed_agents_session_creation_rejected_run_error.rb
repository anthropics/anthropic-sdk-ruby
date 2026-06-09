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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type }

        # @!method initialize(message:, type:)
        #   The session create request was rejected with a non-retryable validation error.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSION_CREATION_REJECTED_ERROR = :session_creation_rejected_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSessionCreationRejectedRunError = Beta::BetaManagedAgentsSessionCreationRejectedRunError
  end
end
