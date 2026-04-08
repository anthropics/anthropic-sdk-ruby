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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMCPToolset::Type }

        # @!method initialize(configs:, default_config:, mcp_server_name:, type:)
        #   @param configs [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPToolConfig>]
        #
        #   @param default_config [Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfig] Resolved default configuration for all tools from an MCP server.
        #
        #   @param mcp_server_name [String]
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPToolset#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MCP_TOOLSET = :mcp_toolset

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMCPToolset = Beta::BetaManagedAgentsMCPToolset
  end
end
