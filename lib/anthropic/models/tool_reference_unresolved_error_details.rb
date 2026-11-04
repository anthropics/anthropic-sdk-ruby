# frozen_string_literal: true

module Anthropic
  module Models
    class ToolReferenceUnresolvedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :tool_reference_unresolved]
      required :error_code, const: :tool_reference_unresolved

      # @!method initialize(error_code: :tool_reference_unresolved)
      #   A tool change or MCP tool listing references a tool or MCP server that is not
      #   defined at that position in the conversation.
      #
      #   @param error_code [Symbol, :tool_reference_unresolved]
    end
  end
end
