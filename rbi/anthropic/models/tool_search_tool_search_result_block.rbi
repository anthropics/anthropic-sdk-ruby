# typed: strong

module Anthropic
  module Models
    class ToolSearchToolSearchResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ToolSearchToolSearchResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Anthropic::ToolReferenceBlock]) }
      attr_accessor :tool_references

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          tool_references: T::Array[Anthropic::ToolReferenceBlock::OrHash],
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(tool_references:, type: :tool_search_tool_search_result)
      end

      sig do
        override.returns(
          {
            tool_references: T::Array[Anthropic::ToolReferenceBlock],
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
