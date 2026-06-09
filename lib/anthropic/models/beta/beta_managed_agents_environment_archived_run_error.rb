# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEnvironmentArchivedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type }

        # @!method initialize(message:, type:)
        #   The deployment's environment was archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ENVIRONMENT_ARCHIVED_ERROR = :environment_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEnvironmentArchivedRunError = Beta::BetaManagedAgentsEnvironmentArchivedRunError
  end
end
