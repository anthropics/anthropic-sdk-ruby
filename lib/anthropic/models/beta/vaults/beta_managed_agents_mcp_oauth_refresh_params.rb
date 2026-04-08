# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthRefreshParams < Anthropic::Internal::Type::BaseModel
          # @!attribute client_id
          #   OAuth client ID.
          #
          #   @return [String]
          required :client_id, String

          # @!attribute refresh_token
          #   OAuth refresh token.
          #
          #   @return [String]
          required :refresh_token, String

          # @!attribute token_endpoint
          #   Token endpoint URL used to refresh the access token.
          #
          #   @return [String]
          required :token_endpoint, String

          # @!attribute token_endpoint_auth
          #   Token endpoint requires no client authentication.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam]
          required :token_endpoint_auth,
                   union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams::TokenEndpointAuth }

          # @!attribute resource
          #   OAuth resource indicator.
          #
          #   @return [String, nil]
          optional :resource, String, nil?: true

          # @!attribute scope
          #   OAuth scope for the refresh request.
          #
          #   @return [String, nil]
          optional :scope, String, nil?: true

          # @!method initialize(client_id:, refresh_token:, token_endpoint:, token_endpoint_auth:, resource: nil, scope: nil)
          #   OAuth refresh token parameters for creating a credential with refresh support.
          #
          #   @param client_id [String] OAuth client ID.
          #
          #   @param refresh_token [String] OAuth refresh token.
          #
          #   @param token_endpoint [String] Token endpoint URL used to refresh the access token.
          #
          #   @param token_endpoint_auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam] Token endpoint requires no client authentication.
          #
          #   @param resource [String, nil] OAuth resource indicator.
          #
          #   @param scope [String, nil] OAuth scope for the refresh request.

          # Token endpoint requires no client authentication.
          #
          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams#token_endpoint_auth
          module TokenEndpointAuth
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Token endpoint requires no client authentication.
            variant :none, -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam }

            # Token endpoint uses HTTP Basic authentication with client credentials.
            variant :client_secret_basic, -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam }

            # Token endpoint uses POST body authentication with client credentials.
            variant :client_secret_post, -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam)]
          end
        end
      end
    end
  end
end
