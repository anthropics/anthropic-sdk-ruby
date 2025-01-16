# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # text_block => {
    #   text: String,
    #   type: enum: Anthropic::Models::TextBlock::Type
    # }
    # ```
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
      #   def initialize(text:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :text
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        TEXT = :text

        finalize!
      end
    end
  end
end
