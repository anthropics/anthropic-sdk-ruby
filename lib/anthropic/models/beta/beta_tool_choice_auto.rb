# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceAuto < Anthropic::BaseModel
        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolChoiceAuto::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolChoiceAuto::Type }

        # @!attribute [rw] disable_parallel_tool_use
        #   Whether to disable parallel tool use.
        #
        # Defaults to `false`. If set to `true`, the model will output at most one tool use.
        #   @return [Boolean]
        optional :disable_parallel_tool_use, Anthropic::BooleanModel

        class Type < Anthropic::Enum
          AUTO = :auto
        end

        # @!parse
        #   # Create a new instance of BetaToolChoiceAuto from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :type
        #   #   @option data [Hash, nil] :disable_parallel_tool_use Whether to disable parallel tool use.
        #   #
        #   #     Defaults to `false`. If set to `true`, the model will output at most one tool
        #   #     use.
        #   def initialize(data = {}) = super
      end
    end

    BetaToolChoiceAuto = Beta::BetaToolChoiceAuto
  end
end
