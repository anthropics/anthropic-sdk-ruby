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
          #   A new OAuth client secret to replace the stored one.
          #
          #   The credential must already use `client_secret_basic` or `client_secret_post`.
          #   It keeps its current `token_endpoint_auth` type, even if the `type` sent with
          #   this secret is the other one.
          #
          #   @return [String, nil]
          optional :client_secret, String, nil?: true

          # @!method initialize(type:, client_secret: nil)
          #   Updated POST body authentication parameters for the token endpoint.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam}
          #   for more details.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam::Type]
          #
          #   @param client_secret [String, nil] A new OAuth client secret to replace the stored one.

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
