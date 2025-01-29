# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockStartEvent = T.type_alias { Beta::BetaRawContentBlockStartEvent }

    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::BaseModel
        Shape = T.type_alias do
          {
            content_block: Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock::Variants,
            index: Integer,
            type: Symbol
          }
        end

        sig { returns(Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock::Variants) }
        attr_accessor :content_block

        sig { returns(Integer) }
        attr_accessor :index

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content_block: Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock::Variants,
            index: Integer,
            type: Symbol
          ).void
        end
        def initialize(content_block:, index:, type: :content_block_start); end

        sig { returns(Anthropic::Models::Beta::BetaRawContentBlockStartEvent::Shape) }
        def to_h; end

        class ContentBlock < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock)
          end

          sig do
            returns(
              [
                [Symbol, Anthropic::Models::Beta::BetaTextBlock],
                [Symbol, Anthropic::Models::Beta::BetaToolUseBlock]
              ]
            )
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end
