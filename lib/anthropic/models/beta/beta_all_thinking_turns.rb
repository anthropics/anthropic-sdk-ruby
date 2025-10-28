# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAllThinkingTurns < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :all]
        required :type, const: :all

        # @!method initialize(type: :all)
        #   @param type [Symbol, :all]
      end
    end

    BetaAllThinkingTurns = Beta::BetaAllThinkingTurns
  end
end
