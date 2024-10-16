# frozen_string_literal: true

module Anthropic
  module Models
    class TextBlockParam < BaseModel
      # @!attribute [rw] text
      #   @return [String]
      required :text, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::TextBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::TextBlockParam::Type }

      class Type < Anthropic::Enum
        TEXT = :text
      end

      # @!parse
      #   # Create a new instance of TextBlockParam from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :text
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
