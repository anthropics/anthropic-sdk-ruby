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

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaRawMessageStreamEvent::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_START =
            T.let(
              :message_start,
              Anthropic::Beta::BetaRawMessageStreamEvent::Type::TaggedSymbol
            )
          MESSAGE_DELTA =
            T.let(
              :message_delta,
              Anthropic::Beta::BetaRawMessageStreamEvent::Type::TaggedSymbol
            )
          MESSAGE_STOP =
            T.let(
              :message_stop,
              Anthropic::Beta::BetaRawMessageStreamEvent::Type::TaggedSymbol
            )
          CONTENT_BLOCK_START =
            T.let(
              :content_block_start,
              Anthropic::Beta::BetaRawMessageStreamEvent::Type::TaggedSymbol
            )
          CONTENT_BLOCK_DELTA =
            T.let(
              :content_block_delta,
              Anthropic::Beta::BetaRawMessageStreamEvent::Type::TaggedSymbol
            )
          CONTENT_BLOCK_STOP =
            T.let(
              :content_block_stop,
              Anthropic::Beta::BetaRawMessageStreamEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaRawMessageStreamEvent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
            input_transformations:
              T.nilable(
                T::Array[
                  Anthropic::Beta::BetaThinkingDroppedInputTransformation::OrHash
                ]
              ),
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
          # Changes the API made to the request's input before showing it to the model: one
          # entry per change, in request order. Today the only entry type is
          # `thinking_dropped` — a `thinking`, `redacted_thinking` or `connector_text` block
          # from the request's `messages` that was removed from the prompt instead of being
          # shown to the model because it failed a binding check. More entry types may be
          # added over time; ignore types you do not recognize.
          #
          # Requires `anthropic-beta: thinking-binding-controls-2026-08-01`. Present on
          # every such response from a model that supports extended thinking, as `[]` when
          # nothing was changed; without the beta, blocks are removed all the same but
          # nothing is reported. Removed blocks contribute nothing to `usage.input_tokens`.
          # When streaming, the array is final in `message_start`; the final `message_delta`
          # event carries it only when a server-side model fallback happened mid-stream, in
          # which case it holds the serving model's entries and replaces the one in
          # `message_start`.
          input_transformations: nil,
          # Response model for a file uploaded to the container.
          content_block: nil,
          index: nil
        )
        end
      end
    end
  end
end
