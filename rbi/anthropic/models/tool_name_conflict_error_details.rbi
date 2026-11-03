# typed: strong

module Anthropic
  module Models
    class ToolNameConflictErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ToolNameConflictErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # A tool made available in `messages` takes a name that an available tool of
      # another kind, or of another MCP server, already holds.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :tool_name_conflict)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
