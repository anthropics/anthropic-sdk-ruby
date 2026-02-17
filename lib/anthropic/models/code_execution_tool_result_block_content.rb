# frozen_string_literal: true

module Anthropic
  module Models
    # Code execution result with encrypted stdout for PFC + web_search results.
    module CodeExecutionToolResultBlockContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::CodeExecutionToolResultError }

      variant -> { Anthropic::CodeExecutionResultBlock }

      # Code execution result with encrypted stdout for PFC + web_search results.
      variant -> { Anthropic::EncryptedCodeExecutionResultBlock }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::CodeExecutionToolResultError, Anthropic::Models::CodeExecutionResultBlock, Anthropic::Models::EncryptedCodeExecutionResultBlock)]
    end
  end
end
