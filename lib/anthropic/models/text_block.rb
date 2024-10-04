# frozen_string_literal: true

module Anthropic
  module Models
    class TextBlock < BaseModel
      # @!attribute [rw] text
      #   @return [String]
      required :text, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::TextBlock::Type]
      required :type, enum: -> { Anthropic::Models::TextBlock::Type }

      class Type < Anthropic::Enum
        TEXT = :text
      end
    end
  end
end
