# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceAny < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :any]
        required :type, const: :any

        # @!attribute disable_parallel_tool_use
        #   Whether to disable parallel tool use.
        #
        #   Defaults to `false`. If set to `true`, the model will output exactly one tool
        #   use.
        #
        #   @return [Boolean, nil]
        optional :disable_parallel_tool_use, Anthropic::Internal::Type::Boolean

        # @!method initialize(disable_parallel_tool_use: nil, type: :any)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaToolChoiceAny} for more details.
        #
        #   The model will use any available tools.
        #
        #   @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use.
        #
        #   @param type [Symbol, :any]
      end
    end

    BetaToolChoiceAny = Beta::BetaToolChoiceAny
  end
end
