# typed: strong

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::BaseModel
      sig { returns(T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock)) }
      attr_accessor :content_block

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content_block: T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock),
          index: Integer,
          type: Symbol
        ).void
      end
      def initialize(content_block:, index:, type: :content_block_start); end

      sig do
        override.returns(
          {
            content_block: T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock),
            index: Integer,
            type: Symbol
          }
        )
      end
      def to_hash; end

      class ContentBlock < Anthropic::Union
        abstract!

        sig do
          override.returns(
            [
              [Symbol, Anthropic::Models::TextBlock],
              [Symbol, Anthropic::Models::ToolUseBlock]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
