# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPEgressBlockedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :mcp_egress_blocked_error]
        required :type, const: :mcp_egress_blocked_error

        # @!method initialize(message:, type: :mcp_egress_blocked_error)
        #   An MCP server host used by the deployment's agent is blocked by the
        #   environment's network policy.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :mcp_egress_blocked_error]
      end
    end

    BetaManagedAgentsMCPEgressBlockedRunError = Beta::BetaManagedAgentsMCPEgressBlockedRunError
  end
end
