# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsURLMCPServerParams < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Unique name for this server, referenced by mcp_toolset configurations. 1-255
        #   characters.
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, :url]
        required :type, const: :url

        # @!attribute url
        #   Endpoint URL for the MCP server.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(name:, url:, type: :url)
        #   URL-based MCP server connection.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams} for more details.
        #
        #   @param name [String] Unique name for this server, referenced by mcp_toolset configurations. 1-255 cha
        #
        #   @param url [String] Endpoint URL for the MCP server.
        #
        #   @param type [Symbol, :url]
      end
    end

    BetaManagedAgentsURLMCPServerParams = Beta::BetaManagedAgentsURLMCPServerParams
  end
end
