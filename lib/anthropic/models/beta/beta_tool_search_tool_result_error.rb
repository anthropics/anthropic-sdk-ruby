# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolSearchToolResultError < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolSearchToolResultError::ErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode }

        # @!attribute error_message
        #
        #   @return [String, nil]
        required :error_message, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :tool_search_tool_result_error]
        required :type, const: :tool_search_tool_result_error

        # @!method initialize(error_code:, error_message:, type: :tool_search_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaToolSearchToolResultError::ErrorCode]
        #   @param error_message [String, nil]
        #   @param type [Symbol, :tool_search_tool_result_error]

        # @see Anthropic::Models::Beta::BetaToolSearchToolResultError#error_code
        module ErrorCode
          extend Anthropic::Internal::Type::Enum

          INVALID_TOOL_INPUT = :invalid_tool_input
          UNAVAILABLE = :unavailable
          TOO_MANY_REQUESTS = :too_many_requests
          EXECUTION_TIME_EXCEEDED = :execution_time_exceeded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaToolSearchToolResultError = Beta::BetaToolSearchToolResultError
  end
end
