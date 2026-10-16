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
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type }

          # @!method initialize(client_secret:, type:)
          #   Token endpoint uses POST body authentication with client credentials.
          #
          #   @param client_secret [String] The OAuth client secret, sent to `token_endpoint` in the POST body.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam#type
          module Type
            extend Anthropic::Internal::Type::Enum

            CLIENT_SECRET_POST = :client_secret_post

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
