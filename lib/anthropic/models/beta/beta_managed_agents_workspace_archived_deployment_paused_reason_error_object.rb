# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :workspace_archived_error]
        required :type, const: :workspace_archived_error

        # @!method initialize(type: :workspace_archived_error)
        #   The deployment's workspace was archived.
        #
        #   @param type [Symbol, :workspace_archived_error]
      end
    end

    BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject
  end
end
