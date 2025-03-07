# typed: strong

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          )
        )
      end
      def content_block
      end

      sig do
        params(
          _: T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          )
        )
          .returns(
            T.any(
              Anthropic::Models::TextBlock,
              Anthropic::Models::ToolUseBlock,
              Anthropic::Models::ThinkingBlock,
              Anthropic::Models::RedactedThinkingBlock
            )
          )
      end
      def content_block=(_)
      end

      sig { returns(Integer) }
      def index
      end

      sig { params(_: Integer).returns(Integer) }
      def index=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(
          content_block: T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          ),
          index: Integer,
          type: Symbol
        )
          .void
      end
      def initialize(content_block:, index:, type: :content_block_start)
      end

      sig do
        override
          .returns(
            {
              content_block: T.any(
                Anthropic::Models::TextBlock,
                Anthropic::Models::ToolUseBlock,
                Anthropic::Models::ThinkingBlock,
                Anthropic::Models::RedactedThinkingBlock
              ),
              index: Integer,
              type: Symbol
            }
          )
      end
      def to_hash
      end

      class ContentBlock < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::TextBlock], [Symbol, Anthropic::Models::ToolUseBlock], [Symbol, Anthropic::Models::ThinkingBlock], [Symbol, Anthropic::Models::RedactedThinkingBlock]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
