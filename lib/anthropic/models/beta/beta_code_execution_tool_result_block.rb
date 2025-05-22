# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaCodeExecutionToolResultError, Anthropic::Models::Beta::BetaCodeExecutionResultBlock]
        required :content, union: -> { Anthropic::Beta::BetaCodeExecutionToolResultBlockContent }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_tool_result]
        required :type, const: :code_execution_tool_result

        # @!method initialize(content:, tool_use_id:, type: :code_execution_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaCodeExecutionToolResultError, Anthropic::Models::Beta::BetaCodeExecutionResultBlock]
        #   @param tool_use_id [String]
        #   @param type [Symbol, :code_execution_tool_result]
      end
    end

    BetaCodeExecutionToolResultBlock = Beta::BetaCodeExecutionToolResultBlock
  end
end
