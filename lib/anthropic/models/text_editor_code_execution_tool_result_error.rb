# frozen_string_literal: true

module Anthropic
  module Models
    class TextEditorCodeExecutionToolResultError < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, Anthropic::Models::TextEditorCodeExecutionToolResultErrorCode]
      required :error_code, enum: -> { Anthropic::TextEditorCodeExecutionToolResultErrorCode }

      # @!attribute error_message
      #
      #   @return [String, nil]
      required :error_message, String, nil?: true

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_code_execution_tool_result_error]
      required :type, const: :text_editor_code_execution_tool_result_error

      # @!method initialize(error_code:, error_message:, type: :text_editor_code_execution_tool_result_error)
      #   @param error_code [Symbol, Anthropic::Models::TextEditorCodeExecutionToolResultErrorCode]
      #   @param error_message [String, nil]
      #   @param type [Symbol, :text_editor_code_execution_tool_result_error]
    end
  end
end
