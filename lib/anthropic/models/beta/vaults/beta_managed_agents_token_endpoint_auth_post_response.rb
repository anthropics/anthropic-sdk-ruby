# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthPostResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse::Type }

          # @!method initialize(type:)
          #   Token endpoint uses POST body authentication with client credentials.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostResponse#type
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
