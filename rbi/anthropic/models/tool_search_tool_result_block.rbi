# typed: strong

module Anthropic
  module Models
    class ToolSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ToolSearchToolResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Anthropic::ToolSearchToolResultBlock::Content::Variants) }
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content:
            T.any(
              Anthropic::ToolSearchToolResultError::OrHash,
              Anthropic::ToolSearchToolSearchResultBlock::OrHash
            ),
          tool_use_id: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(content:, tool_use_id:, type: :tool_search_tool_result)
      end

      sig do
        override.returns(
          {
            content: Anthropic::ToolSearchToolResultBlock::Content::Variants,
            tool_use_id: String,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::ToolSearchToolResultError,
              Anthropic::ToolSearchToolSearchResultBlock
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::ToolSearchToolResultBlock::Content::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
