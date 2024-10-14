# frozen_string_literal: true

module Anthropic
  module Models
    class BetaTextBlock < BaseModel
      # @!attribute [rw] text
      #   @return [String]
      required :text, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaTextBlock::Type]
      required :type, enum: -> { Anthropic::Models::BetaTextBlock::Type }

      class Type < Anthropic::Enum
        TEXT = :text
      end

      # Create a new instance of BetaTextBlock from a Hash of raw data.
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
