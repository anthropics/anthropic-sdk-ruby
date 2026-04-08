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

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :expires_at

          # OAuth refresh token configuration returned in credential responses.
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
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type::OrSymbol,
              expires_at: T.nilable(Time),
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # URL of the MCP server this credential authenticates against.
            mcp_server_url:,
            type:,
            # A timestamp in RFC 3339 format
            expires_at: nil,
            # OAuth refresh token configuration returned in credential responses.
            refresh: nil
          )
          end

          sig do
            override.returns(
              {
                mcp_server_url: String,
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type::TaggedSymbol,
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MCP_OAUTH =
              T.let(
                :mcp_oauth,
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::Type::TaggedSymbol
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
