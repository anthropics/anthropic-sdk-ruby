# frozen_string_literal: true

module Anthropic
  module Models
    module TextEditorCodeExecutionToolResultErrorCode
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
