# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent

    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaTextBlock,
              Anthropic::Beta::BetaToolUseBlock,
              Anthropic::Beta::BetaServerToolUseBlock,
              Anthropic::Beta::BetaWebSearchToolResultBlock,
              Anthropic::Beta::BetaThinkingBlock,
              Anthropic::Beta::BetaRedactedThinkingBlock
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
            content_block:
              T.any(
                Anthropic::Beta::BetaTextBlock::OrHash,
                Anthropic::Beta::BetaToolUseBlock::OrHash,
                Anthropic::Beta::BetaServerToolUseBlock::OrHash,
                Anthropic::Beta::BetaWebSearchToolResultBlock::OrHash,
                Anthropic::Beta::BetaThinkingBlock::OrHash,
                Anthropic::Beta::BetaRedactedThinkingBlock::OrHash
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
                T.any(
                  Anthropic::Beta::BetaTextBlock,
                  Anthropic::Beta::BetaToolUseBlock,
                  Anthropic::Beta::BetaServerToolUseBlock,
                  Anthropic::Beta::BetaWebSearchToolResultBlock,
                  Anthropic::Beta::BetaThinkingBlock,
                  Anthropic::Beta::BetaRedactedThinkingBlock
                ),
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
                Anthropic::Beta::BetaTextBlock,
                Anthropic::Beta::BetaToolUseBlock,
                Anthropic::Beta::BetaServerToolUseBlock,
                Anthropic::Beta::BetaWebSearchToolResultBlock,
                Anthropic::Beta::BetaThinkingBlock,
                Anthropic::Beta::BetaRedactedThinkingBlock
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaRawContentBlockStartEvent::ContentBlock::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
