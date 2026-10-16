# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthCreateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute access_token
          #   The OAuth access token to send to the MCP server.
          #
          #   @return [String]
          required :access_token, String

          # @!attribute mcp_server_url
          #   URL of the MCP server this credential authenticates against.
          #
          #   @return [String]
          required :mcp_server_url, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type }

          # @!attribute expires_at
          #   When `access_token` expires, in RFC 3339.
          #
          #   Must be in the future.
          #
          #   @return [Time, nil]
          optional :expires_at, Time, nil?: true

          # @!attribute refresh
          #   Refresh token configuration, if the credential supports token refresh.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams, nil]
          optional :refresh,
                   -> {
                     Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams
                   },
                   nil?: true

          # @!method initialize(access_token:, mcp_server_url:, type:, expires_at: nil, refresh: nil)
          #   Parameters for creating an MCP OAuth credential.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams} for
          #   more details.
          #
          #   @param access_token [String] The OAuth access token to send to the MCP server.
          #
          #   @param mcp_server_url [String] URL of the MCP server this credential authenticates against.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type]
          #
          #   @param expires_at [Time, nil] When `access_token` expires, in RFC 3339.
          #
          #   @param refresh [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams, nil] Refresh token configuration, if the credential supports token refresh.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams#type
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
