# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingConfigDisabled < Anthropic::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :disabled]
      required :type, const: :disabled

      # @!parse
      #   # @param type [Symbol, :disabled]
      #   #
      #   def initialize(type: :disabled, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
