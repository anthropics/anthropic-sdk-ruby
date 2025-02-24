# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRedactedThinkingBlock < Anthropic::BaseModel
        # @!attribute data
        #
        #   @return [String]
        required :data, String

        # @!attribute type
        #
        #   @return [Symbol, :redacted_thinking]
        required :type, const: :redacted_thinking

        # @!parse
        #   # @param data [String]
        #   # @param type [Symbol, :redacted_thinking]
        #   #
        #   def initialize(data:, type: :redacted_thinking, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaRedactedThinkingBlock = Beta::BetaRedactedThinkingBlock
  end
end
