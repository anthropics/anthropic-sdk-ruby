# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_choice_any => {
      #   type: :any,
      #   disable_parallel_tool_use: Anthropic::BooleanModel
      # }
      # ```
      class BetaToolChoiceAny < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :any]
        required :type, const: :any

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
        #   # The model will use any available tools.
        #   #
        #   # @param disable_parallel_tool_use [Boolean]
        #   # @param type [Symbol, :any]
        #   #
        #   def initialize(disable_parallel_tool_use: nil, type: :any, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaToolChoiceAny = Beta::BetaToolChoiceAny
  end
end
