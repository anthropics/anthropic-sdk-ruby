# frozen_string_literal: true

module Anthropic
  module Models
    class WebSearchToolRequestError < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, Anthropic::Models::WebSearchToolResultErrorCode]
      required :error_code, enum: -> { Anthropic::WebSearchToolResultErrorCode }

      # @!attribute type
      #
      #   @return [Symbol, :web_search_tool_result_error]
      required :type, const: :web_search_tool_result_error

      # @!method initialize(error_code:, type: :web_search_tool_result_error)
      #   @param error_code [Symbol, Anthropic::Models::WebSearchToolResultErrorCode]
      #   @param type [Symbol, :web_search_tool_result_error]
    end
  end
end
