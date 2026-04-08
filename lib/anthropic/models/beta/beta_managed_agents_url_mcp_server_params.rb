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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::Type }

        # @!attribute url
        #   Endpoint URL for the MCP server.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(name:, type:, url:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams} for more details.
        #
        #   URL-based MCP server connection.
        #
        #   @param name [String] Unique name for this server, referenced by mcp_toolset configurations. 1-255 cha
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams::Type]
        #
        #   @param url [String] Endpoint URL for the MCP server.

        # @see Anthropic::Models::Beta::BetaManagedAgentsURLMCPServerParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          URL = :url

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsURLMCPServerParams = Beta::BetaManagedAgentsURLMCPServerParams
  end
end
