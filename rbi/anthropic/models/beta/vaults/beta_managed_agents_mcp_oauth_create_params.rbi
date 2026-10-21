# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthCreateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The OAuth access token to send to the MCP server.
          sig { returns(String) }
          attr_accessor :access_token

          # URL of the MCP server this credential authenticates against.
          sig { returns(String) }
          attr_accessor :mcp_server_url

          sig { returns(Symbol) }
          attr_accessor :type

          # When `access_token` expires, in RFC 3339.
          #
          # Must be in the future.
          sig { returns(T.nilable(Time)) }
          attr_accessor :expires_at

          # Refresh token configuration, if the credential supports token refresh.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams
              )
            )
          end
          attr_reader :refresh

          sig do
            params(
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams::OrHash
                )
            ).void
          end
          attr_writer :refresh

          # Parameters for creating an MCP OAuth credential.
          sig do
            params(
              access_token: String,
              mcp_server_url: String,
              expires_at: T.nilable(Time),
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The OAuth access token to send to the MCP server.
            access_token:,
            # URL of the MCP server this credential authenticates against.
            mcp_server_url:,
            # When `access_token` expires, in RFC 3339.
            #
            # Must be in the future.
            expires_at: nil,
            # Refresh token configuration, if the credential supports token refresh.
            refresh: nil,
            type: :mcp_oauth
          )
          end

          sig do
            override.returns(
              {
                access_token: String,
                mcp_server_url: String,
                type: Symbol,
                expires_at: T.nilable(Time),
                refresh:
                  T.nilable(
                    Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams
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
