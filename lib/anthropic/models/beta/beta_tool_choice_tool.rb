# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceTool < Anthropic::BaseModel
        # @!attribute name
        #   The name of the tool to use.
        #   @return [String]
        required :name, String

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolChoiceTool::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolChoiceTool::Type }

        # @!attribute disable_parallel_tool_use
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

    BetaToolChoiceTool = Beta::BetaToolChoiceTool
  end
end
