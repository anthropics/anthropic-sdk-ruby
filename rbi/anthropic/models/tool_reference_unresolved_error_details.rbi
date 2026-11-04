# typed: strong

module Anthropic
  module Models
    class ToolReferenceUnresolvedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ToolReferenceUnresolvedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # A tool change or MCP tool listing references a tool or MCP server that is not
      # defined at that position in the conversation.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :tool_reference_unresolved)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
