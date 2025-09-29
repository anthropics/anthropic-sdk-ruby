# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Messages#count_tokens
      class BetaMessageTokensCount < Anthropic::Internal::Type::BaseModel
        # @!attribute context_management
        #   Information about context management applied to the message.
        #
        #   @return [Anthropic::Models::Beta::BetaCountTokensContextManagementResponse, nil]
        required :context_management,
                 -> {
                   Anthropic::Beta::BetaCountTokensContextManagementResponse
                 },
                 nil?: true

        # @!attribute input_tokens
        #   The total number of tokens across the provided list of messages, system prompt,
        #   and tools.
        #
        #   @return [Integer]
        required :input_tokens, Integer

        # @!method initialize(context_management:, input_tokens:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaMessageTokensCount} for more details.
        #
        #   @param context_management [Anthropic::Models::Beta::BetaCountTokensContextManagementResponse, nil] Information about context management applied to the message.
        #
        #   @param input_tokens [Integer] The total number of tokens across the provided list of messages, system prompt,
      end
    end

    BetaMessageTokensCount = Beta::BetaMessageTokensCount
  end
end
