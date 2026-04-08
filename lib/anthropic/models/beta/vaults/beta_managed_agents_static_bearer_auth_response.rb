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
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type }

          # @!method initialize(mcp_server_url:, type:)
          #   Static bearer token credential details for an MCP server.
          #
          #   @param mcp_server_url [String] URL of the MCP server this credential authenticates against.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse#type
          module Type
            extend Anthropic::Internal::Type::Enum

            STATIC_BEARER = :static_bearer

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
