# frozen_string_literal: true

module Anthropic
  module Models
    class ToolUseBlock < BaseModel
      # @!attribute [rw] id
      #   @return [String]
      required :id, String

      # @!attribute [rw] input
      #   @return [Object]
      required :input, Anthropic::Unknown

      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::ToolUseBlock::Type]
      required :type, enum: -> { Anthropic::Models::ToolUseBlock::Type }

      class Type < Anthropic::Enum
        TOOL_USE = :tool_use
      end

      # Create a new instance of ToolUseBlock from a Hash of raw data.
      #
      # @overload initialize(id: nil, input: nil, name: nil, type: nil)
      # @param id [String]
      # @param input [Object]
      # @param name [String]
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
