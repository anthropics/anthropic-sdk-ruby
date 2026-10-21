# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthNoneResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :none]
          required :type, const: :none

          # @!method initialize(type: :none)
          #   Token endpoint requires no client authentication.
          #
          #   @param type [Symbol, :none]
        end
      end
    end
  end
end
