# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   The deployment's agent was archived.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT_ARCHIVED_ERROR = :agent_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgentArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError
  end
end
