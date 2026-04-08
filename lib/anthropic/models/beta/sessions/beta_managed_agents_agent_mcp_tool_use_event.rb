# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentMCPToolUseEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute input
          #   Input parameters for the tool call.
          #
          #   @return [Hash{Symbol=>Object}]
          required :input, Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]

          # @!attribute mcp_server_name
          #   Name of the MCP server providing the tool.
          #
          #   @return [String]
          required :mcp_server_name, String

          # @!attribute name
          #   Name of the MCP tool being used.
          #
          #   @return [String]
          required :name, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type }

          # @!attribute evaluated_permission
          #   AgentEvaluatedPermission enum
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission, nil]
          optional :evaluated_permission,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission }

          # @!method initialize(id:, input:, mcp_server_name:, name:, processed_at:, type:, evaluated_permission: nil)
          #   Event emitted when the agent invokes a tool provided by an MCP server.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param input [Hash{Symbol=>Object}] Input parameters for the tool call.
          #
          #   @param mcp_server_name [String] Name of the MCP server providing the tool.
          #
          #   @param name [String] Name of the MCP tool being used.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::Type]
          #
          #   @param evaluated_permission [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent::EvaluatedPermission] AgentEvaluatedPermission enum

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_MCP_TOOL_USE = :"agent.mcp_tool_use"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # AgentEvaluatedPermission enum
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent#evaluated_permission
          module EvaluatedPermission
            extend Anthropic::Internal::Type::Enum

            ALLOW = :allow
            ASK = :ask
            DENY = :deny

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
