# frozen_string_literal: true

module Anthropic
  module Models
    class ToolChoiceAny < Anthropic::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::ToolChoiceAny::Type]
      required :type, enum: -> { Anthropic::Models::ToolChoiceAny::Type }

      # @!attribute disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output exactly one tool use.
      #
      #   @return [Boolean]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      # @!parse
      #   # The model will use any available tools.
      #   #
      #   # @param type [String]
      #   #
      #   # @param disable_parallel_tool_use [Boolean, nil] Whether to disable parallel tool use.
      #   #
      #   #   Defaults to `false`. If set to `true`, the model will output exactly one tool
      #   #   use.
      #   #
      #   def initialize(type:, disable_parallel_tool_use: nil) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Type < Anthropic::Enum
        ANY = :any
      end
    end
  end
end
