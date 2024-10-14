# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolChoiceAny < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolChoiceAny::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolChoiceAny::Type }

      # @!attribute [rw] disable_parallel_tool_use
      #   Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output exactly one tool use.
      #   @return [Boolean]
      optional :disable_parallel_tool_use, Anthropic::BooleanModel

      class Type < Anthropic::Enum
        ANY = :any
      end

      # Create a new instance of BetaToolChoiceAny from a Hash of raw data.
      #
      # @overload initialize(type: nil, disable_parallel_tool_use: nil)
      # @param type [String]
      # @param disable_parallel_tool_use [Hash] Whether to disable parallel tool use.
      #
      #   Defaults to `false`. If set to `true`, the model will output exactly one tool
      #   use.
      def initialize(data = {})
        super
      end
    end
  end
end
