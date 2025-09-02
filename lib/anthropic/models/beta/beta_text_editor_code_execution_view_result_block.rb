# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextEditorCodeExecutionViewResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String]
        required :content, String

        # @!attribute file_type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType]
        required :file_type, enum: -> { Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType }

        # @!attribute num_lines
        #
        #   @return [Integer, nil]
        required :num_lines, Integer, nil?: true

        # @!attribute start_line
        #
        #   @return [Integer, nil]
        required :start_line, Integer, nil?: true

        # @!attribute total_lines
        #
        #   @return [Integer, nil]
        required :total_lines, Integer, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :text_editor_code_execution_view_result]
        required :type, const: :text_editor_code_execution_view_result

        # @!method initialize(content:, file_type:, num_lines:, start_line:, total_lines:, type: :text_editor_code_execution_view_result)
        #   @param content [String]
        #   @param file_type [Symbol, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlock::FileType]
        #   @param num_lines [Integer, nil]
        #   @param start_line [Integer, nil]
        #   @param total_lines [Integer, nil]
        #   @param type [Symbol, :text_editor_code_execution_view_result]

        # @see Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlock#file_type
        module FileType
          extend Anthropic::Internal::Type::Enum

          TEXT = :text
          IMAGE = :image
          PDF = :pdf

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaTextEditorCodeExecutionViewResultBlock = Beta::BetaTextEditorCodeExecutionViewResultBlock
  end
end
