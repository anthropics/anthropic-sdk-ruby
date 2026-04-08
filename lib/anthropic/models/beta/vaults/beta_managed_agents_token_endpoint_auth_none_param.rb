# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthNoneParam < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam::Type }

          # @!method initialize(type:)
          #   Token endpoint requires no client authentication.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthNoneParam#type
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
