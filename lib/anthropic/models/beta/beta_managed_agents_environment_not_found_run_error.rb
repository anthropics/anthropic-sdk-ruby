# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEnvironmentNotFoundRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type }

        # @!method initialize(message:, type:)
        #   The deployment's environment no longer exists.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ENVIRONMENT_NOT_FOUND_ERROR = :environment_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEnvironmentNotFoundRunError = Beta::BetaManagedAgentsEnvironmentNotFoundRunError
  end
end
