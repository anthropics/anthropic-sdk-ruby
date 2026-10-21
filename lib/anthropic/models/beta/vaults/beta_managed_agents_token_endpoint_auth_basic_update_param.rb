# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicUpdateParam < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :client_secret_basic]
          required :type, const: :client_secret_basic

          # @!attribute client_secret
          #   A new OAuth client secret to replace the stored one.
          #
          #   The credential must already use `client_secret_basic` or `client_secret_post`.
          #   It keeps its current `token_endpoint_auth` type, even if the `type` sent with
          #   this secret is the other one.
          #
          #   @return [String, nil]
          optional :client_secret, String, nil?: true

          # @!method initialize(client_secret: nil, type: :client_secret_basic)
          #   Updated HTTP Basic authentication parameters for the token endpoint.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam}
          #   for more details.
          #
          #   @param client_secret [String, nil] A new OAuth client secret to replace the stored one.
          #
          #   @param type [Symbol, :client_secret_basic]
        end
      end
    end
  end
end
