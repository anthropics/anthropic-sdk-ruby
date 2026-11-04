# frozen_string_literal: true

module Anthropic
  module Models
    # A tool made available in `messages` takes a name that an available tool of
    # another kind, or of another MCP server, already holds.
    class ToolNameConflictError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :tool_name_conflict]

      # @return [Anthropic::Models::ToolNameConflictErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ToolNameConflictErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
