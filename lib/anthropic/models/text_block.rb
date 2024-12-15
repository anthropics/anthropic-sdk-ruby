# frozen_string_literal: true

module Anthropic
  module Models
    class TextBlock < Anthropic::BaseModel
      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::TextBlock::Type]
      required :type, enum: -> { Anthropic::Models::TextBlock::Type }

      # @!parse
      #   # @param text [String]
      #   # @param type [String]
      #   #
      #   def initialize(text:, type:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Type < Anthropic::Enum
        TEXT = :text
      end
    end
  end
end
