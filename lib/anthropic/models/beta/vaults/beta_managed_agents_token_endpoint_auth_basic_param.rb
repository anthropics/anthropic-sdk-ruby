# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicParam < Anthropic::Internal::Type::BaseModel
          # @!attribute client_secret
          #   OAuth client secret.
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
          #   @param client_secret [String] OAuth client secret.
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
