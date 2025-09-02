# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextEditorCodeExecutionStrReplaceResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :text_editor_code_execution_str_replace_result]
        required :type, const: :text_editor_code_execution_str_replace_result

        # @!attribute lines
        #
        #   @return [Array<String>, nil]
        optional :lines, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute new_lines
        #
        #   @return [Integer, nil]
        optional :new_lines, Integer, nil?: true

        # @!attribute new_start
        #
        #   @return [Integer, nil]
        optional :new_start, Integer, nil?: true

        # @!attribute old_lines
        #
        #   @return [Integer, nil]
        optional :old_lines, Integer, nil?: true

        # @!attribute old_start
        #
        #   @return [Integer, nil]
        optional :old_start, Integer, nil?: true

        # @!method initialize(lines: nil, new_lines: nil, new_start: nil, old_lines: nil, old_start: nil, type: :text_editor_code_execution_str_replace_result)
        #   @param lines [Array<String>, nil]
        #   @param new_lines [Integer, nil]
        #   @param new_start [Integer, nil]
        #   @param old_lines [Integer, nil]
        #   @param old_start [Integer, nil]
        #   @param type [Symbol, :text_editor_code_execution_str_replace_result]
      end
    end

    BetaTextEditorCodeExecutionStrReplaceResultBlockParam =
      Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam
  end
end
