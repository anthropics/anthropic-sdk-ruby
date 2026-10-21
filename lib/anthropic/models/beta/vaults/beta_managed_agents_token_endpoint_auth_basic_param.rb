# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicParam < Anthropic::Internal::Type::BaseModel
          # @!attribute client_secret
          #   The OAuth client secret, sent to `token_endpoint` with HTTP Basic
          #   authentication.
          #
          #   @return [String]
          required :client_secret, String

          # @!attribute type
          #
          #   @return [Symbol, :client_secret_basic]
          required :type, const: :client_secret_basic

          # @!method initialize(client_secret:, type: :client_secret_basic)
          #   Token endpoint uses HTTP Basic authentication with client credentials.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam}
          #   for more details.
          #
          #   @param client_secret [String] The OAuth client secret, sent to `token_endpoint` with HTTP Basic authentication
          #
          #   @param type [Symbol, :client_secret_basic]
        end
      end
    end
  end
end
