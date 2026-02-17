# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Code execution result with encrypted stdout for PFC + web_search results.
      module BetaCodeExecutionToolResultBlockContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaCodeExecutionToolResultError }

        variant -> { Anthropic::Beta::BetaCodeExecutionResultBlock }

        # Code execution result with encrypted stdout for PFC + web_search results.
        variant -> { Anthropic::Beta::BetaEncryptedCodeExecutionResultBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCodeExecutionToolResultError, Anthropic::Models::Beta::BetaCodeExecutionResultBlock, Anthropic::Models::Beta::BetaEncryptedCodeExecutionResultBlock)]
      end
    end

    BetaCodeExecutionToolResultBlockContent = Beta::BetaCodeExecutionToolResultBlockContent
  end
end
