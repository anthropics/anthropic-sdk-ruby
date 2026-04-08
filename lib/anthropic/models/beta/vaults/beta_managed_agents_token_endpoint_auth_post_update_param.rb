# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthPostUpdateParam < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam::Type }

          # @!attribute client_secret
          #   Updated OAuth client secret.
          #
          #   @return [String, nil]
          optional :client_secret, String, nil?: true

          # @!method initialize(type:, client_secret: nil)
          #   Updated POST body authentication parameters for the token endpoint.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam::Type]
          #
          #   @param client_secret [String, nil] Updated OAuth client secret.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam#type
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
