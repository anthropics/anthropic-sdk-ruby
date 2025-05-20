# typed: strong

module Anthropic
  module Models
    class WebSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WebSearchToolResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Anthropic::WebSearchToolResultBlockContent::Variants) }
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content:
            T.any(
              Anthropic::WebSearchToolResultError::OrHash,
              T::Array[Anthropic::WebSearchResultBlock::OrHash]
            ),
          tool_use_id: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(content:, tool_use_id:, type: :web_search_tool_result)
      end

      sig do
        override.returns(
          {
            content: Anthropic::WebSearchToolResultBlockContent::Variants,
            tool_use_id: String,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
