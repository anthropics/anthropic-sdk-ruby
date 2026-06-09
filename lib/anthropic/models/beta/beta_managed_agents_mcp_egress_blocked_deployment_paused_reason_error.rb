# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   An MCP server host used by the deployment's agent is blocked by the
        #   environment's network policy.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MCP_EGRESS_BLOCKED_ERROR = :mcp_egress_blocked_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError
  end
end
