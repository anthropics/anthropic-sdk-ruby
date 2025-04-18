# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Messages#count_tokens
    class MessageTokensCount < Anthropic::Internal::Type::BaseModel
      # @!attribute input_tokens
      #   The total number of tokens across the provided list of messages, system prompt,
      #   and tools.
      #
      #   @return [Integer]
      required :input_tokens, Integer

      # @!method initialize(input_tokens:)
      #   @param input_tokens [Integer]
    end
  end
end
