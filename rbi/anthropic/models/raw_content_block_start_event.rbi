# typed: strong

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RawContentBlockStartEvent,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(Anthropic::RawContentBlockStartEvent::ContentBlock::Variants)
      end
      attr_accessor :content_block

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content_block:
            T.any(
              Anthropic::TextBlock::OrHash,
              Anthropic::ToolUseBlock::OrHash,
              Anthropic::ServerToolUseBlock::OrHash,
              Anthropic::WebSearchToolResultBlock::OrHash,
              Anthropic::ThinkingBlock::OrHash,
              Anthropic::RedactedThinkingBlock::OrHash
            ),
          index: Integer,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(content_block:, index:, type: :content_block_start)
      end

      sig do
        override.returns(
          {
            content_block:
              Anthropic::RawContentBlockStartEvent::ContentBlock::Variants,
            index: Integer,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      module ContentBlock
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::TextBlock,
              Anthropic::ToolUseBlock,
              Anthropic::ServerToolUseBlock,
              Anthropic::WebSearchToolResultBlock,
              Anthropic::ThinkingBlock,
              Anthropic::RedactedThinkingBlock
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::RawContentBlockStartEvent::ContentBlock::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
