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
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam::Type }

          # @!method initialize(client_secret:, type:)
          #   Token endpoint uses HTTP Basic authentication with client credentials.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam}
          #   for more details.
          #
          #   @param client_secret [String] The OAuth client secret, sent to `token_endpoint` with HTTP Basic authentication
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam#type
          module Type
            extend Anthropic::Internal::Type::Enum

            CLIENT_SECRET_BASIC = :client_secret_basic

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
