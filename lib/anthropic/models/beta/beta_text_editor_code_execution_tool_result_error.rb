# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextEditorCodeExecutionToolResultError < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode }

        # @!attribute error_message
        #
        #   @return [String, nil]
        required :error_message, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :text_editor_code_execution_tool_result_error]
        required :type, const: :text_editor_code_execution_tool_result_error

        # @!method initialize(error_code:, error_message:, type: :text_editor_code_execution_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode]
        #   @param error_message [String, nil]
        #   @param type [Symbol, :text_editor_code_execution_tool_result_error]

        # @see Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultError#error_code
        module ErrorCode
          extend Anthropic::Internal::Type::Enum

          INVALID_TOOL_INPUT = :invalid_tool_input
          UNAVAILABLE = :unavailable
          TOO_MANY_REQUESTS = :too_many_requests
          EXECUTION_TIME_EXCEEDED = :execution_time_exceeded
          FILE_NOT_FOUND = :file_not_found

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaTextEditorCodeExecutionToolResultError = Beta::BetaTextEditorCodeExecutionToolResultError
  end
end
