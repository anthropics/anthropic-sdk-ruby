# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthRefreshUpdateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Updated OAuth refresh token.
          sig { returns(T.nilable(String)) }
          attr_accessor :refresh_token

          # Updated OAuth scope for the refresh request.
          sig { returns(T.nilable(String)) }
          attr_accessor :scope

          # Updated HTTP Basic authentication parameters for the token endpoint.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam
                )
              )
            )
          end
          attr_reader :token_endpoint_auth

          sig do
            params(
              token_endpoint_auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam::OrHash
                )
            ).void
          end
          attr_writer :token_endpoint_auth

          # Parameters for updating OAuth refresh token configuration.
          sig do
            params(
              refresh_token: T.nilable(String),
              scope: T.nilable(String),
              token_endpoint_auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Updated OAuth refresh token.
            refresh_token: nil,
            # Updated OAuth scope for the refresh request.
            scope: nil,
            # Updated HTTP Basic authentication parameters for the token endpoint.
            token_endpoint_auth: nil
          )
          end

          sig do
            override.returns(
              {
                refresh_token: T.nilable(String),
                scope: T.nilable(String),
                token_endpoint_auth:
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam,
                    Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam
                  )
              }
            )
          end
          def to_hash
          end

          # Updated HTTP Basic authentication parameters for the token endpoint.
          module TokenEndpointAuth
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam,
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams::TokenEndpointAuth::Variants
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
