# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPToolsetParams < Anthropic::Internal::Type::BaseModel
        # @!attribute mcp_server_name
        #   Name of the MCP server. Must match a server name from the mcp_servers array.
        #   1-255 characters.
        #
        #   @return [String]
        required :mcp_server_name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMCPToolsetParams::Type }

        # @!attribute configs
        #   Per-tool configuration overrides.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPToolConfigParams>, nil]
        optional :configs,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams] }

        # @!attribute default_config
        #   Default configuration for all tools from an MCP server.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams, nil]
        optional :default_config,
                 -> { Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams },
                 nil?: true

        # @!method initialize(mcp_server_name:, type:, configs: nil, default_config: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams} for more details.
        #
        #   Configuration for tools from an MCP server defined in `mcp_servers`.
        #
        #   @param mcp_server_name [String] Name of the MCP server. Must match a server name from the mcp_servers array. 1-2
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams::Type]
        #
        #   @param configs [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPToolConfigParams>] Per-tool configuration overrides.
        #
        #   @param default_config [Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams, nil] Default configuration for all tools from an MCP server.

        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MCP_TOOLSET = :mcp_toolset

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMCPToolsetParams = Beta::BetaManagedAgentsMCPToolsetParams
  end
end
