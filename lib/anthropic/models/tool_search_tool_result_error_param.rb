# frozen_string_literal: true

module Anthropic
  module Models
    class ToolSearchToolResultErrorParam < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, Anthropic::Models::ToolSearchToolResultErrorCode]
      required :error_code, enum: -> { Anthropic::ToolSearchToolResultErrorCode }

      # @!attribute type
      #
      #   @return [Symbol, :tool_search_tool_result_error]
      required :type, const: :tool_search_tool_result_error

      # @!attribute error_message
      #
      #   @return [String, nil]
      optional :error_message, String, nil?: true

      # @!method initialize(error_code:, error_message: nil, type: :tool_search_tool_result_error)
      #   @param error_code [Symbol, Anthropic::Models::ToolSearchToolResultErrorCode]
      #   @param error_message [String, nil]
      #   @param type [Symbol, :tool_search_tool_result_error]
    end
  end
end
