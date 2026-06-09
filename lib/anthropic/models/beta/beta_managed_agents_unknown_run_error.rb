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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsUnknownRunError::Type }

        # @!method initialize(message:, type:)
        #   An unknown or unexpected error caused the run to fail. A fallback variant;
        #   clients that do not recognize a new error type can match on message alone.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsUnknownRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          UNKNOWN_ERROR = :unknown_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsUnknownRunError = Beta::BetaManagedAgentsUnknownRunError
  end
end
