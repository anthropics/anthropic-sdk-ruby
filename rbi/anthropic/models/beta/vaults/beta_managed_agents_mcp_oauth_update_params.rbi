# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthUpdateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Updated OAuth access token.
          sig { returns(T.nilable(String)) }
          attr_accessor :access_token

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :expires_at

          # Parameters for updating OAuth refresh token configuration.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams
              )
            )
          end
          attr_reader :refresh

          sig do
            params(
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams::OrHash
                )
            ).void
          end
          attr_writer :refresh

          # Parameters for updating an MCP OAuth credential. The `mcp_server_url` is
          # immutable.
          sig do
            params(
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type::OrSymbol,
              access_token: T.nilable(String),
              expires_at: T.nilable(Time),
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # Updated OAuth access token.
            access_token: nil,
            # A timestamp in RFC 3339 format
            expires_at: nil,
            # Parameters for updating OAuth refresh token configuration.
            refresh: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type::OrSymbol,
                access_token: T.nilable(String),
                expires_at: T.nilable(Time),
                refresh:
                  T.nilable(
                    Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MCP_OAUTH =
              T.let(
                :mcp_oauth,
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::Type::TaggedSymbol
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
