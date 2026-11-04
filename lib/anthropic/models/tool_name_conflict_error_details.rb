# frozen_string_literal: true

module Anthropic
  module Models
    class ToolNameConflictErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :tool_name_conflict]
      required :error_code, const: :tool_name_conflict

      # @!method initialize(error_code: :tool_name_conflict)
      #   A tool made available in `messages` takes a name that an available tool of
      #   another kind, or of another MCP server, already holds.
      #
      #   @param error_code [Symbol, :tool_name_conflict]
    end
  end
end
