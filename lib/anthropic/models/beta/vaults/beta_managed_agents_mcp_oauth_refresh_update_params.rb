# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthRefreshUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute refresh_token
          #   Updated OAuth refresh token.
          #
          #   @return [String, nil]
          optional :refresh_token, String, nil?: true

          # @!attribute scope
          #   Updated OAuth scope for the refresh request.
          #
          #   @return [String, nil]
          optional :scope, String, nil?: true

          # @!attribute token_endpoint_auth
          #   Updated HTTP Basic authentication parameters for the token endpoint.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam, nil]
          optional :token_endpoint_auth,
                   union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams::TokenEndpointAuth }

          # @!method initialize(refresh_token: nil, scope: nil, token_endpoint_auth: nil)
          #   Parameters for updating OAuth refresh token configuration.
          #
          #   @param refresh_token [String, nil] Updated OAuth refresh token.
          #
          #   @param scope [String, nil] Updated OAuth scope for the refresh request.
          #
          #   @param token_endpoint_auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam] Updated HTTP Basic authentication parameters for the token endpoint.

          # Updated HTTP Basic authentication parameters for the token endpoint.
          #
          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams#token_endpoint_auth
          module TokenEndpointAuth
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Updated HTTP Basic authentication parameters for the token endpoint.
            variant :client_secret_basic,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam }

            # Updated POST body authentication parameters for the token endpoint.
            variant :client_secret_post,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam)]
          end
        end
      end
    end
  end
end
