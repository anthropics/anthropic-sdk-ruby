# frozen_string_literal: true

module Anthropic
  module Models
    class BashCodeExecutionToolResultError < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, Anthropic::Models::BashCodeExecutionToolResultErrorCode]
      required :error_code, enum: -> { Anthropic::BashCodeExecutionToolResultErrorCode }

      # @!attribute type
      #
      #   @return [Symbol, :bash_code_execution_tool_result_error]
      required :type, const: :bash_code_execution_tool_result_error

      # @!method initialize(error_code:, type: :bash_code_execution_tool_result_error)
      #   @param error_code [Symbol, Anthropic::Models::BashCodeExecutionToolResultErrorCode]
      #   @param type [Symbol, :bash_code_execution_tool_result_error]
    end
  end
end
