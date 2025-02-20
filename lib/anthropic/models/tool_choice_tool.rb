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
      #   @return [Symbol, :tool]
      required :type, const: :tool

      # @!attribute [r] disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      #     Defaults to `false`. If set to `true`, the model will output exactly one tool
      #     use.
      #
      #   @return [Boolean, nil]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :disable_parallel_tool_use

      # @!parse
      #   # The model will use the specified tool with `tool_choice.name`.
      #   #
      #   # @param name [String]
      #   # @param disable_parallel_tool_use [Boolean]
      #   # @param type [Symbol, :tool]
      #   #
      #   def initialize(name:, disable_parallel_tool_use: nil, type: :tool, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
