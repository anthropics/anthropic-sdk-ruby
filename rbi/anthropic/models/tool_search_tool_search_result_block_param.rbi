# typed: strong

module Anthropic
  module Models
    class ToolSearchToolSearchResultBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ToolSearchToolSearchResultBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Anthropic::ToolReferenceBlockParam]) }
      attr_accessor :tool_references

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          tool_references: T::Array[Anthropic::ToolReferenceBlockParam::OrHash],
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(tool_references:, type: :tool_search_tool_search_result)
      end

      sig do
        override.returns(
          {
            tool_references: T::Array[Anthropic::ToolReferenceBlockParam],
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
