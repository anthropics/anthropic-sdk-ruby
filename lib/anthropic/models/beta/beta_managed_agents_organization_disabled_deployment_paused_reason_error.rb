# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   The deployment's organization is disabled.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ORGANIZATION_DISABLED_ERROR = :organization_disabled_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError =
      Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError
  end
end
