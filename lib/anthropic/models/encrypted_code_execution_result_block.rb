# frozen_string_literal: true

module Anthropic
  module Models
    class EncryptedCodeExecutionResultBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Array<Anthropic::Models::CodeExecutionOutputBlock>]
      required :content, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::CodeExecutionOutputBlock] }

      # @!attribute encrypted_stdout
      #
      #   @return [String]
      required :encrypted_stdout, String

      # @!attribute return_code
      #
      #   @return [Integer]
      required :return_code, Integer

      # @!attribute stderr
      #
      #   @return [String]
      required :stderr, String

      # @!attribute type
      #
      #   @return [Symbol, :encrypted_code_execution_result]
      required :type, const: :encrypted_code_execution_result

      # @!method initialize(content:, encrypted_stdout:, return_code:, stderr:, type: :encrypted_code_execution_result)
      #   The output and exit code of Python code that Claude ran with the code execution
      #   tool, with standard output in encrypted form.
      #
      #   The API returns this block in place of `code_execution_result` when the code
      #   called the web search tool.
      #
      #   See the
      #   [programmatic tool calling guide](https://platform.claude.com/docs/en/agents-and-tools/tool-use/programmatic-tool-calling)
      #   to learn more about programmatic tool calling.
      #
      #   @param content [Array<Anthropic::Models::CodeExecutionOutputBlock>]
      #   @param encrypted_stdout [String]
      #   @param return_code [Integer]
      #   @param stderr [String]
      #   @param type [Symbol, :encrypted_code_execution_result]
    end
  end
end
