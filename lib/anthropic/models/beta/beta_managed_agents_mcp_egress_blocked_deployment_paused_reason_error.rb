# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :mcp_egress_blocked_error]
        required :type, const: :mcp_egress_blocked_error

        # @!method initialize(type: :mcp_egress_blocked_error)
        #   An MCP server host used by the deployment's agent is blocked by the
        #   environment's network policy.
        #
        #   @param type [Symbol, :mcp_egress_blocked_error]
      end
    end

    BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError
  end
end
