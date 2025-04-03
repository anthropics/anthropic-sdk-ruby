# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolChoiceNone < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :none]
        required :type, const: :none

        # @!parse
        #   # The model will not be allowed to use tools.
        #   #
        #   # @param type [Symbol, :none]
        #   #
        #   def initialize(type: :none, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaToolChoiceNone = Beta::BetaToolChoiceNone
  end
end
