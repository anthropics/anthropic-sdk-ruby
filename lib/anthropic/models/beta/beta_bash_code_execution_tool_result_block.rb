# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBashCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaBashCodeExecutionToolResultError, Anthropic::Models::Beta::BetaBashCodeExecutionResultBlock]
        required :content, union: -> { Anthropic::Beta::BetaBashCodeExecutionToolResultBlock::Content }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :bash_code_execution_tool_result]
        required :type, const: :bash_code_execution_tool_result

        # @!method initialize(content:, tool_use_id:, type: :bash_code_execution_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaBashCodeExecutionToolResultError, Anthropic::Models::Beta::BetaBashCodeExecutionResultBlock]
        #   @param tool_use_id [String]
        #   @param type [Symbol, :bash_code_execution_tool_result]

        # @see Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlock#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaBashCodeExecutionToolResultError }

          variant -> { Anthropic::Beta::BetaBashCodeExecutionResultBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaBashCodeExecutionToolResultError, Anthropic::Models::Beta::BetaBashCodeExecutionResultBlock)]
        end
      end
    end

    BetaBashCodeExecutionToolResultBlock = Beta::BetaBashCodeExecutionToolResultBlock
  end
end
