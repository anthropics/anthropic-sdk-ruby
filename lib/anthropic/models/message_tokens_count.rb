# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # message_tokens_count => {
    #   input_tokens: Integer
    # }
    # ```
    class MessageTokensCount < Anthropic::BaseModel
      # @!attribute input_tokens
      #   The total number of tokens across the provided list of messages, system prompt, and tools.
      #
      #   @return [Integer]
      required :input_tokens, Integer

      # @!parse
      #   # @param input_tokens [Integer] The total number of tokens across the provided list of messages, system prompt,
      #   #   and tools.
      #   #
      #   def initialize(input_tokens:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
