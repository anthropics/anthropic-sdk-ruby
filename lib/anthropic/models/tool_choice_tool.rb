# frozen_string_literal: true

module Anthropic
  module Models
    class ToolChoiceTool < BaseModel
      # @!attribute [rw] name_
      #   The name of the tool to use.
      #   @return [String]
      required :name_, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::ToolChoiceTool::Type]
      required :type, enum: -> { Anthropic::Models::ToolChoiceTool::Type }

      # @!attribute [rw] disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output exactly one tool use.
      #   @return [Boolean]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      class Type < Anthropic::Enum
        TOOL = :tool
      end
    end
  end
end
