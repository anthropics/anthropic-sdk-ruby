# frozen_string_literal: true

module Anthropic
  module Models
    class ToolChoiceAuto < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :auto]
      required :type, const: :auto

      # @!attribute disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      #   Defaults to `false`. If set to `true`, the model will output at most one tool
      #   use.
      #
      #   @return [Boolean, nil]
      optional :disable_parallel_tool_use, Anthropic::Internal::Type::Boolean

      # @!method initialize(disable_parallel_tool_use: nil, type: :auto)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ToolChoiceAuto} for more details.
      #
      #   The model will automatically decide whether to use tools.
      #
      #   @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use.
      #
      #   @param type [Symbol, :auto]
    end
  end
end
