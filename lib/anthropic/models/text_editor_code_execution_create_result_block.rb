# frozen_string_literal: true

module Anthropic
  module Models
    class TextEditorCodeExecutionCreateResultBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute is_file_update
      #
      #   @return [Boolean]
      required :is_file_update, Anthropic::Internal::Type::Boolean

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_code_execution_create_result]
      required :type, const: :text_editor_code_execution_create_result

      # @!method initialize(is_file_update:, type: :text_editor_code_execution_create_result)
      #   @param is_file_update [Boolean]
      #   @param type [Symbol, :text_editor_code_execution_create_result]
    end
  end
end
