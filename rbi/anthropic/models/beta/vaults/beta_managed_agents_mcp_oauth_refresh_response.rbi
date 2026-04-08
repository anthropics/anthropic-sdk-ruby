# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthRefreshResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # OAuth client ID.
          sig { returns(String) }
          attr_accessor :client_id

          # Token endpoint URL used to refresh the access token.
          sig { returns(String) }
          attr_accessor :token_endpoint

          # Token endpoint requires no client authentication.
          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse::TokenEndpointAuth::Variants
            )
          end
          attr_accessor :token_endpoint_auth

          # OAuth resource indicator.
          sig { returns(T.nilable(String)) }
          attr_accessor :resource

          # OAuth scope for the refresh request.
          sig { returns(T.nilable(String)) }
          attr_accessor :scope

          # OAuth refresh token configuration returned in credential responses.
          sig do
            params(
              client_id: String,
              token_endpoint: String,
              token_endpoint_auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse::OrHash
                ),
              resource: T.nilable(String),
              scope: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # OAuth client ID.
            client_id:,
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
                token_endpoint: String,
                token_endpoint_auth:
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse::TokenEndpointAuth::Variants,
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse::TokenEndpointAuth::Variants
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
