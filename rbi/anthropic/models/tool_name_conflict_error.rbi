# typed: strong

module Anthropic
  module Models
    # A tool made available in `messages` takes a name that an available tool of
    # another kind, or of another MCP server, already holds.
    class ToolNameConflictError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ToolNameConflictErrorDetails) }
      def details
      end
    end
  end
end
