# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolUsesKeep < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :tool_uses]
        required :type, const: :tool_uses

        # @!attribute value
        #
        #   @return [Integer]
        required :value, Integer

        # @!method initialize(value:, type: :tool_uses)
        #   @param value [Integer]
        #   @param type [Symbol, :tool_uses]
      end
    end

    BetaToolUsesKeep = Beta::BetaToolUsesKeep
  end
end
