# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthPostParam < Anthropic::Internal::Type::BaseModel
          # @!attribute client_secret
          #   The OAuth client secret, sent to `token_endpoint` in the POST body.
          #
          #   @return [String]
          required :client_secret, String

          # @!attribute type
          #
          #   @return [Symbol, :client_secret_post]
          required :type, const: :client_secret_post

          # @!method initialize(client_secret:, type: :client_secret_post)
          #   Token endpoint uses POST body authentication with client credentials.
          #
          #   @param client_secret [String] The OAuth client secret, sent to `token_endpoint` in the POST body.
          #
          #   @param type [Symbol, :client_secret_post]
        end
      end
    end
  end
end
