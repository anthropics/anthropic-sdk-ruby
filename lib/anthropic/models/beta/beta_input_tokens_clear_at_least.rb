# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaInputTokensClearAtLeast < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :input_tokens]
        required :type, const: :input_tokens

        # @!attribute value
        #
        #   @return [Integer]
        required :value, Integer

        # @!method initialize(value:, type: :input_tokens)
        #   @param value [Integer]
        #   @param type [Symbol, :input_tokens]
      end
    end

    BetaInputTokensClearAtLeast = Beta::BetaInputTokensClearAtLeast
  end
end
