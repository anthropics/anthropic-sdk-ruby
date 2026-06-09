# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionResourceNotFoundRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type }

        # @!method initialize(message:, type:)
        #   A referenced resource no longer exists and its kind was not reported.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSION_RESOURCE_NOT_FOUND_ERROR = :session_resource_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSessionResourceNotFoundRunError = Beta::BetaManagedAgentsSessionResourceNotFoundRunError
  end
end
