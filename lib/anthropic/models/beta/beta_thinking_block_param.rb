# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute signature
        #
        #   @return [String]
        required :signature, String

        # @!attribute thinking
        #
        #   @return [String]
        required :thinking, String

        # @!attribute type
        #
        #   @return [Symbol, :thinking]
        required :type, const: :thinking

        # @!method initialize(signature:, thinking:, type: :thinking)
        #   @param signature [String]
        #   @param thinking [String]
        #   @param type [Symbol, :thinking]
      end
    end

    BetaThinkingBlockParam = Beta::BetaThinkingBlockParam
  end
end
