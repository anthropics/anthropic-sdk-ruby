# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthAuthResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute mcp_server_url
          #   URL of the MCP server this credential authenticates against.
          #
          #   @return [String]
          required :mcp_server_url, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type }

          # @!attribute expires_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          optional :expires_at, Time, nil?: true

          # @!attribute refresh
          #   OAuth refresh token configuration returned in credential responses.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse, nil]
          optional :refresh,
                   -> {
                     Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse
                   },
                   nil?: true

          # @!method initialize(mcp_server_url:, type:, expires_at: nil, refresh: nil)
          #   OAuth credential details for an MCP server.
          #
          #   @param mcp_server_url [String] URL of the MCP server this credential authenticates against.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type]
          #
          #   @param expires_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param refresh [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse, nil] OAuth refresh token configuration returned in credential responses.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MCP_OAUTH = :mcp_oauth

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
