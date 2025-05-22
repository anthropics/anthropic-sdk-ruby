# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent

    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRawContentBlockStartEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # Response model for a file uploaded to the container.
        sig do
          returns(
            Anthropic::Beta::BetaRawContentBlockStartEvent::ContentBlock::Variants
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
                Anthropic::Beta::BetaCodeExecutionToolResultBlock::OrHash,
                Anthropic::Beta::BetaMCPToolUseBlock::OrHash,
                Anthropic::Beta::BetaMCPToolResultBlock::OrHash,
                Anthropic::Beta::BetaContainerUploadBlock::OrHash,
                Anthropic::Beta::BetaThinkingBlock::OrHash,
                Anthropic::Beta::BetaRedactedThinkingBlock::OrHash
              ),
            index: Integer,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Response model for a file uploaded to the container.
          content_block:,
          index:,
          type: :content_block_start
        )
        end

        sig do
          override.returns(
            {
              content_block:
                Anthropic::Beta::BetaRawContentBlockStartEvent::ContentBlock::Variants,
              index: Integer,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # Response model for a file uploaded to the container.
        module ContentBlock
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaTextBlock,
                Anthropic::Beta::BetaToolUseBlock,
                Anthropic::Beta::BetaServerToolUseBlock,
                Anthropic::Beta::BetaWebSearchToolResultBlock,
                Anthropic::Beta::BetaCodeExecutionToolResultBlock,
                Anthropic::Beta::BetaMCPToolUseBlock,
                Anthropic::Beta::BetaMCPToolResultBlock,
                Anthropic::Beta::BetaContainerUploadBlock,
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
