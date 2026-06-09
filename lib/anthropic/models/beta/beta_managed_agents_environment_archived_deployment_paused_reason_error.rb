# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   The deployment's environment was archived.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ENVIRONMENT_ARCHIVED_ERROR = :environment_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError
  end
end
