# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolChoiceAuto < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolChoiceAuto::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolChoiceAuto::Type }

      # @!attribute [rw] disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output at most one tool use.
      #   @return [Boolean]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      class Type < Anthropic::Enum
        AUTO = :auto
      end

      # Create a new instance of BetaToolChoiceAuto from a Hash of raw data.
      #
      # @overload initialize(type: nil, disable_parallel_tool_use: nil)
      # @param type [String]
      # @param disable_parallel_tool_use [Hash] Whether to disable parallel tool use.
      #
      #   Defaults to `false`. If set to `true`, the model will output at most one tool
      #   use.
      def initialize(data = {})
        super
      end
    end
  end
end
