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

      # @!parse
      #   # Create a new instance of TextDelta from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :text
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
