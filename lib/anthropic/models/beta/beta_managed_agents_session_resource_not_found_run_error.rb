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
        #   @return [Symbol, :session_resource_not_found_error]
        required :type, const: :session_resource_not_found_error

        # @!method initialize(message:, type: :session_resource_not_found_error)
        #   A referenced resource no longer exists and its kind was not reported.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :session_resource_not_found_error]
      end
    end

    BetaManagedAgentsSessionResourceNotFoundRunError = Beta::BetaManagedAgentsSessionResourceNotFoundRunError
  end
end
