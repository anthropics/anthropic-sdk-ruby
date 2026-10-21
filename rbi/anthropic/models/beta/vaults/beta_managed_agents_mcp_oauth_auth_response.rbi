# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthAuthResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # URL of the MCP server this credential authenticates against.
          sig { returns(String) }
          attr_accessor :mcp_server_url

          sig { returns(Symbol) }
          attr_accessor :type

          # When the credential's access token expires, in RFC 3339. Absent if the expiry
          # isn't known.
          sig { returns(T.nilable(Time)) }
          attr_accessor :expires_at

          # Refresh token configuration, if the credential supports token refresh.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse
              )
            )
          end
          attr_reader :refresh

          sig do
            params(
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse::OrHash
                )
            ).void
          end
          attr_writer :refresh

          # OAuth credential details for an MCP server.
          sig do
            params(
              mcp_server_url: String,
              expires_at: T.nilable(Time),
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # URL of the MCP server this credential authenticates against.
            mcp_server_url:,
            # When the credential's access token expires, in RFC 3339. Absent if the expiry
            # isn't known.
            expires_at: nil,
            # Refresh token configuration, if the credential supports token refresh.
            refresh: nil,
            type: :mcp_oauth
          )
          end

          sig do
            override.returns(
              {
                mcp_server_url: String,
                type: Symbol,
                expires_at: T.nilable(Time),
                refresh:
                  T.nilable(
                    Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse
                  )
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
