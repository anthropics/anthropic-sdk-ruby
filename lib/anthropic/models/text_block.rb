# frozen_string_literal: true

module Anthropic
  module Models
    class TextBlock < Anthropic::BaseModel
      # @!attribute text
      #   @return [String]
      required :text, String

      # @!attribute type
      #   @return [Symbol, Anthropic::Models::TextBlock::Type]
      required :type, enum: -> { Anthropic::Models::TextBlock::Type }

      class Type < Anthropic::Enum
        TEXT = :text
      end

      # @!parse
      #   # Create a new instance of TextBlock from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :text
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
