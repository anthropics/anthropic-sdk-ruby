# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingConfigDisabled < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :disabled]
      required :type, const: :disabled

      # @!method initialize(type: :disabled)
      #   @param type [Symbol, :disabled]
    end
  end
end
