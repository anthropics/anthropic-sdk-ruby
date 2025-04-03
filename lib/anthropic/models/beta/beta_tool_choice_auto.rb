# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceAuto < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :auto]
        required :type, const: :auto

        # @!attribute [r] disable_parallel_tool_use
        #   Whether to disable parallel tool use.
        #
        #     Defaults to `false`. If set to `true`, the model will output at most one tool
        #     use.
        #
        #   @return [Boolean, nil]
        optional :disable_parallel_tool_use, Anthropic::Internal::Type::BooleanModel

        # @!parse
        #   # @return [Boolean]
        #   attr_writer :disable_parallel_tool_use

        # @!parse
        #   # The model will automatically decide whether to use tools.
        #   #
        #   # @param disable_parallel_tool_use [Boolean]
        #   # @param type [Symbol, :auto]
        #   #
        #   def initialize(disable_parallel_tool_use: nil, type: :auto, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaToolChoiceAuto = Beta::BetaToolChoiceAuto
  end
end
