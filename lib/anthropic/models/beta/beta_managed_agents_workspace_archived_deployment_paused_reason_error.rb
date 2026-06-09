# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   The deployment's workspace was archived.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          WORKSPACE_ARCHIVED_ERROR = :workspace_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError
  end
end
