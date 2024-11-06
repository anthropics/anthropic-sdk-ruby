# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageTokensCount < Anthropic::BaseModel
      # @!attribute [rw] input_tokens
      #   The total number of tokens across the provided list of messages, system prompt, and tools.
      #   @return [Integer]
      required :input_tokens, Integer

      # @!parse
      #   # Create a new instance of BetaMessageTokensCount from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :input_tokens The total number of tokens across the provided list of messages, system prompt,
      #   #     and tools.
      #   def initialize(data = {}) = super
    end
  end
end
