# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceTool < Anthropic::Internal::Type::BaseModel
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
        optional :disable_parallel_tool_use, Anthropic::Internal::Type::BooleanModel

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

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaToolChoiceTool = Beta::BetaToolChoiceTool
  end
end
