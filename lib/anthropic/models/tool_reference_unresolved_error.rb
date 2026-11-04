# frozen_string_literal: true

module Anthropic
  module Models
    # A tool change or MCP tool listing references a tool or MCP server that is not
    # defined at that position in the conversation.
    class ToolReferenceUnresolvedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :tool_reference_unresolved]

      # @return [Anthropic::Models::ToolReferenceUnresolvedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ToolReferenceUnresolvedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
