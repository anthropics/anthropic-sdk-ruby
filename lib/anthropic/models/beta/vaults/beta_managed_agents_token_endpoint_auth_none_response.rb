# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthNoneResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse::Type }

          # @!method initialize(type:)
          #   Token endpoint requires no client authentication.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneResponse#type
          module Type
            extend Anthropic::Internal::Type::Enum

            NONE = :none

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
