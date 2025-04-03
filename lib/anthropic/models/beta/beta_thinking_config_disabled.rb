# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingConfigDisabled < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :disabled]
        required :type, const: :disabled

        # @!parse
        #   # @param type [Symbol, :disabled]
        #   #
        #   def initialize(type: :disabled, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaThinkingConfigDisabled = Beta::BetaThinkingConfigDisabled
  end
end
