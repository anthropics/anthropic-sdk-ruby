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

          sig { returns(Symbol) }
          attr_accessor :type

          # The new OAuth access token to replace the stored one.
          sig { returns(T.nilable(String)) }
          attr_accessor :access_token

          # When the credential's access token expires, in RFC 3339. Leave it out to keep
          # the stored expiry.
          #
          # If you send a new `access_token`, send its `expires_at` too, or the new token
          # keeps the old expiry.
          #
          # Must be in the future.
          sig { returns(T.nilable(Time)) }
          attr_accessor :expires_at

          # Updated refresh token configuration.
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
              access_token: T.nilable(String),
              expires_at: T.nilable(Time),
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The new OAuth access token to replace the stored one.
            access_token: nil,
            # When the credential's access token expires, in RFC 3339. Leave it out to keep
            # the stored expiry.
            #
            # If you send a new `access_token`, send its `expires_at` too, or the new token
            # keeps the old expiry.
            #
            # Must be in the future.
            expires_at: nil,
            # Updated refresh token configuration.
            refresh: nil,
            type: :mcp_oauth
          )
          end

          sig do
            override.returns(
              {
                type: Symbol,
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
        end
      end
    end
  end
end
