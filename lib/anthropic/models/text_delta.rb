# frozen_string_literal: true

module Anthropic
  module Models
    class TextDelta < BaseModel
      # @!attribute [rw] text
      #   @return [String]
      required :text, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::TextDelta::Type]
      required :type, enum: -> { Anthropic::Models::TextDelta::Type }

      class Type < Anthropic::Enum
        TEXT_DELTA = :text_delta
      end

      # Create a new instance of TextDelta from a Hash of raw data.
      #
      # @overload initialize(text: nil, type: nil)
      # @param text [String]
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
