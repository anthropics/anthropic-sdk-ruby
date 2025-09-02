# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextEditorCodeExecutionStrReplaceResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute lines
        #
        #   @return [Array<String>, nil]
        required :lines, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute new_lines
        #
        #   @return [Integer, nil]
        required :new_lines, Integer, nil?: true

        # @!attribute new_start
        #
        #   @return [Integer, nil]
        required :new_start, Integer, nil?: true

        # @!attribute old_lines
        #
        #   @return [Integer, nil]
        required :old_lines, Integer, nil?: true

        # @!attribute old_start
        #
        #   @return [Integer, nil]
        required :old_start, Integer, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :text_editor_code_execution_str_replace_result]
        required :type, const: :text_editor_code_execution_str_replace_result

        # @!method initialize(lines:, new_lines:, new_start:, old_lines:, old_start:, type: :text_editor_code_execution_str_replace_result)
        #   @param lines [Array<String>, nil]
        #   @param new_lines [Integer, nil]
        #   @param new_start [Integer, nil]
        #   @param old_lines [Integer, nil]
        #   @param old_start [Integer, nil]
        #   @param type [Symbol, :text_editor_code_execution_str_replace_result]
      end
    end

    BetaTextEditorCodeExecutionStrReplaceResultBlock = Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock
  end
end
