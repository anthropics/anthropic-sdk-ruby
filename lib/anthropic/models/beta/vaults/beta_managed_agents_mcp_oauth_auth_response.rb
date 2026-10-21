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
          #   @return [Symbol, :mcp_oauth]
          required :type, const: :mcp_oauth

          # @!attribute expires_at
          #   When the credential's access token expires, in RFC 3339. Absent if the expiry
          #   isn't known.
          #
          #   @return [Time, nil]
          optional :expires_at, Time, nil?: true

          # @!attribute refresh
          #   Refresh token configuration, if the credential supports token refresh.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse, nil]
          optional :refresh,
                   -> {
                     Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse
                   },
                   nil?: true

          # @!method initialize(mcp_server_url:, expires_at: nil, refresh: nil, type: :mcp_oauth)
          #   OAuth credential details for an MCP server.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse} for
          #   more details.
          #
          #   @param mcp_server_url [String] URL of the MCP server this credential authenticates against.
          #
          #   @param expires_at [Time, nil] When the credential's access token expires, in RFC 3339. Absent if the expiry is
          #
          #   @param refresh [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse, nil] Refresh token configuration, if the credential supports token refresh.
          #
          #   @param type [Symbol, :mcp_oauth]
        end
      end
    end
  end
end
