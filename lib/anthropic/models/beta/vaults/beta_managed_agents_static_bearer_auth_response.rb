# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsStaticBearerAuthResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute mcp_server_url
          #   URL of the MCP server this credential authenticates against.
          #
          #   @return [String]
          required :mcp_server_url, String

          # @!attribute type
          #
          #   @return [Symbol, :static_bearer]
          required :type, const: :static_bearer

          # @!method initialize(mcp_server_url:, type: :static_bearer)
          #   Static bearer token credential details for an MCP server.
          #
          #   @param mcp_server_url [String] URL of the MCP server this credential authenticates against.
          #
          #   @param type [Symbol, :static_bearer]
        end
      end
    end
  end
end
