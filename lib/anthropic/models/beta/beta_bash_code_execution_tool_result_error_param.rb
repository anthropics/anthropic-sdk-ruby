# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBashCodeExecutionToolResultErrorParam < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode }

        # @!attribute type
        #
        #   @return [Symbol, :bash_code_execution_tool_result_error]
        required :type, const: :bash_code_execution_tool_result_error

        # @!method initialize(error_code:, type: :bash_code_execution_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode]
        #   @param type [Symbol, :bash_code_execution_tool_result_error]

        # @see Anthropic::Models::Beta::BetaBashCodeExecutionToolResultErrorParam#error_code
        module ErrorCode
          extend Anthropic::Internal::Type::Enum

          INVALID_TOOL_INPUT = :invalid_tool_input
          UNAVAILABLE = :unavailable
          TOO_MANY_REQUESTS = :too_many_requests
          EXECUTION_TIME_EXCEEDED = :execution_time_exceeded
          OUTPUT_FILE_TOO_LARGE = :output_file_too_large

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaBashCodeExecutionToolResultErrorParam = Beta::BetaBashCodeExecutionToolResultErrorParam
  end
end
