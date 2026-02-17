# frozen_string_literal: true

module Anthropic
  module Models
    class CodeExecutionToolResultErrorParam < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, Anthropic::Models::CodeExecutionToolResultErrorCode]
      required :error_code, enum: -> { Anthropic::CodeExecutionToolResultErrorCode }

      # @!attribute type
      #
      #   @return [Symbol, :code_execution_tool_result_error]
      required :type, const: :code_execution_tool_result_error

      # @!method initialize(error_code:, type: :code_execution_tool_result_error)
      #   @param error_code [Symbol, Anthropic::Models::CodeExecutionToolResultErrorCode]
      #   @param type [Symbol, :code_execution_tool_result_error]
    end
  end
end
