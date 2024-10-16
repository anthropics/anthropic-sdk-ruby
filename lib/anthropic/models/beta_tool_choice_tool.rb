# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolChoiceTool < BaseModel
      # @!attribute [rw] name_
      #   The name of the tool to use.
      #   @return [String]
      required :name_, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolChoiceTool::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolChoiceTool::Type }

      # @!attribute [rw] disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output exactly one tool use.
      #   @return [Boolean]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      class Type < Anthropic::Enum
        TOOL = :tool
      end

      # @!parse
      #   # Create a new instance of BetaToolChoiceTool from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :name The name of the tool to use.
      #   #   @option data [String] :type
      #   #   @option data [Hash, nil] :disable_parallel_tool_use Whether to disable parallel tool use.
      #   #
      #   #     Defaults to `false`. If set to `true`, the model will output exactly one tool
      #   #     use.
      #   def initialize(data = {}) = super
    end
  end
end
