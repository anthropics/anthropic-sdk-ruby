# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :mcp_oauth]
          required :type, const: :mcp_oauth

          # @!attribute access_token
          #   The new OAuth access token to replace the stored one.
          #
          #   @return [String, nil]
          optional :access_token, String, nil?: true

          # @!attribute expires_at
          #   When the credential's access token expires, in RFC 3339. Leave it out to keep
          #   the stored expiry.
          #
          #   If you send a new `access_token`, send its `expires_at` too, or the new token
          #   keeps the old expiry.
          #
          #   Must be in the future.
          #
          #   @return [Time, nil]
          optional :expires_at, Time, nil?: true

          # @!attribute refresh
          #   Updated refresh token configuration.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams, nil]
          optional :refresh,
                   -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams },
                   nil?: true

          # @!method initialize(access_token: nil, expires_at: nil, refresh: nil, type: :mcp_oauth)
          #   Parameters for updating an MCP OAuth credential. The `mcp_server_url` is
          #   immutable.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams} for
          #   more details.
          #
          #   @param access_token [String, nil] The new OAuth access token to replace the stored one.
          #
          #   @param expires_at [Time, nil] When the credential's access token expires, in RFC 3339. Leave it out to keep th
          #
          #   @param refresh [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams, nil] Updated refresh token configuration.
          #
          #   @param type [Symbol, :mcp_oauth]
        end
      end
    end
  end
end
