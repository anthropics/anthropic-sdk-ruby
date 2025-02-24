# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingBlock < Anthropic::BaseModel
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

        # @!parse
        #   # @param signature [String]
        #   # @param thinking [String]
        #   # @param type [Symbol, :thinking]
        #   #
        #   def initialize(signature:, thinking:, type: :thinking, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaThinkingBlock = Beta::BetaThinkingBlock
  end
end
