# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Code execution result with encrypted stdout for PFC + web_search results.
      module BetaCodeExecutionToolResultBlockParamContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaCodeExecutionToolResultErrorParam }

        variant -> { Anthropic::Beta::BetaCodeExecutionResultBlockParam }

        # Code execution result with encrypted stdout for PFC + web_search results.
        variant -> { Anthropic::Beta::BetaEncryptedCodeExecutionResultBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaCodeExecutionResultBlockParam, Anthropic::Models::Beta::BetaEncryptedCodeExecutionResultBlockParam)]
      end
    end

    BetaCodeExecutionToolResultBlockParamContent = Beta::BetaCodeExecutionToolResultBlockParamContent
  end
end
