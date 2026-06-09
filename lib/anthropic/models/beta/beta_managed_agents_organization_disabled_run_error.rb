# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsOrganizationDisabledRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type }

        # @!method initialize(message:, type:)
        #   The deployment's organization is disabled.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ORGANIZATION_DISABLED_ERROR = :organization_disabled_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsOrganizationDisabledRunError = Beta::BetaManagedAgentsOrganizationDisabledRunError
  end
end
