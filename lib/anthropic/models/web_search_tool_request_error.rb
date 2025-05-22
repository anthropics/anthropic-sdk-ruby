# frozen_string_literal: true

module Anthropic
  module Models
    class WebSearchToolRequestError < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, Anthropic::Models::WebSearchToolRequestError::ErrorCode]
      required :error_code, enum: -> { Anthropic::WebSearchToolRequestError::ErrorCode }

      # @!attribute type
      #
      #   @return [Symbol, :web_search_tool_result_error]
      required :type, const: :web_search_tool_result_error

      # @!method initialize(error_code:, type: :web_search_tool_result_error)
      #   @param error_code [Symbol, Anthropic::Models::WebSearchToolRequestError::ErrorCode]
      #   @param type [Symbol, :web_search_tool_result_error]

      # @see Anthropic::Models::WebSearchToolRequestError#error_code
      module ErrorCode
        extend Anthropic::Internal::Type::Enum

        INVALID_TOOL_INPUT = :invalid_tool_input
        UNAVAILABLE = :unavailable
        MAX_USES_EXCEEDED = :max_uses_exceeded
        TOO_MANY_REQUESTS = :too_many_requests
        QUERY_TOO_LONG = :query_too_long

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
