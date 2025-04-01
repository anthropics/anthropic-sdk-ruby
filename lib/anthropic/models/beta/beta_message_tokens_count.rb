# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Messages#count_tokens
      class BetaMessageTokensCount < Anthropic::BaseModel
        # @!attribute input_tokens
        #   The total number of tokens across the provided list of messages, system prompt,
        #     and tools.
        #
        #   @return [Integer]
        required :input_tokens, Integer

        # @!parse
        #   # @param input_tokens [Integer]
        #   #
        #   def initialize(input_tokens:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaMessageTokensCount = Beta::BetaMessageTokensCount
  end
end
