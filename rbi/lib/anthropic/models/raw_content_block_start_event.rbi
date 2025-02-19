# typed: strong

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::BaseModel
      sig { returns(T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock)) }
      def content_block
      end

      sig do
        params(_: T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock))
          .returns(T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock))
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
          content_block: T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock),
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
              content_block: T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock),
              index: Integer,
              type: Symbol
            }
          )
      end
      def to_hash
      end

      class ContentBlock < Anthropic::Union
        abstract!

        sig { override.returns([[Symbol, Anthropic::Models::TextBlock], [Symbol, Anthropic::Models::ToolUseBlock]]) }
        private_class_method def self.variants
        end
      end
    end
  end
end
