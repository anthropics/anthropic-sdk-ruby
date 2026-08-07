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
                Anthropic::Beta::BetaThinkingBlock,
                Anthropic::Beta::BetaRedactedThinkingBlock,
                Anthropic::Beta::BetaToolUseBlock,
                Anthropic::Beta::BetaServerToolUseBlock,
                Anthropic::Beta::BetaWebSearchToolResultBlock,
                Anthropic::Beta::BetaWebFetchToolResultBlock,
                Anthropic::Beta::BetaAdvisorToolResultBlock,
                Anthropic::Beta::BetaCodeExecutionToolResultBlock,
                Anthropic::Beta::BetaBashCodeExecutionToolResultBlock,
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock,
                Anthropic::Beta::BetaToolSearchToolResultBlock,
                Anthropic::Beta::BetaMCPToolUseBlock,
                Anthropic::Beta::BetaMCPToolResultBlock,
                Anthropic::Beta::BetaContainerUploadBlock,
                Anthropic::Beta::BetaCompactionBlock,
                Anthropic::Beta::BetaFallbackBlock
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

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              citations:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaCitationCharLocation::OrHash,
                      Anthropic::Beta::BetaCitationPageLocation::OrHash,
                      Anthropic::Beta::BetaCitationContentBlockLocation::OrHash,
                      Anthropic::Beta::BetaCitationsWebSearchResultLocation::OrHash,
                      Anthropic::Beta::BetaCitationSearchResultLocation::OrHash
                    )
                  ]
                ),
              text: String,
              signature: String,
              thinking: String,
              data: String,
              id: String,
              input: T::Hash[Symbol, T.anything],
              name:
                T.any(
                  String,
                  Anthropic::Beta::BetaServerToolUseBlock::Name::OrSymbol
                ),
              caller_:
                T.any(
                  Anthropic::Beta::BetaDirectCaller::OrHash,
                  Anthropic::Beta::BetaServerToolCaller::OrHash,
                  Anthropic::Beta::BetaServerToolCaller20260120::OrHash
                ),
              content:
                T.any(
                  T.any(
                    Anthropic::Beta::BetaWebSearchToolResultError::OrHash,
                    T::Array[Anthropic::Beta::BetaWebSearchResultBlock::OrHash]
                  ),
                  T.any(
                    Anthropic::Beta::BetaWebFetchToolResultErrorBlock::OrHash,
                    Anthropic::Beta::BetaWebFetchBlock::OrHash
                  ),
                  T.any(
                    Anthropic::Beta::BetaAdvisorToolResultError::OrHash,
                    Anthropic::Beta::BetaAdvisorResultBlock::OrHash,
                    Anthropic::Beta::BetaAdvisorRedactedResultBlock::OrHash
                  ),
                  T.any(
                    Anthropic::Beta::BetaCodeExecutionToolResultError::OrHash,
                    Anthropic::Beta::BetaCodeExecutionResultBlock::OrHash,
                    Anthropic::Beta::BetaEncryptedCodeExecutionResultBlock::OrHash
                  ),
                  T.any(
                    Anthropic::Beta::BetaBashCodeExecutionToolResultError::OrHash,
                    Anthropic::Beta::BetaBashCodeExecutionResultBlock::OrHash
                  ),
                  T.any(
                    Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::OrHash,
                    Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::OrHash,
                    Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlock::OrHash,
                    Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock::OrHash
                  ),
                  T.any(
                    Anthropic::Beta::BetaToolSearchToolResultError::OrHash,
                    Anthropic::Beta::BetaToolSearchToolSearchResultBlock::OrHash
                  ),
                  Anthropic::Beta::BetaMCPToolResultBlock::Content::Variants,
                  T.nilable(String)
                ),
              tool_use_id: String,
              server_name: String,
              is_error: T::Boolean,
              file_id: String,
              encrypted_content: T.nilable(String),
              from: Anthropic::Beta::BetaFallbackInfo::OrHash,
              to: Anthropic::Beta::BetaFallbackInfo::OrHash,
              trigger: Anthropic::Beta::BetaFallbackRefusalTrigger::OrHash
            ).returns(
              Anthropic::Beta::BetaRawContentBlockStartEvent::ContentBlock::Variants
            )
          end
          def self.new(
            type:,
            # Citations supporting the text block.
            #
            # The type of citation returned will depend on the type of document being cited.
            # Citing a PDF results in `page_location`, plain text results in `char_location`,
            # and content document results in `content_block_location`.
            citations: nil,
            text: nil,
            # A value used to verify that this thinking block was generated by Claude when it
            # is passed back to the API.
            #
            # This is an opaque field and should not be interpreted or parsed. When passing
            # thinking blocks back to the API (required when using tools with extended
            # thinking), pass them back exactly as received, with this field intact.
            #
            # See
            # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)
            # for details.
            signature: nil,
            # The text of Claude's thinking process for this block.
            thinking: nil,
            # The contents of this redacted thinking block, returned when portions of the
            # model's thinking were safety-redacted. This field is opaque and encrypted, with
            # no readable content.
            #
            # Pass `redacted_thinking` blocks back to the API unchanged when continuing a
            # multi-turn conversation.
            #
            # See
            # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking#redacted-thinking-blocks)
            # for details.
            data: nil,
            id: nil,
            input: nil,
            # The name of the MCP tool
            name: nil,
            # Tool invocation directly from the model.
            caller_: nil,
            # Code execution result with encrypted stdout for PFC + web_search results.
            content: nil,
            tool_use_id: nil,
            # The name of the MCP server
            server_name: nil,
            is_error: nil,
            file_id: nil,
            # Opaque metadata from prior compaction, to be round-tripped verbatim
            encrypted_content: nil,
            # The model whose output ends at this point — the model that declined at this hop.
            # When the declining hop is the requested model, its `model` echoes the top-level
            # `model` string the caller sent (alias or canonical); when the declining hop is a
            # fallback model, its `model` is that model's canonical id.
            from: nil,
            # The fallback model producing the content that follows this block. Its `model` is
            # always the canonical id.
            to: nil,
            # What caused the `from` model to hand over at this hop.
            trigger: nil
          )
          end
        end
      end
    end
  end
end
