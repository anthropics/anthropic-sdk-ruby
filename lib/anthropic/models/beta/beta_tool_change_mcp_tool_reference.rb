# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolChangeMCPToolReference < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute server_name
        #
        #   @return [String]
        required :server_name, String

        # @!attribute type
        #
        #   @return [Symbol, :mcp_tool_reference]
        required :type, const: :mcp_tool_reference

        # @!method initialize(name:, server_name:, type: :mcp_tool_reference)
        #   Reference to a single MCP tool by its server and remote name — the same
        #   `server_name`/`name` pair `mcp_tool_use` carries.
        #
        #   @param name [String]
        #   @param server_name [String]
        #   @param type [Symbol, :mcp_tool_reference]
      end
    end

    BetaToolChangeMCPToolReference = Beta::BetaToolChangeMCPToolReference
  end
end
