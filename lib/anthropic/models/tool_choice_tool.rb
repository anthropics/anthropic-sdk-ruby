# frozen_string_literal: true

module Anthropic
  module Models
    class ToolChoiceTool < Anthropic::BaseModel
      # @!attribute name
      #   The name of the tool to use.
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::ToolChoiceTool::Type]
      required :type, enum: -> { Anthropic::Models::ToolChoiceTool::Type }

      # @!attribute disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output exactly one tool use.
      #
      #   @return [Boolean]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      # @!parse
      #   # The model will use the specified tool with `tool_choice.name`.
      #   #
      #   # @param name [String] The name of the tool to use.
      #   #
      #   # @param type [String]
      #   #
      #   # @param disable_parallel_tool_use [Boolean, nil] Whether to disable parallel tool use.
      #   #
      #   #   Defaults to `false`. If set to `true`, the model will output exactly one tool
      #   #   use.
      #   #
      #   def initialize(name:, type:, disable_parallel_tool_use: nil) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Type < Anthropic::Enum
        TOOL = :tool
      end
    end
  end
end
