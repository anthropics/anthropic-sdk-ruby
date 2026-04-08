# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthRefreshResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute client_id
          #   OAuth client ID.
          #
          #   @return [String]
          required :client_id, String

          # @!attribute token_endpoint
          #   Token endpoint URL used to refresh the access token.
          #
          #   @return [String]
          required :token_endpoint, String

          # @!attribute token_endpoint_auth
          #   Token endpoint requires no client authentication.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse]
          required :token_endpoint_auth,
                   union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse::TokenEndpointAuth }

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

          # @!method initialize(client_id:, token_endpoint:, token_endpoint_auth:, resource: nil, scope: nil)
          #   OAuth refresh token configuration returned in credential responses.
          #
          #   @param client_id [String] OAuth client ID.
          #
          #   @param token_endpoint [String] Token endpoint URL used to refresh the access token.
          #
          #   @param token_endpoint_auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse] Token endpoint requires no client authentication.
          #
          #   @param resource [String, nil] OAuth resource indicator.
          #
          #   @param scope [String, nil] OAuth scope for the refresh request.

          # Token endpoint requires no client authentication.
          #
          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse#token_endpoint_auth
          module TokenEndpointAuth
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Token endpoint requires no client authentication.
            variant :none, -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse }

            # Token endpoint uses HTTP Basic authentication with client credentials.
            variant :client_secret_basic,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse }

            # Token endpoint uses POST body authentication with client credentials.
            variant :client_secret_post,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse)]
          end
        end
      end
    end
  end
end
