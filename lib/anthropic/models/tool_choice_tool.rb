# frozen_string_literal: true

module Anthropic
  module Models
    class ToolChoiceTool < Anthropic::Internal::Type::BaseModel
      # @!attribute name
      #   The name of the tool to use.
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #
      #   @return [Symbol, :tool]
      required :type, const: :tool

      # @!attribute disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      #   Defaults to `false`. If set to `true`, the model will output exactly one tool
      #   use.
      #
      #   @return [Boolean, nil]
      optional :disable_parallel_tool_use, Anthropic::Internal::Type::Boolean

      # @!method initialize(name:, disable_parallel_tool_use: nil, type: :tool)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ToolChoiceTool} for more details.
      #
      #   The model will use the specified tool with `tool_choice.name`.
      #
      #   @param name [String] The name of the tool to use.
      #
      #   @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use.
      #
      #   @param type [Symbol, :tool]
    end
  end
end
