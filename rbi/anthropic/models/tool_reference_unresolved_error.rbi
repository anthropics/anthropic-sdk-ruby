# typed: strong

module Anthropic
  module Models
    # A tool change or MCP tool listing references a tool or MCP server that is not
    # defined at that position in the conversation.
    class ToolReferenceUnresolvedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ToolReferenceUnresolvedErrorDetails) }
      def details
      end
    end
  end
end
