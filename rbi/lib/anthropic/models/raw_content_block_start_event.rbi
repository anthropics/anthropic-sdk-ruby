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
            Anthropic::Util::AnyHash,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          ),
          index: Integer,
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(content_block:, index:, type: :content_block_start)
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

      module ContentBlock
        extend Anthropic::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::TextBlock,
                Anthropic::Models::ToolUseBlock,
                Anthropic::Models::ThinkingBlock,
                Anthropic::Models::RedactedThinkingBlock
              )
            }
          end

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
