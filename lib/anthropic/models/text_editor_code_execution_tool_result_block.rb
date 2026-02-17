# frozen_string_literal: true

module Anthropic
  module Models
    class TextEditorCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Anthropic::Models::TextEditorCodeExecutionToolResultError, Anthropic::Models::TextEditorCodeExecutionViewResultBlock, Anthropic::Models::TextEditorCodeExecutionCreateResultBlock, Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlock]
      required :content, union: -> { Anthropic::TextEditorCodeExecutionToolResultBlock::Content }

      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_code_execution_tool_result]
      required :type, const: :text_editor_code_execution_tool_result

      # @!method initialize(content:, tool_use_id:, type: :text_editor_code_execution_tool_result)
      #   @param content [Anthropic::Models::TextEditorCodeExecutionToolResultError, Anthropic::Models::TextEditorCodeExecutionViewResultBlock, Anthropic::Models::TextEditorCodeExecutionCreateResultBlock, Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlock]
      #   @param tool_use_id [String]
      #   @param type [Symbol, :text_editor_code_execution_tool_result]

      # @see Anthropic::Models::TextEditorCodeExecutionToolResultBlock#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::TextEditorCodeExecutionToolResultError }

        variant -> { Anthropic::TextEditorCodeExecutionViewResultBlock }

        variant -> { Anthropic::TextEditorCodeExecutionCreateResultBlock }

        variant -> { Anthropic::TextEditorCodeExecutionStrReplaceResultBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::TextEditorCodeExecutionToolResultError, Anthropic::Models::TextEditorCodeExecutionViewResultBlock, Anthropic::Models::TextEditorCodeExecutionCreateResultBlock, Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlock)]
      end
    end
  end
end
