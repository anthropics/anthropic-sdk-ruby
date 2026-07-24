# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolChangeMCPToolsetReference < Anthropic::Internal::Type::BaseModel
        # @!attribute server_name
        #
        #   @return [String]
        required :server_name, String

        # @!attribute type
        #
        #   @return [Symbol, :mcp_toolset_reference]
        required :type, const: :mcp_toolset_reference

        # @!method initialize(server_name:, type: :mcp_toolset_reference)
        #   Reference to every tool in the named MCP server's toolset.
        #
        #   @param server_name [String]
        #   @param type [Symbol, :mcp_toolset_reference]
      end
    end

    BetaToolChangeMCPToolsetReference = Beta::BetaToolChangeMCPToolsetReference
  end
end
