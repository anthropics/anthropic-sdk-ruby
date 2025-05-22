# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebSearchToolResultError < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaWebSearchToolResultErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaWebSearchToolResultErrorCode }

        # @!attribute type
        #
        #   @return [Symbol, :web_search_tool_result_error]
        required :type, const: :web_search_tool_result_error

        # @!method initialize(error_code:, type: :web_search_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaWebSearchToolResultErrorCode]
        #   @param type [Symbol, :web_search_tool_result_error]
      end
    end

    BetaWebSearchToolResultError = Beta::BetaWebSearchToolResultError
  end
end
