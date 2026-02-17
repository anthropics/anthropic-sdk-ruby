# frozen_string_literal: true

module Anthropic
  module Models
    # Code execution result with encrypted stdout for PFC + web_search results.
    module CodeExecutionToolResultBlockParamContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::CodeExecutionToolResultErrorParam }

      variant -> { Anthropic::CodeExecutionResultBlockParam }

      # Code execution result with encrypted stdout for PFC + web_search results.
      variant -> { Anthropic::EncryptedCodeExecutionResultBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::CodeExecutionToolResultErrorParam, Anthropic::Models::CodeExecutionResultBlockParam, Anthropic::Models::EncryptedCodeExecutionResultBlockParam)]
    end
  end
end
