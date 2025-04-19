# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingDelta < Anthropic::Internal::Type::BaseModel
        # @!attribute thinking
        #
        #   @return [String]
        required :thinking, String

        # @!attribute type
        #
        #   @return [Symbol, :thinking_delta]
        required :type, const: :thinking_delta

        # @!method initialize(thinking:, type: :thinking_delta)
        #   @param thinking [String]
        #   @param type [Symbol, :thinking_delta]
      end
    end

    BetaThinkingDelta = Beta::BetaThinkingDelta
  end
end
