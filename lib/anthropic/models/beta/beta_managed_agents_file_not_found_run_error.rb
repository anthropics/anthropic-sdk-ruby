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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsFileNotFoundRunError::Type }

        # @!method initialize(message:, type:)
        #   A file resource referenced by the deployment no longer exists.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          FILE_NOT_FOUND_ERROR = :file_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsFileNotFoundRunError = Beta::BetaManagedAgentsFileNotFoundRunError
  end
end
