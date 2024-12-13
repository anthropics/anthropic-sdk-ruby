# frozen_string_literal: true

module Anthropic
  module Models
    class ToolChoiceAny < Anthropic::BaseModel
      # @!attribute type
      #   @return [Symbol, Anthropic::Models::ToolChoiceAny::Type]
      required :type, enum: -> { Anthropic::Models::ToolChoiceAny::Type }

      # @!attribute disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output exactly one tool use.
      #   @return [Boolean]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      class Type < Anthropic::Enum
        ANY = :any
      end

      # @!parse
      #   # Create a new instance of ToolChoiceAny from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :type
      #   #   @option data [Hash, nil] :disable_parallel_tool_use Whether to disable parallel tool use.
      #   #
      #   #     Defaults to `false`. If set to `true`, the model will output exactly one tool
      #   #     use.
      #   def initialize(data = {}) = super
    end
  end
end
