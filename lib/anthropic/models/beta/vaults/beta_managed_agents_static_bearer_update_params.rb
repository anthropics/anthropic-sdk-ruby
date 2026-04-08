# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsStaticBearerUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type }

          # @!attribute token
          #   Updated static bearer token value.
          #
          #   @return [String, nil]
          optional :token, String, nil?: true

          # @!method initialize(type:, token: nil)
          #   Parameters for updating a static bearer token credential. The `mcp_server_url`
          #   is immutable.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type]
          #
          #   @param token [String, nil] Updated static bearer token value.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            STATIC_BEARER = :static_bearer

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
