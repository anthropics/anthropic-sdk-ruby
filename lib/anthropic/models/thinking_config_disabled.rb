# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingConfigDisabled < Anthropic::Internal::Type::BaseModel
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
end
