# typed: strong

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          content_block: Anthropic::Models::RawContentBlockStartEvent::ContentBlock::Variants,
          index: Integer,
          type: Symbol
        }
      end

      sig { returns(Anthropic::Models::RawContentBlockStartEvent::ContentBlock::Variants) }
      attr_accessor :content_block

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content_block: Anthropic::Models::RawContentBlockStartEvent::ContentBlock::Variants,
          index: Integer,
          type: Symbol
        ).void
      end
      def initialize(content_block:, index:, type: :content_block_start); end

      sig { returns(Anthropic::Models::RawContentBlockStartEvent::Shape) }
      def to_h; end

      class ContentBlock < Anthropic::Union
        abstract!

        Variants = T.type_alias { T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock) }

        sig { returns([[Symbol, Anthropic::Models::TextBlock], [Symbol, Anthropic::Models::ToolUseBlock]]) }
        private_class_method def self.variants; end
      end
    end
  end
end
