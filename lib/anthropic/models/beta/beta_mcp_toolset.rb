# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMCPToolset < Anthropic::Internal::Type::BaseModel
        # @!attribute mcp_server_name
        #   Name of the MCP server to configure tools for
        #
        #   @return [String]
        required :mcp_server_name, String

        # @!attribute type
        #
        #   @return [Symbol, :mcp_toolset]
        required :type, const: :mcp_toolset

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute configs
        #   Configuration overrides for specific tools, keyed by tool name
        #
        #   @return [Hash{Symbol=>Anthropic::Models::Beta::BetaMCPToolConfig}, nil]
        optional :configs,
                 -> { Anthropic::Internal::Type::HashOf[Anthropic::Beta::BetaMCPToolConfig] },
                 nil?: true

        # @!attribute default_config
        #   Default configuration applied to all tools from this server
        #
        #   @return [Anthropic::Models::Beta::BetaMCPToolDefaultConfig, nil]
        optional :default_config, -> { Anthropic::Beta::BetaMCPToolDefaultConfig }

        # @!method initialize(mcp_server_name:, cache_control: nil, configs: nil, default_config: nil, type: :mcp_toolset)
        #   Configuration for a group of tools from an MCP server.
        #
        #   Allows configuring enabled status and defer_loading for all tools from an MCP
        #   server, with optional per-tool overrides.
        #
        #   @param mcp_server_name [String] Name of the MCP server to configure tools for
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param configs [Hash{Symbol=>Anthropic::Models::Beta::BetaMCPToolConfig}, nil] Configuration overrides for specific tools, keyed by tool name
        #
        #   @param default_config [Anthropic::Models::Beta::BetaMCPToolDefaultConfig] Default configuration applied to all tools from this server
        #
        #   @param type [Symbol, :mcp_toolset]
      end
    end

    BetaMCPToolset = Beta::BetaMCPToolset
  end
end
