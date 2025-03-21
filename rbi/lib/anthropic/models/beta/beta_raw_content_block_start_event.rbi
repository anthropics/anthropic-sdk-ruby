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
        def content_block
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaTextBlock,
              Anthropic::Models::Beta::BetaToolUseBlock,
              Anthropic::Models::Beta::BetaThinkingBlock,
              Anthropic::Models::Beta::BetaRedactedThinkingBlock
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaTextBlock,
                Anthropic::Models::Beta::BetaToolUseBlock,
                Anthropic::Models::Beta::BetaThinkingBlock,
                Anthropic::Models::Beta::BetaRedactedThinkingBlock
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

          Variants =
            type_template(:out) do
              {
                fixed: T.any(
                  Anthropic::Models::Beta::BetaTextBlock,
                  Anthropic::Models::Beta::BetaToolUseBlock,
                  Anthropic::Models::Beta::BetaThinkingBlock,
                  Anthropic::Models::Beta::BetaRedactedThinkingBlock
                )
              }
            end

          class << self
            sig do
              override
                .returns(
                  [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock]
                )
            end
            def variants
            end
          end
        end
      end
    end

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
