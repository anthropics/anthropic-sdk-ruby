# frozen_string_literal: true

module Anthropic
  module Models
    class TextEditorCodeExecutionToolResultErrorParam < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, Anthropic::Models::TextEditorCodeExecutionToolResultErrorCode]
      required :error_code, enum: -> { Anthropic::TextEditorCodeExecutionToolResultErrorCode }

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_code_execution_tool_result_error]
      required :type, const: :text_editor_code_execution_tool_result_error

      # @!attribute error_message
      #
      #   @return [String, nil]
      optional :error_message, String, nil?: true

      # @!method initialize(error_code:, error_message: nil, type: :text_editor_code_execution_tool_result_error)
      #   @param error_code [Symbol, Anthropic::Models::TextEditorCodeExecutionToolResultErrorCode]
      #   @param error_message [String, nil]
      #   @param type [Symbol, :text_editor_code_execution_tool_result_error]
    end
  end
end
