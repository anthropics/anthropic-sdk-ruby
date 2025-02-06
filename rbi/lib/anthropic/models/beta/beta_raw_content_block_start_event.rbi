# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockStartEvent = T.type_alias { Beta::BetaRawContentBlockStartEvent }

    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::BaseModel
        sig do
          returns(T.any(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock))
        end
        attr_accessor :content_block

        sig { returns(Integer) }
        attr_accessor :index

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content_block: T.any(
              Anthropic::Models::Beta::BetaTextBlock,
              Anthropic::Models::Beta::BetaToolUseBlock
            ),
            index: Integer,
            type: Symbol
          ).void
        end
        def initialize(content_block:, index:, type: :content_block_start)
        end

        sig do
          override.returns(
            {
              content_block: T.any(
                Anthropic::Models::Beta::BetaTextBlock,
                Anthropic::Models::Beta::BetaToolUseBlock
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

          sig do
            override.returns(
              [
                [Symbol, Anthropic::Models::Beta::BetaTextBlock],
                [Symbol, Anthropic::Models::Beta::BetaToolUseBlock]
              ]
            )
          end
          private_class_method def self.variants
          end
        end
      end
    end
  end
end
