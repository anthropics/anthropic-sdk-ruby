# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextEditorCodeExecutionViewResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String]
        required :content, String

        # @!attribute file_type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlockParam::FileType]
        required :file_type,
                 enum: -> { Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlockParam::FileType }

        # @!attribute type
        #
        #   @return [Symbol, :text_editor_code_execution_view_result]
        required :type, const: :text_editor_code_execution_view_result

        # @!attribute num_lines
        #
        #   @return [Integer, nil]
        optional :num_lines, Integer, nil?: true

        # @!attribute start_line
        #
        #   @return [Integer, nil]
        optional :start_line, Integer, nil?: true

        # @!attribute total_lines
        #
        #   @return [Integer, nil]
        optional :total_lines, Integer, nil?: true

        # @!method initialize(content:, file_type:, num_lines: nil, start_line: nil, total_lines: nil, type: :text_editor_code_execution_view_result)
        #   @param content [String]
        #   @param file_type [Symbol, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlockParam::FileType]
        #   @param num_lines [Integer, nil]
        #   @param start_line [Integer, nil]
        #   @param total_lines [Integer, nil]
        #   @param type [Symbol, :text_editor_code_execution_view_result]

        # @see Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlockParam#file_type
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

    BetaTextEditorCodeExecutionViewResultBlockParam = Beta::BetaTextEditorCodeExecutionViewResultBlockParam
  end
end
