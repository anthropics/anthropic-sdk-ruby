# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :agent_archived_error]
        required :type, const: :agent_archived_error

        # @!method initialize(type: :agent_archived_error)
        #   The deployment's agent was archived.
        #
        #   @param type [Symbol, :agent_archived_error]
      end
    end

    BetaManagedAgentsAgentArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError
  end
end
