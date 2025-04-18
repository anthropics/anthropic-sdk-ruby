# frozen_string_literal: true

module Anthropic
  module Models
    class ToolChoiceAny < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :any]
      required :type, const: :any

      # @!attribute [r] disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      #   Defaults to `false`. If set to `true`, the model will output exactly one tool
      #   use.
      #
      #   @return [Boolean, nil]
      optional :disable_parallel_tool_use, Anthropic::Internal::Type::Boolean

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :disable_parallel_tool_use

      # @!method initialize(disable_parallel_tool_use: nil, type: :any)
      #   The model will use any available tools.
      #
      #   @param disable_parallel_tool_use [Boolean]
      #   @param type [Symbol, :any]
    end
  end
end
