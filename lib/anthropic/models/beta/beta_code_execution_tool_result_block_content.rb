# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaCodeExecutionToolResultBlockContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaCodeExecutionToolResultError }

        variant -> { Anthropic::Beta::BetaCodeExecutionResultBlock }

        # The output and exit code of Python code that Claude ran with the code execution tool, with standard output in encrypted form.
        #
        # The API returns this block in place of `code_execution_result` when the code called the web search tool.
        #
        # See the [programmatic tool calling guide](https://platform.claude.com/docs/en/agents-and-tools/tool-use/programmatic-tool-calling) to learn more about programmatic tool calling.
        variant -> { Anthropic::Beta::BetaEncryptedCodeExecutionResultBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCodeExecutionToolResultError, Anthropic::Models::Beta::BetaCodeExecutionResultBlock, Anthropic::Models::Beta::BetaEncryptedCodeExecutionResultBlock)]
      end
    end

    BetaCodeExecutionToolResultBlockContent = Beta::BetaCodeExecutionToolResultBlockContent
  end
end
