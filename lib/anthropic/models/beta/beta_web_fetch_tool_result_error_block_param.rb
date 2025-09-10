# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchToolResultErrorBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaWebFetchToolResultErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaWebFetchToolResultErrorCode }

        # @!attribute type
        #
        #   @return [Symbol, :web_fetch_tool_result_error]
        required :type, const: :web_fetch_tool_result_error

        # @!method initialize(error_code:, type: :web_fetch_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaWebFetchToolResultErrorCode]
        #   @param type [Symbol, :web_fetch_tool_result_error]
      end
    end

    BetaWebFetchToolResultErrorBlockParam = Beta::BetaWebFetchToolResultErrorBlockParam
  end
end
