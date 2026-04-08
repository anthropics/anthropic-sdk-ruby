# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicUpdateParam < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type }

          # @!attribute client_secret
          #   Updated OAuth client secret.
          #
          #   @return [String, nil]
          optional :client_secret, String, nil?: true

          # @!method initialize(type:, client_secret: nil)
          #   Updated HTTP Basic authentication parameters for the token endpoint.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type]
          #
          #   @param client_secret [String, nil] Updated OAuth client secret.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam#type
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
