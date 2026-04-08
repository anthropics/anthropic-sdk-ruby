# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthRefreshParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams,
                Anthropic::Internal::AnyHash
              )
            end

          # OAuth client ID.
          sig { returns(String) }
          attr_accessor :client_id

          # OAuth refresh token.
          sig { returns(String) }
          attr_accessor :refresh_token

          # Token endpoint URL used to refresh the access token.
          sig { returns(String) }
          attr_accessor :token_endpoint

          # Token endpoint requires no client authentication.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam,
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam,
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam
              )
            )
          end
          attr_accessor :token_endpoint_auth

          # OAuth resource indicator.
          sig { returns(T.nilable(String)) }
          attr_accessor :resource

          # OAuth scope for the refresh request.
          sig { returns(T.nilable(String)) }
          attr_accessor :scope

          # OAuth refresh token parameters for creating a credential with refresh support.
          sig do
            params(
              client_id: String,
              refresh_token: String,
              token_endpoint: String,
              token_endpoint_auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::OrHash
                ),
              resource: T.nilable(String),
              scope: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # OAuth client ID.
            client_id:,
            # OAuth refresh token.
            refresh_token:,
            # Token endpoint URL used to refresh the access token.
            token_endpoint:,
            # Token endpoint requires no client authentication.
            token_endpoint_auth:,
            # OAuth resource indicator.
            resource: nil,
            # OAuth scope for the refresh request.
            scope: nil
          )
          end

          sig do
            override.returns(
              {
                client_id: String,
                refresh_token: String,
                token_endpoint: String,
                token_endpoint_auth:
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam,
                    Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam,
                    Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam
                  ),
                resource: T.nilable(String),
                scope: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Token endpoint requires no client authentication.
          module TokenEndpointAuth
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams::TokenEndpointAuth::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end
      end
    end
  end
end
