# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCodeExecutionToolResultErrorParam < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaCodeExecutionToolResultErrorCode }

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_tool_result_error]
        required :type, const: :code_execution_tool_result_error

        # @!method initialize(error_code:, type: :code_execution_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorCode]
        #   @param type [Symbol, :code_execution_tool_result_error]
      end
    end

    BetaCodeExecutionToolResultErrorParam = Beta::BetaCodeExecutionToolResultErrorParam
  end
end
