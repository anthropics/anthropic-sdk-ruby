# frozen_string_literal: true

module Anthropic
  module Models
    class TextDelta < Anthropic::Internal::Type::BaseModel
      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute type
      #
      #   @return [Symbol, :text_delta]
      required :type, const: :text_delta

      # @!parse
      #   # @param text [String]
      #   # @param type [Symbol, :text_delta]
      #   #
      #   def initialize(text:, type: :text_delta, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
