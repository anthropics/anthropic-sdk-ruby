# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMCPToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #
        #   @return [Object]
        required :input, Anthropic::Internal::Type::Unknown

        # @!attribute name
        #   The name of the MCP tool
        #
        #   @return [String]
        required :name, String

        # @!attribute server_name
        #   The name of the MCP server
        #
        #   @return [String]
        required :server_name, String

        # @!attribute type
        #
        #   @return [Symbol, :mcp_tool_use]
        required :type, const: :mcp_tool_use

        # @!method initialize(id:, input:, name:, server_name:, type: :mcp_tool_use)
        #   @param id [String]
        #
        #   @param input [Object]
        #
        #   @param name [String] The name of the MCP tool
        #
        #   @param server_name [String] The name of the MCP server
        #
        #   @param type [Symbol, :mcp_tool_use]
      end
    end

    BetaMCPToolUseBlock = Beta::BetaMCPToolUseBlock
  end
end
