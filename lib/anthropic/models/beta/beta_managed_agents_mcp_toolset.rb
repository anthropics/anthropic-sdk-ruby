# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPToolset < Anthropic::Internal::Type::BaseModel
        # @!attribute configs
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPToolConfig>]
        required :configs,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPToolConfig] }

        # @!attribute default_config
        #   Resolved default configuration for all tools from an MCP server.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfig]
        required :default_config, -> { Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfig }

        # @!attribute mcp_server_name
        #
        #   @return [String]
        required :mcp_server_name, String

        # @!attribute type
        #
        #   @return [Symbol, :mcp_toolset]
        required :type, const: :mcp_toolset

        # @!method initialize(configs:, default_config:, mcp_server_name:, type: :mcp_toolset)
        #   @param configs [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPToolConfig>]
        #
        #   @param default_config [Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfig] Resolved default configuration for all tools from an MCP server.
        #
        #   @param mcp_server_name [String]
        #
        #   @param type [Symbol, :mcp_toolset]
      end
    end

    BetaManagedAgentsMCPToolset = Beta::BetaManagedAgentsMCPToolset
  end
end
