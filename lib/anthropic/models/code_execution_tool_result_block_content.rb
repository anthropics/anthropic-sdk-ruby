# frozen_string_literal: true

module Anthropic
  module Models
    module CodeExecutionToolResultBlockContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::CodeExecutionToolResultError }

      variant -> { Anthropic::CodeExecutionResultBlock }

      # The output and exit code of Python code that Claude ran with the code execution tool, with standard output in encrypted form.
      #
      # The API returns this block in place of `code_execution_result` when the code called the web search tool.
      #
      # See the [programmatic tool calling guide](https://platform.claude.com/docs/en/agents-and-tools/tool-use/programmatic-tool-calling) to learn more about programmatic tool calling.
      variant -> { Anthropic::EncryptedCodeExecutionResultBlock }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::CodeExecutionToolResultError, Anthropic::Models::CodeExecutionResultBlock, Anthropic::Models::EncryptedCodeExecutionResultBlock)]
    end
  end
end
