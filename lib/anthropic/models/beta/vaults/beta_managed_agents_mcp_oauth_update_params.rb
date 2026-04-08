# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type }

          # @!attribute access_token
          #   Updated OAuth access token.
          #
          #   @return [String, nil]
          optional :access_token, String, nil?: true

          # @!attribute expires_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          optional :expires_at, Time, nil?: true

          # @!attribute refresh
          #   Parameters for updating OAuth refresh token configuration.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams, nil]
          optional :refresh,
                   -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams },
                   nil?: true

          # @!method initialize(type:, access_token: nil, expires_at: nil, refresh: nil)
          #   Parameters for updating an MCP OAuth credential. The `mcp_server_url` is
          #   immutable.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type]
          #
          #   @param access_token [String, nil] Updated OAuth access token.
          #
          #   @param expires_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param refresh [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams, nil] Parameters for updating OAuth refresh token configuration.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams#type
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
