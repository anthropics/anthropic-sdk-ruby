# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextEditorCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultError, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionCreateResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock]
        required :content, union: -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock::Content }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :text_editor_code_execution_tool_result]
        required :type, const: :text_editor_code_execution_tool_result

        # @!method initialize(content:, tool_use_id:, type: :text_editor_code_execution_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultError, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionCreateResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock]
        #   @param tool_use_id [String]
        #   @param type [Symbol, :text_editor_code_execution_tool_result]

        # @see Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlock#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError }

          variant -> { Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock }

          variant -> { Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlock }

          variant -> { Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultError, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionCreateResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock)]
        end
      end
    end

    BetaTextEditorCodeExecutionToolResultBlock = Beta::BetaTextEditorCodeExecutionToolResultBlock
  end
end
