# frozen_string_literal: true

module Anthropic
  module Models
    class TextDelta < Anthropic::BaseModel
      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::TextDelta::Type]
      required :type, enum: -> { Anthropic::Models::TextDelta::Type }

      # @!parse
      #   # @param text [String]
      #   # @param type [String]
      #   #
      #   def initialize(text:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :text_delta
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        TEXT_DELTA = :text_delta
      end
    end
  end
end
