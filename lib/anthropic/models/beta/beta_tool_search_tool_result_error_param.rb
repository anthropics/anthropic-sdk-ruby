# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolSearchToolResultErrorParam < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolSearchToolResultErrorParam::ErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode }

        # @!attribute type
        #
        #   @return [Symbol, :tool_search_tool_result_error]
        required :type, const: :tool_search_tool_result_error

        # @!method initialize(error_code:, type: :tool_search_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaToolSearchToolResultErrorParam::ErrorCode]
        #   @param type [Symbol, :tool_search_tool_result_error]

        # @see Anthropic::Models::Beta::BetaToolSearchToolResultErrorParam#error_code
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

    BetaToolSearchToolResultErrorParam = Beta::BetaToolSearchToolResultErrorParam
  end
end
