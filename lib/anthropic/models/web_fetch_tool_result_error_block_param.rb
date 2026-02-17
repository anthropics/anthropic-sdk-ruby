# frozen_string_literal: true

module Anthropic
  module Models
    class WebFetchToolResultErrorBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, Anthropic::Models::WebFetchToolResultErrorCode]
      required :error_code, enum: -> { Anthropic::WebFetchToolResultErrorCode }

      # @!attribute type
      #
      #   @return [Symbol, :web_fetch_tool_result_error]
      required :type, const: :web_fetch_tool_result_error

      # @!method initialize(error_code:, type: :web_fetch_tool_result_error)
      #   @param error_code [Symbol, Anthropic::Models::WebFetchToolResultErrorCode]
      #   @param type [Symbol, :web_fetch_tool_result_error]
    end
  end
end
