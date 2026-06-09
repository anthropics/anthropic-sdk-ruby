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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type }

        # @!method initialize(message:, type:)
        #   An MCP server host used by the deployment's agent is blocked by the
        #   environment's network policy.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MCP_EGRESS_BLOCKED_ERROR = :mcp_egress_blocked_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMCPEgressBlockedRunError = Beta::BetaManagedAgentsMCPEgressBlockedRunError
  end
end
