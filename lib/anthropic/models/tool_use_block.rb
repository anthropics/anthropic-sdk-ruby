# frozen_string_literal: true

module Anthropic
  module Models
    class ToolUseBlock < Anthropic::BaseModel
      # @!attribute id
      #   @return [String]
      required :id, String

      # @!attribute input
      #   @return [Object]
      required :input, Anthropic::Unknown

      # @!attribute name
      #   @return [String]
      required :name, String

      # @!attribute type
      #   @return [Symbol, Anthropic::Models::ToolUseBlock::Type]
      required :type, enum: -> { Anthropic::Models::ToolUseBlock::Type }

      class Type < Anthropic::Enum
        TOOL_USE = :tool_use
      end

      # @!parse
      #   # Create a new instance of ToolUseBlock from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id
      #   #   @option data [Object] :input
      #   #   @option data [String] :name
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
