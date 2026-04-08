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

          # OAuth access token.
          sig { returns(String) }
          attr_accessor :access_token

          # URL of the MCP server this credential authenticates against.
          sig { returns(String) }
          attr_accessor :mcp_server_url

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :expires_at

          # OAuth refresh token parameters for creating a credential with refresh support.
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
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type::OrSymbol,
              expires_at: T.nilable(Time),
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # OAuth access token.
            access_token:,
            # URL of the MCP server this credential authenticates against.
            mcp_server_url:,
            type:,
            # A timestamp in RFC 3339 format
            expires_at: nil,
            # OAuth refresh token parameters for creating a credential with refresh support.
            refresh: nil
          )
          end

          sig do
            override.returns(
              {
                access_token: String,
                mcp_server_url: String,
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type::OrSymbol,
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MCP_OAUTH =
              T.let(
                :mcp_oauth,
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
