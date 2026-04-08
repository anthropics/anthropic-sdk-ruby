# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type }

          # @!method initialize(type:)
          #   Token endpoint uses HTTP Basic authentication with client credentials.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse#type
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
