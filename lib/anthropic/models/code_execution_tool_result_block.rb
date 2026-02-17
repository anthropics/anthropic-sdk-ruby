# frozen_string_literal: true

module Anthropic
  module Models
    class CodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #   Code execution result with encrypted stdout for PFC + web_search results.
      #
      #   @return [Anthropic::Models::CodeExecutionToolResultError, Anthropic::Models::CodeExecutionResultBlock, Anthropic::Models::EncryptedCodeExecutionResultBlock]
      required :content, union: -> { Anthropic::CodeExecutionToolResultBlockContent }

      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :code_execution_tool_result]
      required :type, const: :code_execution_tool_result

      # @!method initialize(content:, tool_use_id:, type: :code_execution_tool_result)
      #   @param content [Anthropic::Models::CodeExecutionToolResultError, Anthropic::Models::CodeExecutionResultBlock, Anthropic::Models::EncryptedCodeExecutionResultBlock] Code execution result with encrypted stdout for PFC + web_search results.
      #
      #   @param tool_use_id [String]
      #
      #   @param type [Symbol, :code_execution_tool_result]
    end
  end
end
