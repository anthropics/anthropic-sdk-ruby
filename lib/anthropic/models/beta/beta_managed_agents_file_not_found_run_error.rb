# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsFileNotFoundRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :file_not_found_error]
        required :type, const: :file_not_found_error

        # @!method initialize(message:, type: :file_not_found_error)
        #   A file resource referenced by the deployment no longer exists.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :file_not_found_error]
      end
    end

    BetaManagedAgentsFileNotFoundRunError = Beta::BetaManagedAgentsFileNotFoundRunError
  end
end
