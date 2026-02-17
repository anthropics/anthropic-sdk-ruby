# frozen_string_literal: true

module Anthropic
  module Models
    class BashCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Anthropic::Models::BashCodeExecutionToolResultError, Anthropic::Models::BashCodeExecutionResultBlock]
      required :content, union: -> { Anthropic::BashCodeExecutionToolResultBlock::Content }

      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :bash_code_execution_tool_result]
      required :type, const: :bash_code_execution_tool_result

      # @!method initialize(content:, tool_use_id:, type: :bash_code_execution_tool_result)
      #   @param content [Anthropic::Models::BashCodeExecutionToolResultError, Anthropic::Models::BashCodeExecutionResultBlock]
      #   @param tool_use_id [String]
      #   @param type [Symbol, :bash_code_execution_tool_result]

      # @see Anthropic::Models::BashCodeExecutionToolResultBlock#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::BashCodeExecutionToolResultError }

        variant -> { Anthropic::BashCodeExecutionResultBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::BashCodeExecutionToolResultError, Anthropic::Models::BashCodeExecutionResultBlock)]
      end
    end
  end
end
