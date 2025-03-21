# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::BaseModel
        sig do
          returns(
            T.any(
              Anthropic::Models::Beta::BetaTextBlock,
              Anthropic::Models::Beta::BetaToolUseBlock,
              Anthropic::Models::Beta::BetaThinkingBlock,
              Anthropic::Models::Beta::BetaRedactedThinkingBlock
            )
          )
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
              Anthropic::Util::AnyHash,
              Anthropic::Models::Beta::BetaToolUseBlock,
              Anthropic::Models::Beta::BetaThinkingBlock,
              Anthropic::Models::Beta::BetaRedactedThinkingBlock
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
                  Anthropic::Models::Beta::BetaTextBlock,
                  Anthropic::Models::Beta::BetaToolUseBlock,
                  Anthropic::Models::Beta::BetaThinkingBlock,
                  Anthropic::Models::Beta::BetaRedactedThinkingBlock
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

          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock]
              )
          end
          def self.variants
          end
        end
      end
    end

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
