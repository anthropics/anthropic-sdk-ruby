# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # tool_choice_auto => {
    #   type: enum: Anthropic::Models::ToolChoiceAuto::Type,
    #   disable_parallel_tool_use: Anthropic::BooleanModel
    # }
    # ```
    class ToolChoiceAuto < Anthropic::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::ToolChoiceAuto::Type]
      required :type, enum: -> { Anthropic::Models::ToolChoiceAuto::Type }

      # @!attribute disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output at most one tool use.
      #
      #   @return [Boolean]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      # @!parse
      #   # The model will automatically decide whether to use tools.
      #   #
      #   # @param type [String]
      #   #
      #   # @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use.
      #   #
      #   #   Defaults to `false`. If set to `true`, the model will output at most one tool
      #   #   use.
      #   #
      #   def initialize(type:, disable_parallel_tool_use: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :auto
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        AUTO = :auto

        finalize!
      end
    end
  end
end
