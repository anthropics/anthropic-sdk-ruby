# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthCreateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute access_token
          #   OAuth access token.
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
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          optional :expires_at, Time, nil?: true

          # @!attribute refresh
          #   OAuth refresh token parameters for creating a credential with refresh support.
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
          #   @param access_token [String] OAuth access token.
          #
          #   @param mcp_server_url [String] URL of the MCP server this credential authenticates against.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type]
          #
          #   @param expires_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param refresh [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams, nil] OAuth refresh token parameters for creating a credential with refresh support.

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
