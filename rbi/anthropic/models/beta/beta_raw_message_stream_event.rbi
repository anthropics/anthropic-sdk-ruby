# typed: strong

module Anthropic
  module Models
    BetaRawMessageStreamEvent = Beta::BetaRawMessageStreamEvent

    module Beta
      module BetaRawMessageStreamEvent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRawMessageStartEvent,
              Anthropic::Beta::BetaRawMessageDeltaEvent,
              Anthropic::Beta::BetaRawMessageStopEvent,
              Anthropic::Beta::BetaRawContentBlockStartEvent,
              Anthropic::Beta::BetaRawContentBlockDeltaEvent,
              Anthropic::Beta::BetaRawContentBlockStopEvent
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaRawMessageStreamEvent::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            message: Anthropic::Beta::BetaMessage::OrHash,
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementResponse::OrHash),
            delta:
              T.any(
                Anthropic::Beta::BetaRawMessageDeltaEvent::Delta::OrHash,
                T.any(
                  Anthropic::Beta::BetaTextDelta::OrHash,
                  Anthropic::Beta::BetaInputJSONDelta::OrHash,
                  Anthropic::Beta::BetaCitationsDelta::OrHash,
                  Anthropic::Beta::BetaThinkingDelta::OrHash,
                  Anthropic::Beta::BetaSignatureDelta::OrHash,
                  Anthropic::Beta::BetaCompactionContentBlockDelta::OrHash
                )
              ),
            usage: Anthropic::Beta::BetaMessageDeltaUsage::OrHash,
            content_block:
              T.any(
                Anthropic::Beta::BetaTextBlock::OrHash,
                Anthropic::Beta::BetaThinkingBlock::OrHash,
                Anthropic::Beta::BetaRedactedThinkingBlock::OrHash,
                Anthropic::Beta::BetaToolUseBlock::OrHash,
                Anthropic::Beta::BetaServerToolUseBlock::OrHash,
                Anthropic::Beta::BetaWebSearchToolResultBlock::OrHash,
                Anthropic::Beta::BetaWebFetchToolResultBlock::OrHash,
                Anthropic::Beta::BetaAdvisorToolResultBlock::OrHash,
                Anthropic::Beta::BetaCodeExecutionToolResultBlock::OrHash,
                Anthropic::Beta::BetaBashCodeExecutionToolResultBlock::OrHash,
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock::OrHash,
                Anthropic::Beta::BetaToolSearchToolResultBlock::OrHash,
                Anthropic::Beta::BetaMCPToolUseBlock::OrHash,
                Anthropic::Beta::BetaMCPToolResultBlock::OrHash,
                Anthropic::Beta::BetaContainerUploadBlock::OrHash,
                Anthropic::Beta::BetaCompactionBlock::OrHash,
                Anthropic::Beta::BetaFallbackBlock::OrHash
              ),
            index: Integer
          ).returns(Anthropic::Beta::BetaRawMessageStreamEvent::Variants)
        end
        def self.new(
          type:,
          message: nil,
          # Information about context management strategies applied during the request
          context_management: nil,
          delta: nil,
          # Billing and rate-limit usage.
          #
          # Anthropic's API bills and rate-limits by token counts, as tokens represent the
          # underlying cost to our systems.
          #
          # Under the hood, the API transforms requests into a format suitable for the
          # model. The model's output then goes through a parsing stage before becoming an
          # API response. As a result, the token counts in `usage` will not match one-to-one
          # with the exact visible content of an API request or response.
          #
          # For example, `output_tokens` will be non-zero, even for an empty string response
          # from Claude.
          #
          # Total input tokens in a request is the summation of `input_tokens`,
          # `cache_creation_input_tokens`, and `cache_read_input_tokens`.
          usage: nil,
          # Response model for a file uploaded to the container.
          content_block: nil,
          index: nil
        )
        end
      end
    end
  end
end
