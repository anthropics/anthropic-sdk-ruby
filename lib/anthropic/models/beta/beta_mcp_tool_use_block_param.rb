# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMCPToolUseBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #
        #   @return [Object]
        required :input, Anthropic::Internal::Type::Unknown

        # @!attribute name
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

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(id:, input:, name:, server_name:, cache_control: nil, type: :mcp_tool_use)
        #   @param id [String]
        #
        #   @param input [Object]
        #
        #   @param name [String]
        #
        #   @param server_name [String] The name of the MCP server
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :mcp_tool_use]
      end
    end

    BetaMCPToolUseBlockParam = Beta::BetaMCPToolUseBlockParam
  end
end
